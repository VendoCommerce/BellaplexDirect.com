using System;
using System.Collections.Generic;
using System.Text;
using System.Web.UI;
using CSBusiness;
using CSBusiness.CustomerManagement;
using CSCore.Utils;
using CSCore.DataHelper;
using CSWeb.AU.Store;
using System.Web;
using CSBusiness.Resolver;
using System.Data.SqlClient;
using System.Linq;

namespace CSWeb.AU.UserControls
{

    public partial class BillingForm : System.Web.UI.UserControl
    {
        #region Variable and Events Declaration
        bool _bError = false;
        public string RedirectUrl
        {
            get
            {
                return (string)(ViewState["RedirectUrl"] ?? String.Empty);
            }
            set
            {
                ViewState["RedirectUrl"] = value;
            }
        }
        #endregion Variable and Events Declaration

        #region Page Events

        protected void Page_Load(object sender, EventArgs e)
        {
            if (!CommonHelper.IsHttps(HttpContext.Current))
            {
                if (Request.Url.ToString().Contains("www"))
                {
                    Response.Redirect((Request.Url.ToString().Replace("http:/", "https:/").Replace("www", "secure")));
                }
                else
                {
                    Response.Redirect((Request.Url.ToString().Replace("http:/", "https:/").Replace("secure.", "").Replace("https://", "https://secure.")));
                }
            }
            if (!IsPostBack)
            {
                txtFirstName.Focus();
                rfvFirstName.ErrorMessage = ResourceHelper.GetResoureValue("FirstNameErrorMsg");
                rfvLastName.ErrorMessage = ResourceHelper.GetResoureValue("LastNameErrorMsg");
                rfvAddress1.ErrorMessage = ResourceHelper.GetResoureValue("BillingAddress1ErrorMsg");
                rfvCity.ErrorMessage = ResourceHelper.GetResoureValue("BillingCityErrorMsg");
                rfvZipCode.ErrorMessage = ResourceHelper.GetResoureValue("BillingZipCodeErrorMsg");
                rfvEmail.ErrorMessage = ResourceHelper.GetResoureValue("EmailErrorMsg");
                revEmail.ErrorMessage = ResourceHelper.GetResoureValue("EmailValidationErrorMsg");
                rfvPhoneNumber.ErrorMessage = ResourceHelper.GetResoureValue("PhoneNumberErrorMsg");
            }

            if (!IsPostBack)
            {
                BindCountries(true);
                BindRegions();

            }

        }

        protected override void OnPreRender(EventArgs e)
        {
            base.OnPreRender(e);
            //ScriptManager.RegisterClientScriptInclude(Page, Page.GetType(), "jquery", Page.ResolveUrl("~/Scripts/jquery-1.6.4.min.js"));
            ScriptManager.RegisterClientScriptInclude(Page, Page.GetType(), "jquery.autotab", Page.ResolveUrl("~/Scripts/jquery.autotab-1.1b.js"));

            ScriptManager.RegisterStartupScript(this, this.GetType(), "autotab" + this.ClientID,
            String.Format(@"$(function() {{$('#{0}, #{1}, #{2}').autotab_magic().autotab_filter('numeric')}});",
                    txtPhoneNumber1.ClientID, txtPhoneNumber2.ClientID, txtPhoneNumber3.ClientID), true);

        }

        #endregion Page Events

        #region General Methods

        /// <summary>
        /// List of Country from Cache Data
        /// </summary>
        public void BindCountries(bool setValue)
        {

            ddlCountry.DataSource = CountryManager.GetActiveCountry().Where(x => x.Name == "Australia");
            ddlCountry.DataBind();
            
        }

        /// <summary>
        /// List of States from Cache Data
        /// </summary>
        private void BindRegions()
        {

            ddlState.Items.Clear();
            int countryId = Convert.ToInt32(ddlCountry.SelectedItem.Value);
            List<StateProvince> list = StateManager.GetCacheStates(countryId);
            ddlState.DataSource = list;
            ddlState.DataValueField = "StateProvinceId";
            ddlState.DataBind();
        }


        protected void Country_SelectedIndexChanged(object sender, System.EventArgs e)
        {
            BindRegions();
        }
        public bool validateInput()
        {
            if (CommonHelper.EnsureNotNull(txtFirstName.Text) == String.Empty)
            {
                lblFirstNameError.Text = ResourceHelper.GetResoureValue("FirstNameErrorMsg");
                lblFirstNameError.Visible = true;
                _bError = true;
            }
            else
                lblFirstNameError.Visible = false;

            if (CommonHelper.EnsureNotNull(txtLastName.Text) == String.Empty)
            {
                lblLastNameError.Text = ResourceHelper.GetResoureValue("LastNameErrorMsg");
                lblLastNameError.Visible = true;
                _bError = true;

            }
            else
                lblLastNameError.Visible = false;

            if (CommonHelper.EnsureNotNull(txtAddress1.Text) == String.Empty)
            {
                lblAddress1Error.Text = ResourceHelper.GetResoureValue("Address1ErrorMsg");
                lblAddress1Error.Visible = true;
                _bError = true;
            }
            else
                lblAddress1Error.Visible = false;

            if (CommonHelper.EnsureNotNull(txtCity.Text) == String.Empty)
            {
                lblCityError.Text = ResourceHelper.GetResoureValue("CityErrorMsg");
                lblCityError.Visible = true;
                _bError = true;
            }
            else
                lblCityError.Visible = false;


            if (ddlState.SelectedValue.Equals("select"))
            {
                lblStateError.Text = ResourceHelper.GetResoureValue("StateErrorMsg");
                lblStateError.Visible = true;
                _bError = true;
            }
            else
                lblStateError.Visible = false;

            string strPhoneNum = txtPhoneNumber1.Text + txtPhoneNumber2.Text + txtPhoneNumber3.Text;

            if (!CommonHelper.IsValidPhone(strPhoneNum))
            {
                lblPhoneNumberError.Text = ResourceHelper.GetResoureValue("PhoneNumberErrorMsg");
                lblPhoneNumberError.Visible = true;
                _bError = true;
            }
            else
                lblPhoneNumberError.Visible = false;

            if (CommonHelper.EnsureNotNull(txtZipCode.Text) == String.Empty)
            {
                lblZiPError.Text = ResourceHelper.GetResoureValue("ZipCodeErrorMsg");
                lblZiPError.Visible = true;
                _bError = true;
            }
            else
            {
                if (!CommonHelper.IsValidZipCodeAustralian(txtZipCode.Text))
                {
                    lblZiPError.Text = ResourceHelper.GetResoureValue("ZipCodeValidationErrorMsg");
                    lblZiPError.Visible = true;
                    _bError = true;

                }
                else
                    lblZiPError.Visible = false;

            }

            if (CommonHelper.EnsureNotNull(txtEmail.Text) == String.Empty)
            {
                lblEmailError.Text = ResourceHelper.GetResoureValue("EmailErrorMsg");
                lblEmailError.Visible = true;
                _bError = true;
            }
            else
            {
                if (!CommonHelper.IsValidEmail(txtEmail.Text))
                {
                    lblEmailError.Text = ResourceHelper.GetResoureValue("EmailValidationErrorMsg");
                    lblEmailError.Visible = true;
                    _bError = true;
                }
                else
                    lblEmailError.Visible = false;
            }
            
            return _bError;

        }

        protected void imgBtn_OnClick(object sender, EventArgs e)
        {
            if (!validateInput())
            {
                SaveData();
                Response.Redirect(RedirectUrl + "?PId=406&CId=" + (int)CSBusiness.ShoppingManagement.ShoppingCartType.ShippingCreditCheckout);
            }


        }
        public void SaveData()
        {
            if (Page.IsValid)
            {
                //Set Customer Information
                Address billingAddress = new Address();
                billingAddress.FirstName = CommonHelper.fixquotesAccents(txtFirstName.Text);
                billingAddress.LastName = CommonHelper.fixquotesAccents(txtLastName.Text);
                billingAddress.Address1 = CommonHelper.fixquotesAccents(txtAddress1.Text);
                billingAddress.Address2 = CommonHelper.fixquotesAccents(txtAddress2.Text);
                billingAddress.City = CommonHelper.fixquotesAccents(txtCity.Text);
                billingAddress.StateProvinceId = Convert.ToInt32(ddlState.SelectedValue);
                billingAddress.CountryId = Convert.ToInt32(ddlCountry.SelectedValue);
                billingAddress.ZipPostalCode = txtZipCode.Text;

                Customer CustData = new Customer();
                CustData.FirstName = CommonHelper.fixquotesAccents(txtFirstName.Text);
                CustData.LastName = CommonHelper.fixquotesAccents(txtLastName.Text);
                CustData.PhoneNumber = txtPhoneNumber1.Text + txtPhoneNumber2.Text + txtPhoneNumber3.Text;
                CustData.Email = CommonHelper.fixquotesAccents(txtEmail.Text);
                CustData.Username = CommonHelper.fixquotesAccents(txtEmail.Text);
                CustData.BillingAddress = billingAddress;
                CustData.ShippingAddress = billingAddress;

                //Set the Client Order objects
                ClientCartContext contextData = (ClientCartContext)Session["ClientOrderData"];
                contextData.CustomerInfo = CustData;
                contextData.CartAbandonmentId = CSResolve.Resolve<ICustomerService>().InsertCartAbandonment(CustData, contextData);

                CSWebBase.CSData.CustomerDALHelper.UpdateCartAbandonment(contextData.CartAbandonmentId,
                    contextData.OrderAttributeValues["landing_url"].Value,
                    contextData.OrderAttributeValues["ref_url"].Value);

                Session["ClientOrderData"] = contextData;
            }
        }

        #endregion General Methods

    }
}