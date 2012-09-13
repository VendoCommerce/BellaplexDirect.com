using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using CSBusiness.Web;
using CSBusiness.OrderManagement;
using CSBusiness;
using System.Text;

namespace CSWeb.Root.UserControls
{
    public partial class SiteCatalystPixel : System.Web.UI.UserControl
    {
        private ClientCartContext CartContext
        {
            get
            {
                return Session["ClientOrderData"] != null ? Session["ClientOrderData"] as ClientCartContext : null;
            }
        }

        protected string State
        {
            get
            {
                if (CartContext != null && CartContext.CustomerInfo != null && CartContext.CustomerInfo.ShippingAddress != null)
                    return CartContext.CustomerInfo.ShippingAddress.StateProvinceName;

                return string.Empty;
            }
        }

        protected string ZipCode
        {
            get
            {
                if (CartContext != null && CartContext.CustomerInfo != null && CartContext.CustomerInfo.ShippingAddress != null)
                    return CartContext.CustomerInfo.ShippingAddress.ZipPostalCode;

                return string.Empty;
            }
        }

        protected string OrderId
        {
            get
            {
                return CartContext != null ? CartContext.OrderId.ToString() : string.Empty;
            }
        }

        protected void Page_Load(object sender, EventArgs e)
        {    
        
        }

        public static string GetVersionName()
        {
            string version = CSWeb.OrderHelper.GetVersionName();
            return string.IsNullOrEmpty(version) ? "A1" : version;
        }

        public string GetPageName(HttpContext context)
        {
            string _version = context.Request.Url.AbsolutePath.ToString().ToUpper();
            string _pageName = "Home";

            if (_version.IndexOf("INDEX") > -1) _pageName = "HOME";
            if (_version.IndexOf("FAQ") > -1) _pageName = "FAQS";
            if (_version.IndexOf("TESTIMONIALS") > -1) _pageName = "Testimonials";
            if (_version.IndexOf("CONTACT") > -1) _pageName = "Contact";
            if (_version.IndexOf("PRIVACY") > -1) _pageName = "Privacy";
            if (_version.IndexOf("RETURN") > -1) _pageName = "Return";
            if (_version.IndexOf("CART") > -1) _pageName = "Cart";

            if (_version.IndexOf("POSTSALE") > -1)
            {
                if (!IsPostBack)
                {
                    _pageName = "One Pay Upsell";
                }
                else
                {
                    _pageName = "Cross Sells";

                }
            }
            if (_version.IndexOf("RECEIPT") > -1) _pageName = "Receipt";
            if (_version.IndexOf("DONOTGO") > -1) _pageName = "Exit Pop";
            if (_version.IndexOf("CART2") > -1) _pageName = "Exit Pop Cart";

            return _pageName;
        }

        
    }


}