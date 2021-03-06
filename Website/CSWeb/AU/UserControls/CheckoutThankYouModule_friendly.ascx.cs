using System;
using System.Web;
using System.Web.UI;
using CSBusiness.Resolver;
using CSBusiness.OrderManagement;
using CSBusiness.Cache;
using System.Collections.Generic;
using CSBusiness;
using System.Web.UI.WebControls;
using CSWeb.AU.Store;
using System.Text;

namespace CSWeb.AU.UserControls
{
    /// <summary>
    /// 
    /// </summary>
    public partial class CheckoutThankYouModule_friendly : System.Web.UI.UserControl
    {
        protected Literal LiteralSubTotal, LiteralShipping, LiteralTax, LiteralTotal,
            LiteralFirstName, LiteralLastName, LiteralAddress, LiteralCity, LiteralEmail, LiteralZip, LiteralState, LiteralCountry,
            LiteralFirstName_b, LiteralLastName_b, LiteralAddress_b, LiteralCity_b, LiteralZip_b, LiteralState_b, LiteralCountry_b, LiteralRushShipping, LiteralGoogleAnalytics, LiteralID, LiteralSid, LiteralOfferId,
            LiteralAddress2, LiteralAddress2_b, ltOfferDetails, ltOrderNumber;

        protected DataList dlordersList;
        protected Label lblPromotionPrice;
        protected System.Web.UI.WebControls.Panel pnlRushLabel, pnlRush, pnlPromotionalAmount, pnlPromotionLabel;
        protected HyperLink hlPrintLink;
        int orderId = 0;

        private ClientCartContext CartContext
        {
            get
            {
                return Session["ClientOrderData"] as ClientCartContext;
            }
        }


        protected void Page_Load(object sender, EventArgs e)
        {
            if (Request.Params["oId"] != null)
                orderId = Convert.ToInt32(Request.Params["oId"]);
            else
                orderId = CartContext.OrderId;
            if (!this.IsPostBack)
            {
                BindData();
            }
        }

        private void BindData()
        {
            if (orderId > 0)
            {
                Order orderData = CSResolve.Resolve<IOrderService>().GetOrderDetails(orderId);

                dlordersList.DataSource = orderData.SkuItems;
                dlordersList.DataBind();
                LiteralSubTotal.Text = Math.Round(orderData.SubTotal, 2).ToString();
                LiteralShipping.Text = Math.Round(orderData.ShippingCost, 2).ToString();
                LiteralTax.Text = Math.Round(orderData.Tax, 2).ToString();
                LiteralTotal.Text = Math.Round(orderData.Total, 2).ToString();
                if (orderData.RushShippingCost > 0)
                {
                    pnlRushLabel.Visible = true;
                    pnlRush.Visible = true;
                    LiteralRushShipping.Text = Math.Round(orderData.RushShippingCost, 2).ToString();
                }


                if (orderData.DiscountCode.Length > 0)
                {
                    pnlPromotionLabel.Visible = true;
                    pnlPromotionalAmount.Visible = true;

                    lblPromotionPrice.Text = String.Format("(${0:0.00})", orderData.DiscountAmount);
                }


                LiteralFirstName.Text = orderData.CustomerInfo.ShippingAddress.FirstName;
                LiteralLastName.Text = orderData.CustomerInfo.ShippingAddress.LastName;
                LiteralEmail.Text = orderData.CustomerInfo.Email;
                LiteralAddress.Text = orderData.CustomerInfo.ShippingAddress.Address1;
                LiteralAddress2.Text = orderData.CustomerInfo.ShippingAddress.Address2;
                LiteralCity.Text = orderData.CustomerInfo.ShippingAddress.City;
                LiteralZip.Text = orderData.CustomerInfo.ShippingAddress.ZipPostalCode;
                LiteralState.Text = StateManager.GetStateName(orderData.CustomerInfo.ShippingAddress.StateProvinceId);
                LiteralCountry.Text = CountryManager.CountryName(orderData.CustomerInfo.ShippingAddress.CountryId);
                                
                LiteralFirstName_b.Text = orderData.CustomerInfo.BillingAddress.FirstName;
                LiteralLastName_b.Text = orderData.CustomerInfo.BillingAddress.LastName;
                LiteralAddress_b.Text = orderData.CustomerInfo.BillingAddress.Address1;
                LiteralAddress2_b.Text = orderData.CustomerInfo.BillingAddress.Address2;
                LiteralCity_b.Text = orderData.CustomerInfo.BillingAddress.City;
                LiteralZip_b.Text = orderData.CustomerInfo.BillingAddress.ZipPostalCode;
                LiteralState_b.Text = StateManager.GetStateName(orderData.CustomerInfo.BillingAddress.StateProvinceId);
                LiteralCountry_b.Text = CountryManager.CountryName(orderData.CustomerInfo.BillingAddress.CountryId);

                //Google Analutics E-Commerce Pixel
                //LoadGoogleAnalytics(orderData);
                foreach (Sku s in orderData.SkuItems)
                {
                    s.LoadAttributeValues();
                    if (s.AttributeValues.ContainsKey("offerdetailsorderconf") && s.AttributeValues["offerdetailsorderconf"].Value.Length > 2)
                    {
                        ltOfferDetails.Text = s.AttributeValues["offerdetailsorderconf"].Value.ToString();
                    }

                }
                orderData.LoadAttributeValues();
                if (orderData.AttributeValues["customorderid"] != null)
                {
                    ltOrderNumber.Text = orderData.AttributeValues["customorderid"].Value;
                }

            }
        }

    }
}
