using System;
using System.Collections.Generic;
using System.Linq;
using System.Net.Mail;
using System.Text;
using System.Web;
using System.Xml.Linq;
using CSBusiness;
using CSBusiness.Email;
using CSBusiness.OrderManagement;
using CSBusiness.Payment;
using CSBusiness.Resolver;
using CSCore.Utils;
using CSPaymentProvider;
using CSBusiness.Preference;
using CSCore.DataHelper;
using System.Xml;
using CSBusiness.FulfillmentHouse;


/// <summary>
/// Summary description for OrderHelper
/// </summary>

namespace CSWeb
{
    public class OrderHelper
    {
        #region Order Validation
        public static bool AuthorizeOrder(int orderID)
        {
            Request _request = new Request();

            Order orderData = CSResolve.Resolve<IOrderService>().GetOrderDetails(orderID, true);

            _request.CardNumber = orderData.CreditInfo.CreditCardNumber;
            _request.CardCvv = orderData.CreditInfo.CreditCardCSC;
            _request.CurrencyCode = "$";
            _request.ExpireDate = orderData.CreditInfo.CreditCardExpired;
            _request.Amount = (double)orderData.Total;
            _request.FirstName = orderData.CustomerInfo.BillingAddress.FirstName;
            _request.LastName = orderData.CustomerInfo.BillingAddress.LastName;
            _request.Address1 = orderData.CustomerInfo.BillingAddress.Address1;
            _request.City = orderData.CustomerInfo.BillingAddress.City;
            _request.State = StateManager.GetStateName(orderData.CustomerInfo.BillingAddress.StateProvinceId);
            _request.Country = CountryManager.CountryCode(orderData.CustomerInfo.BillingAddress.CountryId);
            _request.ZipCode = orderData.CustomerInfo.BillingAddress.ZipPostalCode;
            _request.TransactionDescription = orderData.CustomerInfo.BillingAddress.FirstName + " " + orderData.CustomerInfo.BillingAddress.LastName;
            _request.CustomerID = orderData.CustomerId.ToString();
            _request.InvoiceNumber = orderData.OrderId.ToString();

            //Read information from web.config
            //Response _response =   GatewayProvider.Instance("PaymentProvider").PerformRequest(_request);

            //Read information from client DB setting
            Response _response = PaymentProviderRepository.Instance.Get().PerformRequest(_request);


            if (_response != null && _response.ResponseType != TransactionResponseType.Approved)
            {
                CSResolve.Resolve<IOrderService>().SaveOrder(orderData.OrderId, _response.TransactionID, _response.AuthCode, 7);

                return false;
            }
            else if (_response != null && _response.ResponseType == TransactionResponseType.Approved)
            {
                CSResolve.Resolve<IOrderService>().SaveOrder(orderData.OrderId, _response.TransactionID, _response.AuthCode, 4);
                return true;
            }

            return true;
        }

        #endregion Order Validation

        #region Emails
        public static bool SendOrderCompletedEmail(int orderId)
        {
            //pull Specific Email Template
            int emailId = ConfigHelper.EmailAppSetting("EmailId");

            EmailSetting emailTemplate = EmailManager.GetEmail(emailId);
            OrderManager orderMgr = new OrderManager();
            Order orderData = orderMgr.GetOrderDetails(orderId);


            if (emailTemplate.Body != null)
            {
                //Subject Translation
                emailTemplate.Subject = emailTemplate.Subject.Replace("{ORDER_NUMBER}", orderData.OrderId.ToString());

                //Body Translation
                String BodyTemplate = emailTemplate.Body.Replace("&", "&amp;");

                BodyTemplate = BodyTemplate.Replace("{SUBTOTAL}", orderData.SubTotal.ToString("N2"));
                BodyTemplate = BodyTemplate.Replace("{SHIPPING_HANDLING}", orderData.ShippingCost.ToString("N2"));
                BodyTemplate = BodyTemplate.Replace("{TAX}", orderData.Tax.ToString("N2"));
                BodyTemplate = BodyTemplate.Replace("{TOTAL}", orderData.Total.ToString("N2"));
                BodyTemplate = BodyTemplate.Replace("{ORDER_ID}", orderData.OrderId.ToString());
                BodyTemplate = BodyTemplate.Replace("{ORDER_NUMBER}", orderData.OrderId.ToString());
                BodyTemplate = BodyTemplate.Replace("{ORDER_DATE}", orderData.CreatedDate.ToString("dd MMM yyyy hh:mm:ss"));

                CSBusiness.CustomerManagement.Address billing = orderData.CustomerInfo.BillingAddress;
                if (billing != null)
                {

                    BodyTemplate = BodyTemplate.Replace("{BILLING_COMPANY}", CommonHelper.EnsureNotNull(billing.Company));
                    BodyTemplate = BodyTemplate.Replace("{BILLING_ADDRESS2}", CommonHelper.EnsureNotNull(billing.Address2));
                    BodyTemplate = BodyTemplate.Replace("{BILLING_NAME}", billing.FirstName + " " + billing.LastName);
                    BodyTemplate = BodyTemplate.Replace("{BILLING_ADDRESS}", billing.Address1);
                    BodyTemplate = BodyTemplate.Replace("{BILLING_CITY}", billing.City);
                    BodyTemplate = BodyTemplate.Replace("{BILLING_STATE}", StateManager.GetStateName(billing.StateProvinceId)); //pull from Cache
                    BodyTemplate = BodyTemplate.Replace("{BILLING_ZIP}", billing.ZipPostalCode);
                    BodyTemplate = BodyTemplate.Replace("{BILLING_EMAIL}", orderData.Email);
                    BodyTemplate = BodyTemplate.Replace("{BILLING_COUNTRY}", CountryManager.CountryName(billing.CountryId)); //pull from Cache

                }



                CSBusiness.CustomerManagement.Address shippingAddress = orderData.CustomerInfo.ShippingAddress;
                if (shippingAddress != null)
                {
                    BodyTemplate = BodyTemplate.Replace("{SHIPPING_COMPANY}", CommonHelper.EnsureNotNull(shippingAddress.Company));
                    BodyTemplate = BodyTemplate.Replace("{SHIPPING_NAME}", shippingAddress.FirstName + " " + shippingAddress.LastName);
                    BodyTemplate = BodyTemplate.Replace("{SHIPPING_ADDRESS}", shippingAddress.Address1);
                    BodyTemplate = BodyTemplate.Replace("{SHIPPING_ADDRESS2}", CommonHelper.EnsureNotNull(shippingAddress.Address2));
                    BodyTemplate = BodyTemplate.Replace("{SHIPPING_CITY}", shippingAddress.City);
                    BodyTemplate = BodyTemplate.Replace("{SHIPPING_STATE}", StateManager.GetStateName(shippingAddress.StateProvinceId)); //pull from Cache
                    BodyTemplate = BodyTemplate.Replace("{SHIPPING_ZIP}", shippingAddress.ZipPostalCode);
                    BodyTemplate = BodyTemplate.Replace("{SHIPPING_COUNTRY}", CountryManager.CountryName(shippingAddress.CountryId)); //pull from Cache
                    BodyTemplate = BodyTemplate.Replace("{SHIPPING_PHONE}", CommonHelper.EnsureNotNull(shippingAddress.PhoneNumber));
                }

                XElement elem = XElement.Parse("<root>" + BodyTemplate + "</root>", LoadOptions.PreserveWhitespace);
                var nodes = from XElement e in elem.Descendants()
                            where e.Attribute("cart") != null
                            select e;

                StringBuilder sb = new StringBuilder();
                foreach (XElement node in nodes)
                {
                    string originalString = node.ToString();

                    int totalSkuItems = orderData.SkuItems.Count;
                    for (int i = 0; i < totalSkuItems; i++)
                    {
                        Sku sku = orderData.SkuItems[i];
                        string resultString = originalString;
                        resultString = resultString
                            .Replace("{SKU}", sku.SkuCode)
                            .Replace("{SKU_QTY}", sku.Quantity.ToString())
                            .Replace("{SKU_DESCR}", sku.LongDescription)
                            .Replace("{SKU_PRICE}", sku.FullPrice.ToString("N2"));

                        sb.Append(resultString);
                    }
                    BodyTemplate = BodyTemplate.Replace(originalString, sb.ToString());
                    sb.Clear();
                    BodyTemplate = BodyTemplate.Replace("&amp;", "&");
                }


                try
                {
                    //Prepare Mail Message
                    MailMessage _oMailMessage = new MailMessage(emailTemplate.FromAddress, orderData.Email, emailTemplate.Subject, BodyTemplate);
                    _oMailMessage.IsBodyHtml = true;
                    SendMail(_oMailMessage);
                    //Fire OrderConfirmation Log
                    orderMgr.FireEmailLog(orderData.OrderId, orderData.Email, emailTemplate.Subject, BodyTemplate, DateTime.Now);
                    return true;
                }
                catch (Exception)
                {
                    return false;
                }

            }
            else
                return false;
        }
        public static bool SendEmailToAdmins(int orderId)
        {
            //pull Specific Email Template
            int emailId = ConfigHelper.EmailAppSetting("AdminAlertEmailId");
            EmailSetting emailTemplate = EmailManager.GetEmail(emailId);

            if (emailTemplate.Body != null)
            {
                //Body Translation
                String BodyTemplate = emailTemplate.Body.Replace("&", "&amp;");
                BodyTemplate = BodyTemplate.Replace("{OrderId}", orderId.ToString());
                BodyTemplate = BodyTemplate.Replace("&amp;", "&");
                try
                {
                    //Prepare Mail Message
                    MailMessage _oMailMessage = new MailMessage(emailTemplate.FromAddress, emailTemplate.ToAddress, emailTemplate.Subject, BodyTemplate);
                    _oMailMessage.IsBodyHtml = true;
                    SendMail(_oMailMessage);
                    return true;
                }
                catch (Exception)
                {
                    return false;
                }

            }
            else
                return false;
        }


        public static bool SendMail(MailMessage oMsg)
        {

            bool bResult = false;

            try
            {
                SmtpClient client;
                oMsg.BodyEncoding = System.Text.Encoding.UTF8;
                oMsg.CC.Clear();
                oMsg.Bcc.Clear();
                client = new SmtpClient();
                client.Send(oMsg);
                bResult = true;

            }
            catch (Exception)
            {

                bResult = false;
            }
            return bResult;
        }
        #endregion Emails

        public static int GetVersion()
        {
            int versionId = 1;
            string version = HttpContext.Current.Request.Url.AbsolutePath.ToLower();
            version = version.Substring(0, version.LastIndexOf('/'));
            version = version.Substring(version.LastIndexOf('/') + 1, (version.Length - (version.LastIndexOf('/') + 1)));


            List<CSBusiness.Version> list = (CSFactory.GetCacheSitePref()).VersionItems;
            CSBusiness.Version item = list.Find(x => x.Title.ToLower() == version);
            if (item != null)
                versionId = item.VersionId;

            return versionId;
        }
        public static string GetVersionName()
        {
            string versionName = "";
            string version = HttpContext.Current.Request.Url.AbsolutePath.ToLower();
            version = version.Substring(0, version.LastIndexOf('/'));
            version = version.Substring(version.LastIndexOf('/') + 1, (version.Length - (version.LastIndexOf('/') + 1)));


            List<CSBusiness.Version> list = (CSFactory.GetCacheSitePref()).VersionItems;
            CSBusiness.Version item = list.Find(x => x.Title.ToLower() == version);
            if (item != null)
                versionName = item.ShortName;

            return versionName;
        }

        public static XmlNode GetDefaultFulFillmentHouseConfig()
        {
            XmlDocument doc = new XmlDocument();
            List<FulfillmentHouseProviderSetting> allSettings = FulfillmentHouseProviderManger.GetAllProvidersFromDB(true);
            int totalSettings = allSettings.Count;

            for (int i = 0; i < totalSettings; i++)
            {
                FulfillmentHouseProviderSetting settings = allSettings[i];
                if (settings.Active)
                {
                    if (settings.IsDefault)
                    {
                        doc.LoadXml(settings.ProviderXML);
                        return doc.FirstChild;
                    }
                }
            }
            return null;
        }
    }
}
