using System;
using System.Linq;
using System.Web.UI;
using System.Web.UI.WebControls;
using CSBusiness;
using System.Web.UI.HtmlControls;
using CSBusiness.Preference;
using CSBusiness.Shipping;
using CSBusiness.OrderManagement;
using CSBusiness.Resolver;
using System.Collections.Generic;


namespace CSWeb.Root.UserControls
{
    public partial class ReviewOrder : System.Web.UI.UserControl
    {

        public bool HideRemoveButton
        {
            get
            {
                return (bool)(ViewState["HideRemoveButton"] ?? false);
            }
            set
            {
                ViewState["HideRemoveButton"] = value;
            }
        }
        
        private ClientCartContext CartContext
        {
            get
            {
                return Session["ClientOrderData"] as ClientCartContext;
            }
        }


        protected void Page_Load(object sender, EventArgs e)
        {
            if (!Page.IsPostBack)
            {
                BindControls(true);
            }
        }

         public void BindControls(bool cartCompute)
         {
             if (CartContext.CartInfo.CartItems.Count > 0)
             {
                dlShoppingCart.DataSource = CartContext.CartInfo.CartItems.FindAll(x => x.Visible == true);
                dlShoppingCart.DataBind();

                 if(cartCompute)
                     CartContext.CartInfo.Compute();       
      
                 lblSubtotal.Text = String.Format("${0:0.00}", CartContext.CartInfo.SubTotal);
                 lblTax.Text = String.Format("${0:0.00}", CartContext.CartInfo.TaxCost);
                 lblShipping.Text = String.Format("${0:0.00}", CartContext.CartInfo.ShippingCost);
                 lblRushShipping.Text = String.Format("${0:0.00}", CartContext.CartInfo.RushShippingCost);
                 lblOrderTotal.Text = String.Format("${0:0.00}", CartContext.CartInfo.Total);

             
                 SitePreference shippingGetShippingPref = CSFactory.GetCacheSitePref();
                  holderRushShippingTotal.Visible = shippingGetShippingPref.IncludeRushShipping ?? false;
             }
             else
             {

                 dlShoppingCart.Visible = false;
             }

         }

         protected void dlShoppingCart_OnItemDataBound(object sender, DataListItemEventArgs e)
         {
             if (e.Item.ItemType == ListItemType.Item || e.Item.ItemType == ListItemType.AlternatingItem)
             {
                 Label lblSkuCode = e.Item.FindControl("lblSkuCode") as Label;
                 Label lblSkuDescription = e.Item.FindControl("lblSkuDescription") as Label;
                 TextBox txtQuantity = e.Item.FindControl("txtQuantity") as TextBox;
                
                 Label lblSkuInitialPrice = e.Item.FindControl("lblSkuInitialPrice") as Label;
                 ImageButton btnRemoveItem = e.Item.FindControl("btnRemoveItem") as ImageButton;
                 HtmlContainerControl holderQuantity = e.Item.FindControl("holderQuantity") as HtmlContainerControl;
                 HtmlContainerControl holderRemove = e.Item.FindControl("holderRemove") as HtmlContainerControl;
                 Image imgProduct = e.Item.FindControl("imgProduct") as Image;
                 Sku cartItem = e.Item.DataItem as Sku;
                 lblSkuDescription.Text = cartItem.LongDescription;
                 lblSkuInitialPrice.Text = String.Format("${0:0.##}", cartItem.InitialPrice);
                 lblSkuCode.Text = cartItem.SkuCode.ToString();
                 txtQuantity.Text = cartItem.Quantity.ToString();
                 btnRemoveItem.CommandArgument = cartItem.SkuId.ToString();
                 if (HideRemoveButton)
                 {
                     holderRemove.Visible = false;
                 }
             }
  
         }

         protected void dlShoppingCart_OnItemCommand(object sender, DataListCommandEventArgs e)
         {
             switch (e.CommandName)
             {
                 case "delete":
                     {
                         int skuToRemove = Convert.ToInt32(e.CommandArgument);
                         CartContext.CartInfo.RemoveSku(skuToRemove);
                         BindControls(false);
                      }
                     break;
                 default:
                     break;
             }
         }

         protected void btnUpdate_OnCommand(object sender, CommandEventArgs e)
         {
             
             foreach (DataListItem lst in dlShoppingCart.Items)
             {
                 if ((lst.ItemType == ListItemType.Item) || (lst.ItemType == ListItemType.AlternatingItem))
                 {
                     int skuId = (int)dlShoppingCart.DataKeys[lst.ItemIndex];                 
                     TextBox txtQuantity = (TextBox)lst.FindControl("txtQuantity");
                     Sku cartItem = CartContext.CartInfo.CartItems.FirstOrDefault(c => c.SkuId == skuId);
                     int newQuantity = 0;
                     if (int.TryParse(txtQuantity.Text, out newQuantity))
                         cartItem.Quantity = newQuantity;
                }
             }
             BindControls(true);
         }
        

         protected void btnTry_OnClick(object sender, ImageClickEventArgs e)
         {
             int orderId = CSResolve.Resolve<IOrderService>().SaveOrder(CartContext);
             if (orderId > 1)
             {
                 CartContext.OrderId = orderId;
                 CartContext.ResetData();
                
             }

             Response.Redirect("CheckoutThankYou.aspx");

         }

    }
}