<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="ShippingCreditForm.ascx.cs"
    Inherits="CSWeb.Root.UserControls.ShippingCreditForm" %>
<%@ Register Src="ShoppingCartControl.ascx" TagName="ShoppingCartControl" TagPrefix="uc" %>
<asp:ScriptManager runat="server" ID="sm1">
</asp:ScriptManager>
<asp:UpdatePanel ID="upShippingForm" runat="server">
    <ContentTemplate>
        <div id="cart_content" style="height: auto; width: 964px; position: relative; padding-top: 7px;
    padding-left: 60px">
    <div style="position: relative; width: 645px; height: 676px; color: #767676; font-size: 13px;
        left: 0; top: 0; float: left; background: url(https://d186nm3tvejuoh.cloudfront.net/Images/cart_left.jpg);">
        <div style="position: absolute; left: 5px; top: 275px; height: 135px; width: 628px;">
            <p style="color: #00426a; font-size: 12px; line-height: 17px;">
                <strong>*Terms &amp; Conditions</strong>: If you decide to keep the bottles, you
                will be billed in two easy payments of $69.95, the first 30 days and second payment
                60 days following receipt of trial shipment. Then unless you cancel, you will continue
                to receive a fresh 60 day supply every 2 months with the same guaranteed low price
                of just $69.95 per month plus $6.95 S&P per shipment which will be conveniently
                billed to the card you provided today. By clicking "Order Securely", you authorize
                us to charge your card for each 2 bottle shipment per the terms described above.
                There is no commitment to continue and no minimum purchase. You can call customer
                service at 1-800-515-1070 at any time to cancel. Each shipment you receive is covered
                by the same 30-day Money Back Guarantee, just call within 30 days and return the
                product within two weeks for a full refund of the purchase price!
            </p>
        </div>
        <div style="position: absolute; left: 400px; top: 525px; height: 42px; width: 223px;">
            <p style="color: #000; font-size: 20px; line-height: 18px; text-align: center;">
                <strong>
                    <%=DateTime.Today.AddDays(3).ToString("MMMM d") %></strong>
            </p>
        </div>
        <div style="position: absolute; left: 398px; top: 74px; height: 172px; width: 235px;">
            <p style="color: #00426a; font-size: 12px; line-height: 17px; text-align: right;">
                <strong>WHEN YOU ORDER YOUR 2 RISK FREE<br />
                    BOTTLES TODAY, GET DISCOUNTED<br />
                    SHIPPING AND PROCESSING of just<br />$1.99 billed to your card today!</p>
        </div>
        <div style="position: absolute; left: 97px; top: 74px; height: 170px; width: 162px;">
            <p style="color: #00426a; font-size: 12px; line-height: 17px;">
                With our 30 Day Money Back Guarantee, if you're not completely satisfied, you can
                call within 30 days of receipt to cancel and return the product as instructed and
                will not be billed any additional amount.
            </p>
        </div>
        <!-- <div id="cart_offer">*Offer Details: </div> -->
    </div>

    <div style="position: relative; float: left; width: 256px; height: 46px; margin-left: 8px;">
        <img src="https://d186nm3tvejuoh.cloudfront.net/Images/cart_top.png" width="256"
            height="46" />
    </div>

    <div id="page_form_cart">

        <div class="form_line2">
            <p style="color: #000; font-size: 10px; font-weight: bold; padding-bottom: 8px;">
                Please enter your billing information below.</p>
            <p style="padding-bottom: 16px;">
                <img src="https://d186nm3tvejuoh.cloudfront.net/Images/cards.jpg" width="235" height="42" /></p>
            
            <div id="Div1" class="form_line clearfix" runat="server" visible="false">
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
                <div class="label-3">
                    Card Number*</div>
                <div class="error-2">
                    <asp:RequiredFieldValidator ID="rfvCCNumber" ControlToValidate="txtCCNumber1" runat="server"
                        Display="Dynamic" ErrorMessage="*" />
                    <asp:Label ID="lblCCNumberError" ForeColor="Red" runat="server" Text="" Visible="false"></asp:Label></div>
                <div class="left_field_wrap_2">
                    <asp:TextBox ID="txtCCNumber1" CssClass="text-2" MaxLength="16" TabIndex="122"
                        runat="server"></asp:TextBox>
                    </div>
            </div>
            <div class="form_line clearfix">
                <div class="label-3">
                    Exp Date*</div>
                <div class="error-2">
                    <asp:RequiredFieldValidator ID="rfvExpMonth" runat="server" Display="Dynamic" ControlToValidate="ddlExpMonth"></asp:RequiredFieldValidator>
                    <asp:RequiredFieldValidator ID="rfvExpYear" runat="server" Display="Dynamic" ControlToValidate="ddlExpYear"></asp:RequiredFieldValidator>
                    
                    <asp:Label ID="lblExpDate" ForeColor="Red" runat="server" Text="" Visible="false"></asp:Label>
                </div>
                
                <div class="left_field_wrap_2">
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
                
            </div>
            <div class="form_line clearfix">
                <div class="label-3">
                    CVV* <a style="color: #0071c0" onclick="window.open('/CreditCardCVV2.htm','cvv','width=620,height=400'); return false;" href="#">Help?</a></div>
                <div class="error_2">
                    <asp:RequiredFieldValidator ID="rfvCVV" ControlToValidate="txtCvv" runat="server"
                        Display="Dynamic" />
                    <asp:Label ID="lblCvvError" ForeColor="Red" runat="server" Text="" Visible="false"></asp:Label></div>
                <div class="left_field_wrap_1">
                    <asp:TextBox ID="txtCvv" CssClass="text-5" MaxLength="4" TabIndex="126" runat="server"></asp:TextBox>

                </div>
            </div>

            <div class="form_line clearfix">
                <div class="leftlabel3" style="font-size: 11px; height: 35px;">
                    Is your billing address
                    <strong>different </strong>
                    from shipping address?
                </div>

                <div class="leftlabel3" style="font-size: 11px; height: 40px;">
                    <asp:RadioButtonList ID="rblShippingDifferent" runat="server" OnSelectedIndexChanged="rblShippingDifferent_CheckedChanged"
                        CssClass="leftlabel3" style="top: -10px; font-size: 11px; height: 40px; width: 86px;" AutoPostBack="true" RepeatDirection="Horizontal" TabIndex="1">
                        <asp:ListItem Value="true">Yes</asp:ListItem>
                        <asp:ListItem Value="false" Selected="True">No</asp:ListItem>
                    </asp:RadioButtonList>
                </div>
            </div>

            <asp:Panel ID="pnlShippingAddress" Visible="false" runat="server">
                        <div class="form_line clearfix">
                            <div class="error-1">
                                <asp:RequiredFieldValidator ID="rfvShippingFirstName" runat="server" Display="Dynamic"
                                    ControlToValidate="txtShippingFirstName"></asp:RequiredFieldValidator>
                                <asp:Label ID="lblFirstNameError" ForeColor="Red" runat="server" Text="" Font-Size="11px"
                                    Visible="false"></asp:Label>
                            </div>
                            <div class="left_field_wrap_2cl">
                                First Name</div>
                            <div class="left_field_wrap_2c">
                                <asp:TextBox ID="txtShippingFirstName" MaxLength="14" TabIndex="111" CssClass="text_field_1b"
                                    runat="server"></asp:TextBox>
                            </div>
                        </div>
                        <div class="form_line clearfix">
                            <div class="error-1">
                                <asp:RequiredFieldValidator ID="rfvShippingLastName" runat="server" Display="Dynamic"
                                    ControlToValidate="txtShippingLastName"></asp:RequiredFieldValidator>
                                <asp:Label ID="lblLastNameError" ForeColor="Red" runat="server" Text="" Font-Size="11px"
                                    Visible="false"></asp:Label>
                            </div>
                            <div class="left_field_wrap_2cl">
                                Last Name/Surname</div>
                            <div class="left_field_wrap_2c">
                                <asp:TextBox ID="txtShippingLastName" TabIndex="112" CssClass="text_field_1b" runat="server"></asp:TextBox>
                            </div>  
                        </div>
                        <div class="form_line clearfix">
                            <div class="error-1">
                                <asp:RequiredFieldValidator ID="rfvShippingAddress1" runat="server" Display="Dynamic"
                                    ControlToValidate="txtShippingAddress1"></asp:RequiredFieldValidator>
                                <asp:Label ID="lblShippingAddress1Error" ForeColor="Red" runat="server" Text="" Font-Size="11px"
                                    Visible="false"></asp:Label></div>
                            <div class="left_field_wrap_2cl">
                                Street Address/Apt#</div>
                            <div class="left_field_wrap_2c">
                                <asp:TextBox ID="txtShippingAddress1" TabIndex="113" MaxLength="256" runat="server"
                                    CssClass="text_field_1b"></asp:TextBox>
                            </div>
                                <asp:TextBox ID="txtShippingAddress2" MaxLength="256" TabIndex="114"
                                runat="server" CssClass="text_field_1b" Visible="false"></asp:TextBox>
                        </div>
                         
                        <div class="form_line clearfix">
                            <div class="error-1">
                                <asp:RequiredFieldValidator ID="rfvShippingCity" runat="server" Display="Dynamic"
                                    ControlToValidate="txtShippingCity"></asp:RequiredFieldValidator>
                                <asp:Label ID="lblShippingCityError" ForeColor="Red" runat="server" Text="" Font-Size="11px"
                                    Visible="false"></asp:Label></div>
                            <div class="left_field_wrap_2cl">
                                City</div>
                            <div class="left_field_wrap_2c">
                                <asp:TextBox ID="txtShippingCity" TabIndex="115" CssClass="text_field_1b" runat="server"></asp:TextBox>
                            </div>
                        </div>
                        <div class="form_line clearfix">
                            <div class="error-1">
                                <asp:Label ID="lblShippingStateError" ForeColor="Red" runat="server" Text="" Font-Size="11px"
                                    Visible="false"></asp:Label></div>
                            <div class="left_field_wrap_2cl">
                                State</div>
                            <div class="left_field_wrap_2c">
                                <asp:DropDownList ID="ddlShippingState" runat="server" DataTextField="NAME" TabIndex="116"
                                    CssClass="text_field_1b" OnSelectedIndexChanged="ShippingState_SelectedIndexChanged"
                                    AutoPostBack="true">
                                </asp:DropDownList>
                            </div>
                        </div>
                        <div class="form_line clearfix">
                            <div class="error-1">
                                <asp:Label ID="lblShippingCountryError" runat="server" Visible="false"></asp:Label></div>
                            <div class="left_field_wrap_2cl">
                                Country</div>
                            <div class="left_field_wrap_2c">
                                <asp:DropDownList ID="ddlShippingCountry" runat="server" DataTextField="NAME" DataValueField="COUNTRYID"
                                    AutoPostBack="true" OnSelectedIndexChanged="ShippingCountry_SelectedIndexChanged"
                                    CssClass="text_field_1b">
                                </asp:DropDownList>
                            </div>
                        </div>
                        <div class="form_line clearfix">
                            <div class="error-1">
                                <asp:RequiredFieldValidator ID="rfvShippingZipCode" runat="server" Display="Dynamic"
                                    ControlToValidate="txtShippingZipCode"></asp:RequiredFieldValidator>
                                <asp:Label ID="lblShippingZiPError" ForeColor="Red" runat="server" Text="" Font-Size="11px"
                                    Visible="false"></asp:Label></div>
                            <div class="left_field_wrap_2cl">
                                Zip Code</div>
                                <div class="left_field_wrap_2c">
                            <asp:TextBox ID="txtShippingZipCode" TabIndex="117" runat="server" MaxLength="7"
                                CssClass="text_field_1b"></asp:TextBox>

                                </div>

                        </div>
                    </asp:Panel>

            <div class="form_line clearfix">
                <div class="error_message_2">
                    <asp:Label ID="lblTerms" ForeColor="Red" runat="server" Text="" Visible="false"></asp:Label></div>
                <div class="left_field_wrap_3">
                    <asp:CheckBox ID="cbTeams" TabIndex="127" runat="server" /></div>
                <div class="right_field_wrap_2">
                    YES, I agree to the terms and conditions.</div>
                <div id="clear">
                </div>
            </div>

            <div class="form_line2" style="margin-bottom: 10px;">
                <asp:ImageButton ID="ImageButton1" TabIndex="129" OnClick="imgBtn_OnClick" runat="server"
                    ImageUrl="https://d186nm3tvejuoh.cloudfront.net/Images/order_now_btn.png" />
            </div>

        </div>

        <div style="text-align: center;">
            <a name="trustlink" href="http://secure.trust-guard.com/certificates/6719" target="_blank"
                onclick="var nonwin=navigator.appName!='Microsoft Internet Explorer'?'yes':'no'; window.open(this.href.replace('http', 'https'),'welcome','location='+nonwin+',scrollbars=yes,width=517,height='+screen.availHeight+',menubar=no,toolbar=no'); return false;"
                oncontextmenu="var d = new Date(); alert('Copying Prohibited by Law - This image and all included logos are copyrighted by trust-guard \251 '+d.getFullYear()+'.'); return false;">
                <img name="trustseal" alt="Security Seal" style="border: 0; margin-bottom: 6px;"
                    src="http://seals.trust-guard.com/security-6719-header.gif" /></a>
            <br />
            <img src="https://d186nm3tvejuoh.cloudfront.net/Images/ssl_secured.png" height="34"
                width="115" />
        </div>

    </div>

    </div>
        
    </ContentTemplate>
</asp:UpdatePanel>
