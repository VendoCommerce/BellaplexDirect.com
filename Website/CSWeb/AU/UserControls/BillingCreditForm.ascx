<%@Control Language="C#" AutoEventWireup="true" CodeBehind="BillingCreditForm.ascx.cs" Inherits="CSWeb.AU.UserControls.BillingCreditForm" %>
<%@ Register Src="ShoppingCartControl.ascx" TagName="ShoppingCartControl" TagPrefix="uc" %>
<asp:ScriptManager runat="server" ID="sm1">
</asp:ScriptManager>
<asp:UpdatePanel ID="upShippingForm" runat="server">
    <ContentTemplate>
<div class="checkout_right">
    
  <span style="text-align:center">
<h1 class="underline" style="font-size: 24px;"> Shipping Details</h1>
<img class="postal" alt="United states postal service" src="https://dd991rkqr6iba.cloudfront.net/Images/ups.png">
          <p class="shipDate"><%=DateTime.Today.AddDays(3).ToString("MMMM d") %></p></span>
          
          
          <img alt="Please proceed with payment information" src="https://dd991rkqr6iba.cloudfront.net/Images/co-top.png" />
          <div id="formcheckout" class="payment"> 
            <div class="billing">
        <p>Is your billing address the same as your shipping address?</p>

                        <asp:RadioButtonList ID="rblBillingDifferent" runat="server" OnSelectedIndexChanged="rblBillingDifferent_CheckedChanged"
                            CssClass="text-5" AutoPostBack="true" RepeatDirection="Horizontal" TabIndex="124">
                            <asp:ListItem Value="true">Yes</asp:ListItem>
                            <asp:ListItem Value="false" Selected="True">No</asp:ListItem>
                        </asp:RadioButtonList>
                    </div>
                    <asp:Panel ID="pnlBillingAddress" runat="server" Visible="false">
                        <div class="form_line clearfix">
                            <div class="error-1">
                                <asp:RequiredFieldValidator ID="rfvFirstName" runat="server" Display="Dynamic" ControlToValidate="txtFirstName"></asp:RequiredFieldValidator>
                                <asp:Label ID="lblFirstNameError" runat="server" Visible="false">
                                </asp:Label>
                            </div>
                            <label class="label-1">
                                First Name*</label>
                            <asp:TextBox ID="txtFirstName" runat="server" MaxLength="14" CssClass="text-1"></asp:TextBox>
                        </div>
                        <div class="form_line clearfix">
                            <div class="error-1">
                                <asp:RequiredFieldValidator ID="rfvLastName" runat="server" Display="Dynamic" ControlToValidate="txtLastName"></asp:RequiredFieldValidator>
                                <asp:Label ID="lblLastNameError" runat="server" Visible="false"></asp:Label>
                            </div>
                            <label class="label-1">
                                Last Name*</label>
                            <asp:TextBox ID="txtLastName" runat="server" MaxLength="14" CssClass="text-1"></asp:TextBox>
                        </div>
                        <div class="form_line clearfix">
                            <div class="error-1">
                                <asp:Label ID="lblCountryError" runat="server" Visible="false"></asp:Label></div>
                            <label class="label-1">
                                Country*</label>
                            <asp:DropDownList ID="ddlCountry" runat="server" DataTextField="NAME" DataValueField="COUNTRYID"
                                AutoPostBack="true" OnSelectedIndexChanged="Country_SelectedIndexChanged" CssClass="text-1">
                            </asp:DropDownList>
                        </div>
                        <div class="form_line clearfix">
                            <div class="error-1">
                                <asp:RequiredFieldValidator ID="rfvAddress1" runat="server" Display="Dynamic" ControlToValidate="txtAddress1"></asp:RequiredFieldValidator>
                                <asp:Label ID="lblAddress1Error" runat="server" Visible="false"></asp:Label></div>
                            <label class="label-1">
                                Billing Address*</label>
                            <asp:TextBox ID="txtAddress1" runat="server" MaxLength="30" CssClass="text-1"></asp:TextBox>
                        </div>
                        <div class="form_line clearfix">
                            <div class="error-1">
                            </div>
                            <label class="label-1">
                            </label>
                            <asp:TextBox ID="txtAddress2" runat="server" MaxLength="30" CssClass="text-1"></asp:TextBox>
                        </div>
                        <div class="form_line clearfix">
                            <div class="error-1">
                                <asp:RequiredFieldValidator ID="rfvCity" runat="server" Display="Dynamic" ControlToValidate="txtCity"></asp:RequiredFieldValidator>
                                <asp:Label ID="lblCityError" runat="server" Visible="false"></asp:Label></div>
                            <label class="label-1">
                                City*</label>
                            <asp:TextBox ID="txtCity" runat="server" MaxLength="30" CssClass="text-1"></asp:TextBox>
                        </div>
                        <div class="form_line clearfix">
                            <div class="error-1">
                                <asp:Label ID="lblStateError" runat="server" Visible="false"></asp:Label></div>
                            <label class="label-1">
                                State*</label>
                            <asp:DropDownList ID="ddlState" runat="server" DataTextField="NAME" CssClass="text-1"
                                size="1">
                            </asp:DropDownList>
                        </div>
                        <div class="form_line clearfix">
                            <div class="error-1">
                                <asp:RequiredFieldValidator ID="rfvZipCode" runat="server" Display="Dynamic" ControlToValidate="txtZipCode"></asp:RequiredFieldValidator>
                                <asp:Label ID="lblZiPError" runat="server" Visible="false"></asp:Label></div>
                            <label class="label-1">
                                Zip Code*</label>
                            <asp:TextBox ID="txtZipCode" runat="server" MaxLength="7" CssClass="text-1"></asp:TextBox>
                        </div>
                    </asp:Panel>
                    <div class="form_line clearfix">
                        <label class="label-3">
                           Payment Method</label>
                        <div class="error-2">
                            <asp:RequiredFieldValidator ID="rfvCCType" runat="server" Display="Dynamic" ControlToValidate="ddlCCType"></asp:RequiredFieldValidator>
                            <asp:Label ID="lblCCType" runat="server" Visible="false"></asp:Label></div>
                        <asp:DropDownList ID="ddlCCType" runat="server" CssClass="text-2">
                        </asp:DropDownList>
                    </div>
                    <div class="form_line clearfix">
                        <label class="label-3">
                           Credit Card Number</label>
                        <div class="error-2">
                            <asp:Label ID="lblCCNumberError" runat="server" Visible="false"></asp:Label></div>
                        <table cellpadding="0" cellspacing="0" border="0">
                            <tr>
                                <td>
                                    <asp:TextBox ID="txtCCNumber1" runat="server" CssClass="text-2" MaxLength="16"></asp:TextBox><asp:RequiredFieldValidator
                                        ID="RequiredFieldValidator3" ControlToValidate="txtCCNumber1" runat="server"
                                        Display="Dynamic" ErrorMessage="*" />
                                </td>
                                <%--<td>
                                    <asp:TextBox ID="txtCCNumber2" runat="server" CssClass="text-4" MaxLength="4"></asp:TextBox><asp:RequiredFieldValidator
                                        ID="RequiredFieldValidator4" ControlToValidate="txtCCNumber2" runat="server"
                                        Display="Dynamic" ErrorMessage="*" />
                                </td>
                                <td>
                                    <asp:TextBox ID="txtCCNumber3" runat="server" CssClass="text-4" MaxLength="4"></asp:TextBox><asp:RequiredFieldValidator
                                        ID="RequiredFieldValidator5" ControlToValidate="txtCCNumber3" runat="server"
                                        Display="Dynamic" ErrorMessage="*" />
                                </td>
                                <td>
                                    <asp:TextBox ID="txtCCNumber4" runat="server" CssClass="text-4" MaxLength="4"></asp:TextBox><asp:RequiredFieldValidator
                                        ID="RequiredFieldValidator6" ControlToValidate="txtCCNumber4" runat="server"
                                        Display="Dynamic" ErrorMessage="*" />
                                </td>--%>
                            </tr>
                        </table>
                    </div>
                    <div class="form_line clearfix">
                        <label class="label-3">
                           Expiration Date</label>
                        <div class="error-2">
                            <asp:RequiredFieldValidator ID="rfvExpMonth" runat="server" Display="Dynamic" ControlToValidate="ddlExpMonth"></asp:RequiredFieldValidator>
                            <asp:RequiredFieldValidator ID="rfvExpYear" runat="server" Display="Dynamic" ControlToValidate="ddlExpYear"></asp:RequiredFieldValidator>
                            <asp:Label ID="lblExpDate" runat="server" Visible="false"></asp:Label></div>
                        <asp:DropDownList ID="ddlExpMonth" runat="server" CssClass="text-3">
                            <asp:ListItem Value="" Text=""></asp:ListItem>
                            <asp:ListItem Value="1">01</asp:ListItem>
                            <asp:ListItem Value="2">02</asp:ListItem>
                            <asp:ListItem Value="3">03</asp:ListItem>
                            <asp:ListItem Value="4">04</asp:ListItem>
                            <asp:ListItem Value="5">05</asp:ListItem>
                            <asp:ListItem Value="6">06</asp:ListItem>
                            <asp:ListItem Value="7">07</asp:ListItem>
                            <asp:ListItem Value="8">08</asp:ListItem>
                            <asp:ListItem Value="9">09</asp:ListItem>
                            <asp:ListItem Value="10">10</asp:ListItem>
                            <asp:ListItem Value="11">11</asp:ListItem>
                            <asp:ListItem Value="12">12</asp:ListItem>
                        </asp:DropDownList>
                        <asp:DropDownList ID="ddlExpYear" runat="server" CssClass="text-3">
                            <asp:ListItem Value="" Text=""></asp:ListItem>
                            <asp:ListItem Value="2012">2012</asp:ListItem>
                            <asp:ListItem Value="2013">2013</asp:ListItem>
                            <asp:ListItem Value="2014">2014</asp:ListItem>
                            <asp:ListItem Value="2015">2015</asp:ListItem>
                            <asp:ListItem Value="2016">2016</asp:ListItem>
                            <asp:ListItem Value="2017">2017</asp:ListItem>
                            <asp:ListItem Value="2018">2018</asp:ListItem>
                            <asp:ListItem Value="2019">2019</asp:ListItem>
                            <asp:ListItem Value="2020">2020</asp:ListItem>
                        </asp:DropDownList>
                    </div>
                    
                    <div class="form_line clearfix">
                        <label class="label-3">
                    CVV2: <a class="cvv" onclick="window.open('/e2/CreditCardCVV2.htm','cvv','width=620,height=400'); return false;">(What is this?)</a>
                </label>
                        <div class="error-2">
                            <asp:RequiredFieldValidator ID="rfvCVV" ControlToValidate="txtCvv" runat="server"
                                Display="Dynamic" />
                            <asp:Label ID="lblCvvError" runat="server" Visible="false"></asp:Label></div>
                        <asp:TextBox ID="txtCvv" runat="server" CssClass="text-4" MaxLength="4"></asp:TextBox>
                    </div>
                <div class="form_line clearfix">
                <fieldset class="checkboxes" style="border: 0; padding-bottom: 9px;">
            <div class="agree-terms">
             <div class="error-2"> <asp:Label ID="lblTerms" runat="server" Visible="false"></asp:Label></div>   

               


                <label for="cbTeams" class="label_check" style="display: block; cursor: pointer;">
              <asp:CheckBox ID="cbTeams" runat="server" />     
             
                    YES, I am 18 years old and agree to the <a href="javascript:;" onclick="window.open('b2/return.aspx','return','width=700,height=650'); return false;">terms and conditions</a>                    
                 </label>
                     
                          <div class="clear"></div>
                    </div>              
                           
            </div>

            <div class="form_line_btn">
                <asp:ImageButton ID="imgBtn" runat="server" ImageUrl="https://d37t4f22sfrbdk.cloudfront.net/Images/submit-rush_e2.gif"
                    CssClass="form_line_center" OnClick="imgBtn_OnClick" />
            </div>
                    <div class="form_line_guarantee" style="display: none">
                        <a href="#">View 30-Day Guarantee</a></div>
               <img src="https://d37t4f22sfrbdk.cloudfront.net/Images/co-bottom.png" alt="Safe and secure transactions" />
        </div>
    <!-- end cartB -->
  
</div>
<!-- end checkout_right -->
    </ContentTemplate>
</asp:UpdatePanel>
