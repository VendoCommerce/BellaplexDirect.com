using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using CSBusiness.Web;
using CSBusiness.OrderManagement;
using CSBusiness;
using CSBusiness.Resolver;


namespace CSWeb.AU.UserControls
{
    public partial class TrackingPixels : System.Web.UI.UserControl
    {
        public Order CurrentOrder = null;
        public int i = 1;
        public string versionName = "";
        public int orderId = 0;
        public string productName = "";
        public string productCategory = "";
        public string productPrice = "";
        public string productBrand = "";
        public string productImageUrl = "";
        public string productSku = "";
        public string shoppingCartValue = "";
        public string shoppingCartQuantity = "";
        public string productIds = "";
        public decimal OrderAmount = 0;
        public string productQuantities;

        private ClientCartContext CartContext
        {
            get
            {
                return Session["ClientOrderData"] != null ? Session["ClientOrderData"] as ClientCartContext : null;
            }
        }
        protected void Page_Load(object sender, EventArgs e)
        {
            if (Request["oid"] != null)
            {
                orderId = Convert.ToInt32(Request["oid"].ToString());
            }
            else
            {
                orderId = CartContext.OrderId; 
            }
            versionName = CSWeb.OrderHelper.GetVersionName();
            SetHomePagePnl();
            SetAllPagesPnl();
            SetCartPagesPnl();
            SetPostSalePagePnl();
            SetReceiptPagePnl();
            SetCardDeclinePnl();
        }

        private void SetCardDeclinePnl()
        {
            if (Request.RawUrl.ToLower().Contains("carddecline"))
            {
                pnlCardDecline.Visible = true;
            }
            else
            {
                pnlCardDecline.Visible = false;
            }
        }

        private void SetCurrentOrder()
        {
            int orderId = 0;
            if (Request["oid"] != null)
            {
                orderId = Convert.ToInt32(Request["oid"].ToString());
            }
            else if (CartContext != null)
            {
                orderId = CartContext.OrderId;
            }
            CurrentOrder = new OrderManager().GetBatchProcessOrders(orderId);
            CurrentOrder.LoadAttributeValues();

            LiteralOfferId.Text = "trykeranique.com";
            if (CurrentOrder.CustomFiledInfo != null && CurrentOrder.CustomFiledInfo.Count > 0)
            {
                try
                {
                    if (CurrentOrder.CustomFiledInfo.Find(x => x.FieldName.ToLower() == "afid") != null)
                    {
                        LiteralID.Text = CurrentOrder.CustomFiledInfo.Find(x => x.FieldName.ToLower() == "afid").FieldValue.ToString();
                    }
                    if (CurrentOrder.CustomFiledInfo.Find(x => x.FieldName.ToLower() == "sid") != null)
                    {
                        LiteralSid.Text = CurrentOrder.CustomFiledInfo.Find(x => x.FieldName.ToLower() == "sid").FieldValue.ToString();
                    }

                }
                catch { }
            }

            LiteraltotalChargedMainItem.Text = (CurrentOrder.SubTotal + CurrentOrder.ShippingCost + CurrentOrder.Tax).ToString();
            if (CurrentOrder.CreditInfo.CreditCardNumber.Equals("4111111111111111") && CurrentOrder.CreditInfo.CreditCardCSC.Equals("911"))
            {
                pnlPixels.Visible = true;
            }
            else if (CurrentOrder.AttributeValues["response"] != null && CurrentOrder.AttributeValues["response"].Value.ToLower().Contains("good") && CurrentOrder.AttributeValues["response"].Value.ToLower().Contains("approved") && CurrentOrder.AttributeValues["isprepaid"].Value.Equals("false"))
            {
                pnlPixels.Visible = true;
            }
            else
            {
                pnlPixels.Visible = false;
            }

        }
        private void SetHomePagePnl()
        {
            pnlHomePage.Visible = false;
        }
        private void SetAllPagesPnl()
        {
            if (!(Request.RawUrl.ToLower().Contains("receipt") || Request.RawUrl.ToLower().Contains("postsale")))
            {
                pnlAllPages.Visible = true;
            }
            else
            {
                pnlAllPages.Visible = false;
            }
        }

        private void SetCartPagesPnl()
        {
            if (Request.RawUrl.ToLower().Contains("cart"))
            {
                //SetSteelHousePixel();
                pnlCartPages.Visible = true;
            }
            else
            {
                pnlCartPages.Visible = false;
            }
        }
        private void SetPostSalePagePnl()
        {
            if (Request.RawUrl.ToLower().Contains("postsale"))
            {
                if (!IsPostBack)
                {
                    pnlPostSalePageNonPostback.Visible = true;
                }
                else
                {
                    pnlPostSalePageNonPostback.Visible = false;
                }
                pnlPostSalePage.Visible = true;
            }
            else
            {
                pnlPostSalePage.Visible = false;
            }
        }
        private void SetReceiptPagePnl()
        {
            if (Request.RawUrl.ToLower().Contains("receipt"))
            {
                pnlReceiptPage.Visible = true;
                SetCurrentOrder();
                //SetSteelHousePixelReceipt();
            }

        }
        
    }
}