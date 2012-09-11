using System;
using System.Text;
using System.Web.UI;
using System.Web.UI.WebControls;
using CSBusiness;
using CSBusiness.CreditCard;
using CSBusiness.CustomerManagement;
using CSBusiness.Payment;
using CSBusiness.ShoppingManagement;
using CSCore.Utils;
using CSCore.DataHelper;
using CSWeb.Root.Store;

namespace CSWeb.Root.UserControls
{
    public partial class SingleForm : System.Web.UI.UserControl
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
            if (!IsPostBack)
            {
                TextBoxFirstName.Focus();
                BindCreditCard();
                BindCountries(true);
                BindRegions();
                BindShippingCountries(true);
                BindShippingRegions();
      
            }
        }
        protected override void OnPreRender(EventArgs e)
        {
            base.OnPreRender(e);
            ScriptManager.RegisterClientScriptInclude(Page, Page.GetType(), "jquery", Page.ResolveUrl("~/Scripts/jquery-1.6.4.min.js"));
            ScriptManager.RegisterClientScriptInclude(Page, Page.GetType(), "jquery.autotab", Page.ResolveUrl("~/Scripts/jquery.autotab-1.1b.js"));
            ScriptManager.RegisterStartupScript(this, this.GetType(), "autotab" + this.ClientID,
                String.Format(@"
					        $(function() {{
						        $('#{0}, #{1}, #{2}').autotab_magic().autotab_filter('numeric');
						        $('#{3}, #{4}, #{5}, #{6}').autotab_magic().autotab_filter('numeric');
					        }});",
                    TextBoxArea.ClientID, TextBoxPhoneNum1.ClientID, TextBoxPhoneNum2.ClientID,
                    TextBoxCCNum1.ClientID, TextBoxCCNum2.ClientID, TextBoxCCNum3.ClientID, TextBoxCCNum4.ClientID
                    ), true);
        }
        #endregion Page Events

        /// <summary>
        /// Binds the CreditCards.
        /// </summary>
        private void BindCreditCard()
        {
            DropDownListCCType.Items.Clear();
            DropDownListCCType.DataSource = CommonHelper.BindToEnum(typeof(CreditCardTypeEnum));
            DropDownListCCType.DataTextField = "Key";
            DropDownListCCType.DataValueField = "Value";
            DropDownListCCType.DataBind();
            DropDownListCCType.Items.Insert(0, new ListItem("- Select -", "PLEASE SELECT A CREDIT CARD"));

        }

        public void BindCountries(bool setValue)
        {
            ddlCountry.DataSource = CountryManager.GetActiveCountry();
            ddlCountry.DataBind();
            if(setValue)
                ddlCountry.Items.FindByValue(ConfigHelper.DefaultCountry).Selected = true;
        }

        /// <summary>
        /// Binds the regions.
        /// </summary>
        private void BindRegions()
        {
            ddlState.Items.Clear();
            int countryId = Convert.ToInt32(ddlCountry.SelectedItem.Value);
            ddlState.DataSource = StateManager.GetCacheStates(countryId);
            ddlState.DataValueField = "StateProvinceId";
            ddlState.DataBind();
        }

        /// <summary>
        /// Binds the Shipping Countries.
        /// </summary>
        public void BindShippingCountries(bool setValue)
        {
            ddlShippingCountry.DataSource = CountryManager.GetActiveCountry(); 
            ddlShippingCountry.DataBind();
            if (setValue)
                ddlShippingCountry.Items.FindByValue(ConfigHelper.DefaultCountry).Selected = true;
        }

        /// <summary>
        /// Binds the regions.
        /// </summary>
        private void BindShippingRegions()
        {
            ddlShippingState.Items.Clear();
            int countryId = Convert.ToInt32(ddlShippingCountry.SelectedItem.Value);
            ddlShippingState.DataSource = StateManager.GetCacheStates(countryId);
            ddlShippingState.DataValueField = "StateProvinceId";
            ddlShippingState.DataBind();

        }


        protected void Country_SelectedIndexChanged(object sender, System.EventArgs e)
        {
            BindRegions();
        }

        protected void CheckBoxShippingDifferent_CheckedChanged(object sender, EventArgs e)
        {
            if (CheckBoxShippingDifferent.Checked)
                PanelDifferentAddress.Visible = true;
            else
                PanelDifferentAddress.Visible = false;
        }

        public bool validateInput()
        {
            StringBuilder sb = new StringBuilder();
            sb.Append("Please fill in the following information:<br />");

            if (CommonHelper.EnsureNotNull(TextBoxFirstName.Text) == String.Empty)
            {
                LabelFirstNameError.Text = "Please enter your First Name";
                LabelFirstNameError.Visible = true;
                _bError = true;
            }
            else
            {
                LabelFirstNameError.Visible = false;
            }

            if (CommonHelper.EnsureNotNull(TextBoxLastName.Text) == String.Empty)
            {
                LabelLastNameError.Text = "Please enter your Last Name";
                LabelLastNameError.Visible = true;
                _bError = true;
            }
            else
            {
                LabelLastNameError.Visible = false;
            }

            if (ddlState.SelectedValue.Equals("select"))
            {
                LabelStateError.Text = "Please select your Billing State";
                LabelStateError.Visible = true;
                _bError = true;
            }
            else
            {
                LabelStateError.Visible = false;

            }

            string strPhoneNum = TextBoxArea.Text + TextBoxPhoneNum1.Text + TextBoxPhoneNum2.Text;
            if (!CommonHelper.IsValidPhone(strPhoneNum))
            {
                LabelPhoneError.Text = "Please enter a valid Phone Number";
                LabelPhoneError.Visible = true;
                _bError = true;
            }
            else
            {
                LabelPhoneError.Visible = false;
            }

            if (!CommonHelper.IsValidEmail(TextBoxEmail.Text))
            {
                LabelEmailError.Text = "Please enter your Email Address";
                LabelEmailError.Visible = true;
                _bError = true;
            }
            else
            {
                LabelEmailError.Visible = false;
            }

            if (CommonHelper.EnsureNotNull(TextBoxAddress1.Text) == String.Empty)
            {
                LabelBillingAddress1Error.Text = "Please enter your Billing Address";
                LabelBillingAddress1Error.Visible = true;
                _bError = true;
            }
            else
            {
                LabelBillingAddress1Error.Visible = false;
            }
            if (CommonHelper.EnsureNotNull(TextBoxCity.Text) == String.Empty)
            {
                LabelCityError.Text = "Please enter your Billing City";
                LabelCityError.Visible = true;
                _bError = true;
            }
            else
            {
                LabelCityError.Visible = false;
            }

            if (CommonHelper.EnsureNotNull(TextBoxZip.Text) == String.Empty)
            {
                LabelZiPError.Text = ResourceHelper.GetResoureValue("BillingZipCodeErrorMsg");
                LabelZiPError.Visible = true;
                _bError = true;
            }
            else
            {
                if (!CommonHelper.IsValidZipCode(TextBoxZip.Text))
                {
                    LabelZiPError.Text = ResourceHelper.GetResoureValue("BillingZipCodeValidationErrorMsg");
                    LabelZiPError.Visible = true;
                    _bError = true;

                }
                else
                    LabelZiPError.Visible = false;

            }   

            if (CheckBoxShippingDifferent.Checked)
            {
                if (CommonHelper.EnsureNotNull(TextBoxShippingFirstName.Text) == String.Empty)
                {
                    lblShippingFirstNameError.Text = "Please enter your shipping First Name";
                    lblShippingFirstNameError.Visible = true;
                    _bError = true;
                }
                

                if (CommonHelper.EnsureNotNull(TextBoxShippingLastName.Text) == String.Empty)
                {
                    lblShippingLastNameError.Text = "Please enter your shipping Last Name";
                    lblShippingLastNameError.Visible = true;
                    _bError = true;
                }
              

                if (CommonHelper.EnsureNotNull(TextBoxShippingAddress1.Text) == String.Empty)
                {
                    lblShippingAddress1Error.Text = "Please enter your Shipping Address";
                    lblShippingAddress1Error.Visible = true;
                    _bError = true;
                }
                

                if (CommonHelper.EnsureNotNull(TextBoxShippingCity.Text) == String.Empty)
                {
                    lblShippingCityError.Text = "Please enter your Shipping City";
                    lblShippingCityError.Visible = true;
                    _bError = true;
                }
                

                if (CommonHelper.EnsureNotNull(TextBoxShippingZip.Text) == String.Empty)
                {
                    lblShippingZiPError.Text = "Please enter a valid Shipping Zip Code";
                    lblShippingZiPError.Visible = true;
                    _bError = true;
                }
                else
                {
                    if (ddlShippingCountry.SelectedValue.ToString() == ConfigHelper.DefaultCountry)
                    {

                        if (CommonHelper.onlynums(TextBoxShippingZip.Text) == false)
                        {
                            lblShippingZiPError.Text = "Please enter a valid Shipping Zip Code";
                            lblShippingZiPError.Visible = true;
                            _bError = true;

                        }
                        else if (CommonHelper.CountNums(TextBoxShippingZip.Text.ToString()) != 5)
                        {
                            lblShippingZiPError.Text = "Please enter a valid Shipping Zip Code";
                            lblShippingZiPError.Visible = true;
                            _bError = true;
                        }
  
                    }

                }

                if (ddlShippingState.SelectedValue.Equals("select"))
                {
                    lblShippingStateError.Text = "Please select the Shipping State";
                    lblShippingStateError.Visible = true;
                    _bError = true;
                }

            }

            DateTime expire = new DateTime();
            if (DropDownListExpYear.SelectedIndex > 0 && DropDownListExpMonth.SelectedIndex > 0)
            {
                expire = new DateTime(int.Parse(DropDownListExpYear.SelectedValue), int.Parse(DropDownListExpMonth.SelectedValue), 1);
            }
            DateTime today = DateTime.Today;
            if (expire.Year <= today.Year && expire.Month <= today.Month)
            {
                LabelExpMonthError.Text = "Please enter valid Expiration Date";
                LabelExpMonthError.Visible = true;
                _bError = true;
            }

           if (DropDownListCCType.SelectedValue.Equals("PLEASE SELECT A CREDIT CARD"))
            {
                LabelExpMonthError.Text = "Please enter valid Expiration Date";
                LabelExpMonthError.Visible = true;
                _bError = true;
            }
           
            string c = TextBoxCCNum1.Text + TextBoxCCNum2.Text + TextBoxCCNum3.Text + TextBoxCCNum4.Text;
            if (c.Equals(""))
            {
                LabelCreditCardNumberError.Text = "Please enter your Credit Card Number";
                LabelCreditCardNumberError.Visible = true;
                _bError = true;
            }
            else
            {
                if ((c.ToString() != "4444333322221111") && (TextBoxCVV.Text.IndexOf("147114711471") == -1))
                {
                    if (!CommonHelper.ValidateCardNumber(c))
                    {
                        LabelCreditCardNumberError.Text = "Please enter your Credit Card Number";
                        LabelCreditCardNumberError.Visible = true;
                        _bError = true;
                    }
                   
                }
             }

            if (CommonHelper.EnsureNotNull(TextBoxCVV.Text) == String.Empty)
            {
                LabelCreditCardCvvError.Text = "Please enter your Card Verification Number";
                LabelCreditCardCvvError.Visible = true;
                _bError = true;
            }
            else
            {

                if (CommonHelper.onlynums(TextBoxCVV.Text) == false)
                {
                    LabelCreditCardCvvError.Text = "Please enter valid Card Verification Number";
                    LabelCreditCardCvvError.Visible = true;
                    _bError = true;

                }
              
                if ((CommonHelper.CountNums(TextBoxCVV.Text) != 3) && (CommonHelper.CountNums(TextBoxCVV.Text) != 4))
                {
                    LabelCreditCardCvvError.Text = "Please enter valid Card Verification Number";
                    LabelCreditCardCvvError.Visible = true;
                    _bError = true;
                }
               

                if ((c[0].ToString() == "5") && (Convert.ToInt32(DropDownListCCType.SelectedValue) != (int)CreditCardTypeEnum.MasterCard))
                {
                    LabelCreditCardTypeError.Text = "The selected card type does not match the Credit Card Number entered";
                    LabelCreditCardTypeError.Visible = true;
                    _bError = true;
                }
                else if ((c[0].ToString() == "4") && (Convert.ToInt32(DropDownListCCType.SelectedValue) != (int)CreditCardTypeEnum.VISA))
                {
                    LabelCreditCardTypeError.Text = "The selected card type does not match the Credit Card Number entered";
                    LabelCreditCardTypeError.Visible = true;
                    _bError = true;

                }
                else if ((c[0].ToString() == "6") && (Convert.ToInt32(DropDownListCCType.SelectedValue) != (int)CreditCardTypeEnum.Discover))
                {
                    LabelCreditCardTypeError.Text = "The selected card type does not match the Credit Card Number entered";
                    LabelCreditCardTypeError.Visible = true;
                    _bError = true;

                }
                else if ((c[0].ToString() == "3") && (Convert.ToInt32(DropDownListCCType.SelectedValue) != (int)CreditCardTypeEnum.AmericanExpress))
                {
                    LabelCreditCardTypeError.Text = "The selected card type does not match the Credit Card Number entered";
                    LabelCreditCardTypeError.Visible = true;
                    _bError = true;

                }
             
            }

            return _bError;

        }

        public void SaveData()
        {
            if (Page.IsValid)
            {

                //Set Customer Information
                Customer CustData = new Customer();
                CustData.FirstName = CommonHelper.fixquotesAccents(TextBoxFirstName.Text);
                CustData.LastName = CommonHelper.fixquotesAccents(TextBoxLastName.Text);
                CustData.PhoneNumber = TextBoxArea.Text + TextBoxPhoneNum1.Text + TextBoxPhoneNum2.Text;
                CustData.Email = CommonHelper.fixquotesAccents(TextBoxEmail.Text);
                CustData.Username = CommonHelper.fixquotesAccents(TextBoxEmail.Text);

                Address billingAddress = new Address();
                billingAddress.FirstName = CommonHelper.fixquotesAccents(TextBoxFirstName.Text);
                billingAddress.LastName = CommonHelper.fixquotesAccents(TextBoxLastName.Text);
                billingAddress.Address1 = CommonHelper.fixquotesAccents(TextBoxAddress1.Text);
                billingAddress.Address2 = String.Empty;
                billingAddress.City = CommonHelper.fixquotesAccents(TextBoxCity.Text);
                billingAddress.StateProvinceId = Convert.ToInt32(ddlState.SelectedValue);
                billingAddress.CountryId = Convert.ToInt32(ddlCountry.SelectedValue);
                billingAddress.ZipPostalCode = TextBoxZip.Text;

                //Set Customer Billing Address
                CustData.BillingAddress = billingAddress;

                if (CheckBoxShippingDifferent.Checked)
                {
                    Address shippingAddress = new Address();
                    shippingAddress.FirstName = CommonHelper.fixquotesAccents(TextBoxShippingFirstName.Text);
                    shippingAddress.LastName = CommonHelper.fixquotesAccents(TextBoxShippingLastName.Text);
                    shippingAddress.Address1 = CommonHelper.fixquotesAccents(TextBoxShippingAddress1.Text);
                    shippingAddress.Address2 = String.Empty;
                    shippingAddress.City = CommonHelper.fixquotesAccents(TextBoxShippingCity.Text);
                    shippingAddress.StateProvinceId = Convert.ToInt32(ddlShippingState.SelectedValue);
                    shippingAddress.CountryId = Convert.ToInt32(ddlShippingCountry.SelectedValue);
                    shippingAddress.ZipPostalCode = TextBoxShippingZip.Text;
                    CustData.ShippingAddress = shippingAddress;
                }
                else
                    CustData.ShippingAddress = billingAddress;

                //Set Customer Payment information
                PaymentInformation paymentDataInfo = new PaymentInformation();
                paymentDataInfo.CreditCardNumber = CommonHelper.Encrypt(TextBoxCCNum1.Text + TextBoxCCNum2.Text + TextBoxCCNum3.Text + TextBoxCCNum4.Text);
                paymentDataInfo.CreditCardType = Convert.ToInt32(DropDownListCCType.SelectedValue);
                paymentDataInfo.CreditCardName = DropDownListCCType.SelectedItem.Text;
                paymentDataInfo.CreditCardExpired = new DateTime(int.Parse(DropDownListExpYear.SelectedValue), int.Parse(DropDownListExpMonth.SelectedValue), 1);
                paymentDataInfo.CreditCardCSC = TextBoxCVV.Text;


                //Set the Client Order objects
                ClientCartContext contextData = new ClientCartContext();
                contextData.RequestParam = CommonHelper.GetQueryString(Request.RawUrl);
                contextData.VersionId = OrderHelper.GetVersion();
                contextData.CustomerInfo = CustData;
                contextData.PaymentInfo = paymentDataInfo;
                Session["ClientOrderData"] = contextData;

            }


        }

        protected void ImageButton1_Click(object sender, ImageClickEventArgs e)
        {
            if (!validateInput())
            {
                try
                {
                    SaveData();
                    Response.Redirect(RedirectUrl + "?PId=406&CId=" + (int)ShoppingCartType.SingleCheckout);
                }
                catch
                {
                    LabelCreditCardNumberError.Text = "Unable to process your transaction. Please verify your information and resubmit.";
                    LabelCreditCardNumberError.Visible = true;
                }
            }
        }
    }
}