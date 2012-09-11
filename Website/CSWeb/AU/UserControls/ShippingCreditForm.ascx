<%@Control Language="C#" AutoEventWireup="true" CodeBehind="ShippingCreditForm.ascx.cs" Inherits="CSWeb.AU.UserControls.ShippingCreditForm" %>
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
            <div class="cartB" style="background: url(https://dd991rkqr6iba.cloudfront.net/Images/co-bg.gif) repeat-y;">
              
                    <div class="form_line clearfix" style="margin-left: 6px; text-align:center;">
                       
                         <label class="label-3" style="text-align:center; padding: 20px 0 10px;">
                            Is your billing address the same as your shipping address?</label>
                        <asp:RadioButtonList ID="rblShippingDifferent" runat="server" OnSelectedIndexChanged="rblShippingDifferent_CheckedChanged"
                            CssClass="text-5" AutoPostBack="true" RepeatDirection="Horizontal" TabIndex="1">
                            <asp:ListItem Value="true" Selected="True">Yes</asp:ListItem>
                            <asp:ListItem Value="false">No</asp:ListItem>
                        </asp:RadioButtonList>
                 </div>
                    <asp:Panel ID="pnlShippingAddress" Visible="false" runat="server">
                        <div class="form_line clearfix">
                            <div class="error-1">
                                <asp:RequiredFieldValidator ID="rfvShippingFirstName" runat="server" Display="Dynamic"
                                    ControlToValidate="txtShippingFirstName"></asp:RequiredFieldValidator>
                                <asp:Label ID="lblFirstNameError" ForeColor="Red" runat="server" Text="" Font-Size="11px"
                                    Visible="false"></asp:Label>
                            </div>
                            <label class="label-1">
                                First Name</label>
                            <asp:TextBox ID="txtShippingFirstName" MaxLength="14" TabIndex="111" CssClass="text-1"
                                runat="server"></asp:TextBox>
                        </div>
                        <div class="form_line clearfix">
                            <div class="error-1">
                                <asp:RequiredFieldValidator ID="rfvShippingLastName" runat="server" Display="Dynamic"
                                    ControlToValidate="txtShippingLastName"></asp:RequiredFieldValidator>
                                <asp:Label ID="lblLastNameError" ForeColor="Red" runat="server" Text="" Font-Size="11px"
                                    Visible="false"></asp:Label>
                            </div>
                            <label class="label-1">
                                Last Name/Surname</label>
                            <asp:TextBox ID="txtShippingLastName" TabIndex="112" CssClass="text-1" runat="server"></asp:TextBox>
                        </div>
                        <div class="form_line clearfix">
                            <div class="error-1">
                                <asp:RequiredFieldValidator ID="rfvShippingAddress1" runat="server" Display="Dynamic"
                                    ControlToValidate="txtShippingAddress1"></asp:RequiredFieldValidator>
                                <asp:Label ID="lblShippingAddress1Error" ForeColor="Red" runat="server" Text="" Font-Size="11px"
                                    Visible="false"></asp:Label></div>
                            <label class="label-1">
                                Street Address/Apt#</label>
                            <asp:TextBox ID="txtShippingAddress1" TabIndex="113" MaxLength="256" runat="server"
                                CssClass="text-1"></asp:TextBox>                            
                        </div>
                        <div class="form_line clearfix">
                            <div class="error-1"></div>
                            <label class="label-1">
                                </label>
                            <asp:TextBox ID="txtShippingAddress2" MaxLength="256" TabIndex="114"
                                runat="server" CssClass="text-1"></asp:TextBox>
                        </div>
                        <div class="form_line clearfix">
                            <div class="error-1">
                                <asp:RequiredFieldValidator ID="rfvShippingCity" runat="server" Display="Dynamic"
                                    ControlToValidate="txtShippingCity"></asp:RequiredFieldValidator>
                                <asp:Label ID="lblShippingCityError" ForeColor="Red" runat="server" Text="" Font-Size="11px"
                                    Visible="false"></asp:Label></div>
                            <label class="label-1">
                                City</label>
                            <asp:TextBox ID="txtShippingCity" TabIndex="115" CssClass="text-1" runat="server"></asp:TextBox>
                        </div>
                        <div class="form_line clearfix">
                            <div class="error-1">
                                <asp:Label ID="lblShippingStateError" ForeColor="Red" runat="server" Text="" Font-Size="11px"
                                    Visible="false"></asp:Label></div>
                            <label class="label-1">
                                State</label>
                            <asp:DropDownList ID="ddlShippingState" runat="server" DataTextField="NAME" TabIndex="116"
                                CssClass="text-1" OnSelectedIndexChanged="ShippingState_SelectedIndexChanged"
                                AutoPostBack="true">
                            </asp:DropDownList>
                        </div>
                        <div class="form_line clearfix">
                            <div class="error-1">
                                <asp:Label ID="lblShippingCountryError" runat="server" Visible="false"></asp:Label></div>
                            <label class="label-1">
                                Country</label>
                            <asp:DropDownList ID="ddlShippingCountry" runat="server" DataTextField="NAME" DataValueField="COUNTRYID"
                                AutoPostBack="true" OnSelectedIndexChanged="ShippingCountry_SelectedIndexChanged"
                                CssClass="text-1">
                            </asp:DropDownList>
                        </div>
                        <div class="form_line clearfix">
                            <div class="error-1">
                                <asp:RequiredFieldValidator ID="rfvShippingZipCode" runat="server" Display="Dynamic"
                                    ControlToValidate="txtShippingZipCode"></asp:RequiredFieldValidator>
                                <asp:Label ID="lblShippingZiPError" ForeColor="Red" runat="server" Text="" Font-Size="11px"
                                    Visible="false"></asp:Label></div>
                            <label class="label-1">
                                Zip Code</label>
                            <asp:TextBox ID="txtShippingZipCode" TabIndex="117" runat="server" MaxLength="7"
                                CssClass="text-1"></asp:TextBox>
                        </div>
                    </asp:Panel>
             
        
            <div class="form_line clearfix" runat="server" visible="false">
                <label class="label-3">
                    Payment Method:</label>
                <div class="error-2">
                    <asp:RequiredFieldValidator ID="rfvCCType" runat="server" Display="Dynamic" ControlToValidate="ddlCCType"></asp:RequiredFieldValidator>
                    <asp:Label ID="lblCCType" ForeColor="Red" runat="server" Text="" Visible="false"></asp:Label></div>
                <asp:DropDownList ID="ddlCCType" runat="server" CssClass="text-2" Width="171"
                    TabIndex="119">
                </asp:DropDownList>
            </div>
            <div class="form_line clearfix">
                <label class="label-3">
                    Credit Card Number</label>
                <div class="error-2">
                    <asp:RequiredFieldValidator ID="rfvCCNumber" ControlToValidate="txtCCNumber1" runat="server"
                        Display="Dynamic" ErrorMessage="*" />
                    <asp:Label ID="lblCCNumberError" ForeColor="Red" runat="server" Text="" Visible="false"></asp:Label></div>
                <asp:TextBox ID="txtCCNumber1" CssClass="text-2" MaxLength="16" TabIndex="122"
                    runat="server"></asp:TextBox>
            </div>
            <div class="form_line clearfix">
                <label class="label-3">
                    Expiration Date</label>
                <div class="error-2">
                    <asp:RequiredFieldValidator ID="rfvExpMonth" runat="server" Display="Dynamic" ControlToValidate="ddlExpMonth"></asp:RequiredFieldValidator>
                    <asp:RequiredFieldValidator ID="rfvExpYear" runat="server" Display="Dynamic" ControlToValidate="ddlExpYear"></asp:RequiredFieldValidator>
                    <asp:Label ID="lblExpDate" ForeColor="Red" runat="server" Text="" Visible="false"></asp:Label>
                </div>
                
                    <asp:DropDownList runat="server" ID="ddlExpMonth" CssClass="text-3" TabIndex="124">
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
                    <asp:DropDownList runat="server" ID="ddlExpYear" CssClass="text-3" TabIndex="125">
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
                    CVV2: <a href="/cvv.aspx" style="font-size: 10px; color: #D31244" class="popup">(What
                        is this)</a></label>
                <div class="error_2">
                    <asp:RequiredFieldValidator ID="rfvCVV" ControlToValidate="txtCvv" runat="server"
                        Display="Dynamic" />
                    <asp:Label ID="lblCvvError" ForeColor="Red" runat="server" Text="" Visible="false"></asp:Label></div>
                <div class="left_field_wrap_1">
                    <asp:TextBox ID="txtCvv" CssClass="text-4" MaxLength="4" TabIndex="126" runat="server"></asp:TextBox>

                </div>
            </div>
            <div class="form_line clearfix">
              <fieldset class="checkboxes" style="border: 0; padding-bottom: 9px;">
                <div class="agree-terms">
                    <div class="error-2">
                        <asp:Label ID="lblTerms" ForeColor="Red" runat="server" Text="" Visible="false"></asp:Label></div>
                     <label for="cbTeams" class="label_check" style="display: block; cursor: pointer;">
                        <asp:CheckBox ID="cbTeams" TabIndex="127" runat="server" />YES, I am 18 years old
                        and agree to the <a href="javascript:;" onclick="window.open('terms/offers.aspx','return','width=700,height=650'); return false;">terms and conditions</a>                    
                 </label>
    <div class="clear"></div>
              </div>              
                           
            </div>
          <div class="form_line_btn">
        <asp:Button ID="imgBtn" TabIndex="129" OnClick="imgBtn_OnClick" runat="server" CssClass="f-submit" />
        </div>
    
       <img src="https://dd991rkqr6iba.cloudfront.net/Images/co-bottom.png" alt="Safe and secure transactions"/>
                </div>   </div>
        
    </ContentTemplate>
</asp:UpdatePanel>
