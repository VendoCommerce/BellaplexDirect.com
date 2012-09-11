using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Xml.Linq;
using CSBusiness.PostSale;
using CSBusiness;
using System.Text.RegularExpressions;
using CSCore.Utils;
using CSBusiness.OrderManagement;
using CSBusiness.Resolver;
using CSBusiness.ShoppingManagement;

namespace CSWeb.AU.Store
{
    public partial class AuthorizeOrder : ShoppingCartBasePage
    {
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
            if (Request["oid"] != null)
            {
                orderId = Convert.ToInt32(Request["oid"].ToString());
            }
            else
            {
                orderId = CartContext.OrderId;
            }
            Order orderData = CSResolve.Resolve<IOrderService>().GetOrderDetails(orderId);
            if (orderData.OrderStatusId == 2)
            {
                Response.Redirect("receipt.aspx");
            }

            if (!CSFactory.GetSitePreference().FulfillmentHouseService)
            {
                Response.Redirect("receipt.aspx");
            }
            if (!IsPostBack)
            {
                string s = CSWeb.OrderHelper.GetVersionName();
                if (new CSWeb.FulfillmentHouse.Acmg().PostOrder(orderId))
                {
                    if (Request.QueryString != null)
                    {
                        Response.Redirect("receipt.aspx?" + Request.QueryString);
                    }
                    else
                    {
                        Response.Redirect("receipt.aspx");
                    }
                }
                else
                {
                    string[] parts = Request.Url.AbsolutePath.Split(new char[] { '/' }, StringSplitOptions.RemoveEmptyEntries);
                    Response.Redirect(string.Format("carddecline.aspx?returnUrl={0}", string.Concat("/", string.Join("/", parts, 0, parts.Length - 1), "/receipt.aspx")), true);
                }

            }
        }
    }
}