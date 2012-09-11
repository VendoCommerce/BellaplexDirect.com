<%@Control Language="C#" AutoEventWireup="true" Inherits="CSWeb.Root.UserControls.ShippingForm" CodeBehind="ShippingForm.ascx.cs" %>
<asp:ScriptManager runat="server" ID="sm1">
</asp:ScriptManager>
<asp:UpdatePanel ID="upShippingForm" runat="server">
    <ContentTemplate>
        <div class="cartA">
        <div class="form_line"><p>Internet Special, offer not available in stores.
        <br />Terms and conditions apply.</p></div>
            <div class="form_line clearfix">
                <div class="error-1">
                    <asp:RequiredFieldValidator ID="rfvShippingFirstName" runat="server" Display="Dynamic"
                        ControlToValidate="txtShippingFirstName"></asp:RequiredFieldValidator>
                    <asp:Label ID="lblShippingFirstNameError" runat="server" Visible="false">
                    </asp:Label>
                </div>
                <label class="label-1">
                    First Name*</label>
                <asp:TextBox ID="txtShippingFirstName" runat="server" MaxLength="14" CssClass="text-1"></asp:TextBox>
            </div>
            <div class="form_line clearfix">
                <div class="error-1">
                    <asp:RequiredFieldValidator ID="rfvShippingLastName" runat="server" Display="Dynamic"
                        ControlToValidate="txtShippingLastName"></asp:RequiredFieldValidator>
                    <asp:Label ID="lblShippingLastNameError" runat="server" Visible="false"></asp:Label>
                </div>
                <label class="label-1">
                    Last Name*</label>
                <asp:TextBox ID="txtShippingLastName" runat="server" MaxLength="14" CssClass="text-1"></asp:TextBox>
            </div>
          
            <div class="form_line clearfix">
                <div class="error-1">
                    <asp:RequiredFieldValidator ID="rfvShippingAddress1" runat="server" Display="Dynamic"
                        ControlToValidate="txtShippingAddress1"></asp:RequiredFieldValidator>
                    <asp:Label ID="lblShippingAddress1Error" runat="server" Visible="false"></asp:Label></div>
                <label class="label-1">
                    Billing Address*</label>
                <asp:TextBox ID="txtShippingAddress1" runat="server" MaxLength="30" CssClass="text-1 billingad1"></asp:TextBox>
                  <label class="label-1">
                </label>
                <asp:TextBox ID="txtShippingAddress2" runat="server" MaxLength="30" CssClass="text-1"></asp:TextBox>
            </div>
           
         
            <div class="form_line clearfix">
                <div class="error-1">
                    <asp:RequiredFieldValidator ID="rfvShippingCity" runat="server" Display="Dynamic"
                        ControlToValidate="txtShippingCity"></asp:RequiredFieldValidator>
                    <asp:Label ID="lblShippingCityError" runat="server" Visible="false"></asp:Label></div>
                <label class="label-1">
                    City*</label>
                <asp:TextBox ID="txtShippingCity" runat="server" MaxLength="30" CssClass="text-1"></asp:TextBox>
            </div>
            <div class="form_line clearfix">
                <div class="error-1">
                    <asp:Label ID="lblShippingStateError" runat="server" Visible="false"></asp:Label></div>
                <label class="label-1">
                    State*</label>
                <asp:DropDownList ID="ddlShippingState" runat="server" DataTextField="NAME" CssClass="text-1"
                    size="1">
                </asp:DropDownList>
            </div>
              <div class="form_line clearfix">
                <div class="error-1">
                    <asp:Label ID="lblShippingCountryError" runat="server" Visible="false"></asp:Label></div>
                <label class="label-1">
                    Country*</label>
                <asp:DropDownList ID="ddlShippingCountry" runat="server" DataTextField="NAME" DataValueField="COUNTRYID"
                    AutoPostBack="true" OnSelectedIndexChanged="ShippingCountry_SelectedIndexChanged"
                    CssClass="text-1">
                </asp:DropDownList>
            </div>
            <div class="form_line clearfix">
                <div class="error-1">
                    <asp:RequiredFieldValidator ID="rfvShippingZipCode" runat="server" Display="Dynamic"
                        ControlToValidate="txtShippingZipCode"></asp:RequiredFieldValidator>
                    <asp:Label ID="lblShippingZiPError" runat="server" Visible="false"></asp:Label></div>
                <label class="label-1">
                    Zip Code*</label>
                <asp:TextBox ID="txtShippingZipCode" runat="server" MaxLength="7" CssClass="text-1"></asp:TextBox>
            </div>
            <div class="form_line clearfix">
                <div class="error-1">
                    <asp:RequiredFieldValidator ID="rfvPhoneNumber" runat="server" Display="Dynamic"
                        ControlToValidate="txtPhoneNumber1"></asp:RequiredFieldValidator>
                    <asp:Label ID="lblShippingPhoneNumberError" runat="server" Visible="false"></asp:Label></div>
                <label class="label-1">
                    Phone*</label>
                <asp:TextBox ID="txtPhoneNumber1" runat="server" MaxLength="3" CssClass="text-4"></asp:TextBox>
                <asp:TextBox ID="txtPhoneNumber2" runat="server" MaxLength="3" CssClass="text-4"></asp:TextBox>
                <asp:TextBox ID="txtPhoneNumber3" runat="server" MaxLength="4" CssClass="text-4"></asp:TextBox>                
            </div>
            <div class="form_line clearfix">
                <div class="error-1">
                    <asp:RequiredFieldValidator ID="rfvEmail" runat="server" Display="Dynamic" ControlToValidate="txtEmail"></asp:RequiredFieldValidator>
                    <asp:RegularExpressionValidator ID="revEmail" runat="server" ControlToValidate="txtEmail"
                        Display="Dynamic" ValidationExpression="^([\w-\.]+)@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.)|(([\w-]+\.)+))([a-zA-Z]{2,4}|[0-9]{1,3})(\]?)$" />
                    <asp:Label ID="lblEmailError" runat="server" Visible="false"></asp:Label></div>
                <label class="label-1">
                    Email*</label>
                <asp:TextBox ID="txtEmail" runat="server" MaxLength="30" CssClass="text-1"></asp:TextBox>
            </div>
              <div class="form_line clearfix" style="padding-bottom: 0">
            <label class="label-1"></label>
            <p class="text-1" style="text-align:center"><em>We respect your privacy</em></p>
            </div>
            <asp:Panel ID="pnlQuantity" runat="server" Visible="false">
                <div class="form_line clearfix">
                    <div class="error-1">
                        <asp:Label ID="lblQuantityList" runat="server" Visible="false"></asp:Label></div>
                    <label class="label-1">
                        Quantity*</label>
                    <asp:DropDownList ID="ddlQuantityList" runat="server" CssClass="text-1">
                        <asp:ListItem Value="select" Text="Select"></asp:ListItem>
                        <asp:ListItem Value="1" Text="1"></asp:ListItem>
                        <asp:ListItem Value="2" Text="2"></asp:ListItem>
                        <asp:ListItem Value="3" Text="3"></asp:ListItem>
                        <asp:ListItem Value="4" Text="4"></asp:ListItem>
                        <asp:ListItem Value="5" Text="5"></asp:ListItem>
                        <asp:ListItem Value="6" Text="6"></asp:ListItem>
                    </asp:DropDownList>
                </div>
            </asp:Panel>
            <div class="form_line clearfix" style="display: none">
                <div class="error-2">
                    Error</div>
                <label class="label-3">
                    Choose*</label>
                <table width="100%" border="0" cellspacing="0" cellpadding="0" class="choosetable">
                    <tr>
                        <td>
                            <img name="" src="images/choice.png" width="52" height="52" alt="" />
                        </td>
                        <td>
                            <img name="" src="images/choice.png" width="52" height="52" alt="" />
                        </td>
                        <td>
                            <img name="" src="images/choice.png" width="52" height="52" alt="" />
                        </td>
                    </tr>
                    <tr>
                        <td>
                            <label>
                                choice 1</label><input type="radio" />
                        </td>
                        <td>
                            <label>
                                choice 2</label><input type="radio" />
                        </td>
                        <td>
                            <label>
                                choice 3</label><input type="radio" />
                        </td>
                    </tr>
                </table>
            </div>
            <div class="form_line_btn" style="padding: 0 0 0 6px;">
                <asp:ImageButton ID="imgBtn" runat="server" ImageUrl="/Content/Images/order_now_btn_try.png"
                    CssClass="form_line_center" OnClick="imgBtn_OnClick" />
            </div>
              <div class="form_line" style="text-align:center; padding-left: 12px; width: 266px;">See <a href="/e2/privacy.aspx" target="_blank" style="color: #000" onclick="exit=false">Privacy Policy</a> & <a href="/e2/return.aspx" target="_blank" style="color: #000" onclick="exit=false">Offer Terms</a>.</div>
               <div style="position:absolute; width: 150px; height: 40px; left: 0; top: 472px;">
     <a name="trustlink" href="http://secure.trust-guard.com/certificates/6607" target="_blank" onclick="var nonwin=navigator.appName!='Microsoft Internet Explorer'?'yes':'no'; window.open(this.href.replace('http', 'https'),'welcome','location='+nonwin+',scrollbars=yes,width=517,height='+screen.availHeight+',menubar=no,toolbar=no'); return false;" oncontextmenu="var d = new Date(); alert('Copying Prohibited by Law - This image and all included logos are copyrighted by trust-guard \251 '+d.getFullYear()+'.'); return false;"><img name="trustseal" alt="Privacy Seal" style="border: 0;" src="https://c674753.ssl.cf2.rackcdn.com/privacy-6607-header.gif" /></a>
     
     </div>

        </div>
    </ContentTemplate>
</asp:UpdatePanel>
