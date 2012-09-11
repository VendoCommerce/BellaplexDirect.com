using System;
using System.Web.UI;
using System.Web.UI.WebControls;
using CSData;
using CSBusiness;
using CSCore.Utils;
using CSBusiness.Coupon;

namespace CSWeb.Admin
{
    public partial class CouponList : BasePage
    {
      

        #region Variable Declaration
        protected bool filter = false;

        #endregion Variable Declaration

        #region Page Load and Pre-Render Events


        protected void Page_Load(object sender, System.EventArgs e)
        {
            //Check Session Validation in BasePage
            this.BaseLoad();
            if (!Page.IsPostBack)
                BindCoupons();

        }


        protected override void OnPreInit(EventArgs e)
        {
            base.OnPreInit(e);

        }
        #endregion Page Load and Pre-Render Events

        #region Common code for the page



        private void BindCoupons()
        {
            dlCouponList.DataSource = CSFactory.GetAllCoupon();
            dlCouponList.DataKeyField = "CouponId";
            dlCouponList.DataBind();
        }



        #endregion Common code for the page

        #region General Methods

        protected void btnAction_Command(object sender, System.Web.UI.WebControls.CommandEventArgs e)
        {

            switch (e.CommandName)
            {
                case "AddNew":
                    pnlAddCategory.Visible = true;
                    BindDiscountType();
                    BindCoupons();
                    break;
                case "Cancel":
                    pnlAddCategory.Visible = false;
                    txtTitle.Text = "";
                    ddlDiscountType.SelectedIndex = 0;
                    break;
                case "Add":
                    if (Page.IsValid)
                    {
                        CSFactory.UpdateCoupon(0, CommonHelper.fixquotesAccents(txtTitle.Text), Math.Round(Convert.ToDecimal(txtPercentage.Text), 2), ddlDiscountType.SelectedValue.Equals("1"), cbVisible.Checked);
                    }


                    pnlAddCategory.Visible = false;
                    txtTitle.Text = "";
                    ddlDiscountType.SelectedIndex = 0;
                    BindCoupons();
                    break;

                case "Back":
                    Response.Redirect("Main.aspx");
                    break;

            }

        }


        private void BindDiscountType()
        {

            ddlDiscountType.Items.Clear();
            ddlDiscountType.DataSource = CommonHelper.BindToEnum(typeof(CouponTypeEnum));
            ddlDiscountType.DataTextField = "Key";
            ddlDiscountType.DataValueField = "Value";
            ddlDiscountType.DataBind();

     
        }


        protected void dlCouponList_ItemDataBound(object sender, DataListItemEventArgs e)
        {
            CouponInfo couponItem = e.Item.DataItem as CouponInfo;
            if (e.Item.ItemType == ListItemType.Item || e.Item.ItemType == ListItemType.AlternatingItem)
            {
               
                ITextControl lblTitle = e.Item.FindControl("lblTitle") as ITextControl;
                ITextControl lblStatus = e.Item.FindControl("lblStatus") as ITextControl;
                ITextControl lblDiscount = e.Item.FindControl("lblDiscount") as ITextControl;
                ITextControl lblDiscountType = e.Item.FindControl("lblDiscountType") as ITextControl;   
                LinkButton lbRemove = e.Item.FindControl("lbRemove") as LinkButton;
                lblTitle.Text = couponItem.Title;
                lblDiscount.Text = String.Format("{0:0.##}", couponItem.Discount);
                lblStatus.Text = couponItem.Active ? "Active" : "Inactive";
                lblDiscountType.Text = couponItem.IsPercentage ? "%" : "$";

       
            }

            if (e.Item.ItemType == ListItemType.EditItem)
            {
                DropDownList ddlEditDiscountType = (DropDownList)e.Item.FindControl("ddlEditDiscountType");
                ddlEditDiscountType.DataSource = CommonHelper.BindToEnum(typeof(CouponTypeEnum));
                ddlEditDiscountType.DataTextField = "Key";
                ddlEditDiscountType.DataValueField = "Value";
                ddlEditDiscountType.DataBind();
                if (couponItem.IsPercentage)
                {
                    ddlEditDiscountType.Items.FindByValue("1").Selected = true;
                }
            }

        }


        protected void dlCouponList_ItemCommand(object sender, DataListCommandEventArgs e)
        {
            int couponId = (int)dlCouponList.DataKeys[e.Item.ItemIndex];
            switch (e.CommandName)
            {
                case "Delete":
                    CSFactory.RemoveCoupon(couponId);
                    BindCoupons();
                    break;
                case "Edit":
                    dlCouponList.EditItemIndex = e.Item.ItemIndex;
                    BindCoupons();
                    break;
                case "Cancel":
                    dlCouponList.EditItemIndex = -1;
                    BindCoupons();
                    break;
                case "Update":
                    TextBox txtEditTitle = (TextBox)e.Item.FindControl("txtEditTitle");
                    TextBox txtEditPercentage = (TextBox)e.Item.FindControl("txtEditPercentage");
                    CheckBox cbEditVisible = (CheckBox)e.Item.FindControl("cbEditVisible");
                    DropDownList ddlEditDiscountType = (DropDownList)e.Item.FindControl("ddlEditDiscountType");
                     CSFactory.UpdateCoupon(couponId, CommonHelper.fixquotesAccents(txtEditTitle.Text.Trim()), Math.Round(Convert.ToDecimal(txtEditPercentage.Text), 2), ddlEditDiscountType.SelectedValue.Equals("1"), cbEditVisible.Checked);
                    dlCouponList.EditItemIndex = -1;
                    BindCoupons();
                    break;
            }
        }

        #endregion General Methods
    }
}