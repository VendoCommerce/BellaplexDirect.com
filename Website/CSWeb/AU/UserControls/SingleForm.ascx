<%@Control Language="C#" AutoEventWireup="true" Inherits="CSWeb.AU.UserControls.SingleForm" %>
<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="ajaxToolkit" %>
<!-- page form starts here - new full page form format -->
<div class="cartA">
    <div class="form_line clearfix">
        <div class="error-1">
            <asp:Label ID="LabelFirstNameError" ForeColor="Red" runat="server" Visible="false"></asp:Label></div>
        <label class="label-1">
            First Name*</label>
        <asp:TextBox ID="TextBoxFirstName" TabIndex="100" CssClass="text-1" runat="server"></asp:TextBox>
    </div>
    <div class="form_line clearfix">
        <div class="error-1">
            <asp:Label ID="LabelLastNameError" ForeColor="Red" runat="server" Visible="false"></asp:Label></div>
        <label class="label-1">
            Last Name*</label>
        <asp:TextBox ID="TextBoxLastName" TabIndex="101" CssClass="text-1" runat="server"></asp:TextBox>
    </div>
    <asp:Panel ID="pnlCountry" runat="server" Visible="false">
        <div class="form_line clearfix">
            <div class="error-1">
                <asp:Label ID="Label1" ForeColor="Red" runat="server" Text="" Visible="false"></asp:Label></div>
            <label class="label-1">
                Country*</label>
            <asp:DropDownList ID="ddlCountry" Visible="false" DataTextField="NAME" DataValueField="COUNTRYID"
                AutoPostBack="true" runat="server" OnSelectedIndexChanged="Country_SelectedIndexChanged"
                CssClass="text_field_1">
            </asp:DropDownList>
        </div>
    </asp:Panel>
    <div class="form_line clearfix">
        <div class="error-1">
            <asp:Label ID="LabelBillingAddress1Error" ForeColor="Red" runat="server" Text=""
                Visible="false"></asp:Label></div>
        <label class="label-1">
            Billing Address*</label>
        <asp:TextBox ID="TextBoxAddress1" TabIndex="102" MaxLength="38" runat="server" CssClass="text-1"></asp:TextBox><asp:TextBox
            ID="TextBoxAddress2" TabIndex="103" Visible="false" runat="server"></asp:TextBox>
    </div>
    <div class="form_line clearfix">
        <div class="error-1">
            <asp:Label ID="LabelCityError" ForeColor="Red" runat="server" Text="" Visible="false"></asp:Label></div>
        <label class="label-1">
            City*</label>
        <asp:TextBox ID="TextBoxCity" TabIndex="104" CssClass="text-1" runat="server"></asp:TextBox>
    </div>
    <div class="form_line clearfix">
        <div class="error-1">
            <asp:Label ID="LabelStateError" ForeColor="Red" runat="server" Text="" Visible="false"></asp:Label></div>
        <label class="label-1">
            State*</label>
        <asp:DropDownList runat="server" DataTextField="NAME" TabIndex="105" ID="ddlState"
            CssClass="text-1" />
    </div>
    <div class="form_line clearfix">
        <div class="error-1">
            <asp:Label ID="LabelZiPError" ForeColor="Red" runat="server" Text="" Visible="false"></asp:Label></div>
        <label class="label-1">
            Zip Code*</label>
        <asp:TextBox ID="TextBoxZip" TabIndex="106" runat="server" CssClass="text-1"></asp:TextBox>
    </div>
    <div class="form_line clearfix">
        <div class="error-1">
            <asp:Label ID="LabelPhoneError" ForeColor="Red" runat="server" Text="" Visible="false"></asp:Label></div>
        <label class="label-1">
            Phone*</label>
        <div class="par">
            (</div>
        <asp:TextBox ID="TextBoxArea" MaxLength="3" TabIndex="107" runat="server" CssClass="textPhone1"></asp:TextBox><div
            class="par">
            )</div>
        <asp:TextBox ID="TextBoxPhoneNum1" MaxLength="3" TabIndex="108" runat="server" CssClass="textPhone2"></asp:TextBox>
        <asp:TextBox ID="TextBoxPhoneNum2" MaxLength="4" TabIndex="109" runat="server" CssClass="textPhone2"></asp:TextBox>
    </div>
    <div class="form_line clearfix">
        <div class="error-1">
            <asp:Label ID="LabelEmailError" ForeColor="Red" runat="server" Text="" Visible="false"></asp:Label></div>
        <label class="label-1">
            Email*</label>
        <asp:TextBox ID="TextBoxEmail" TabIndex="110" CssClass="text-1" runat="server"></asp:TextBox>
    </div>
    <div class="form_line clearfix">
        <label class="label-2">
            Billing information is same<br />
            as Shipping</label>
        <asp:CheckBox ID="CheckBoxShippingDifferent" TabIndex="111" CssClass="checkbox-right"
            runat="server" OnCheckedChanged="CheckBoxShippingDifferent_CheckedChanged" AutoPostBack="true" />
    </div>
    <asp:Panel ID="PanelDifferentAddress" Visible="false" runat="server">
        <div class="form_line clearfix">
            <div class="error-1">
                <asp:Label ID="lblShippingFirstNameError" ForeColor="Red" runat="server" Text=""
                    Visible="false"></asp:Label></div>
            <label class="label-1">
                First Name*</label>
            <asp:TextBox ID="TextBoxShippingFirstName" TabIndex="112" CssClass="text-1" runat="server"></asp:TextBox>
        </div>
        <div class="form_line clearfix">
            <div class="error-1">
                <asp:Label ID="lblShippingLastNameError" ForeColor="Red" runat="server" Text="" Visible="false"></asp:Label></div>
            <div class="label-1">
                Last Name*</div>
            <asp:TextBox ID="TextBoxShippingLastName" TabIndex="113" CssClass="text-1" runat="server"></asp:TextBox>
        </div>
        <div class="form_line clearfix">
            <div class="error-1">
                <asp:Label ID="lblShippingAddress1Error" ForeColor="Red" runat="server" Text="" Visible="false"></asp:Label></div>
            <div class="label-1">
                Shipping Address*</div>
            <asp:TextBox ID="TextBoxShippingAddress1" TabIndex="114" MaxLength="38" runat="server"
                CssClass="text-1"></asp:TextBox><asp:TextBox ID="TextBoxShippingAddress2" TabIndex="115"
                    Visible="false" runat="server"></asp:TextBox>
        </div>
        <div class="form_line clearfix">
            <div class="error-1">
                <asp:Label ID="lblShippingCityError" ForeColor="Red" runat="server" Text="" Visible="false"></asp:Label></div>
            <div class="label-1">
                City*</div>
            <asp:TextBox ID="TextBoxShippingCity" TabIndex="116" CssClass="text-1" runat="server"></asp:TextBox>
        </div>
        <div class="form_line clearfix">
            <div class="error-1">
                <asp:Label ID="lblShippingStateError" ForeColor="Red" runat="server" Text="" Visible="false"></asp:Label></div>
            <div class="label-1">
                State*</div>
            <asp:DropDownList runat="server" DataTextField="NAME" DataValueField="NAME" TabIndex="117"
                ID="ddlShippingState" CssClass="text-1">
            </asp:DropDownList>
            <asp:DropDownList ID="ddlShippingCountry" Visible="false" DataTextField="NAME" DataValueField="COUNTRYID"
                AutoPostBack="true" runat="server" OnSelectedIndexChanged="Country_SelectedIndexChanged"
                CssClass="text-1">
            </asp:DropDownList>
        </div>
        <div class="form_line clearfix">
             <div class="error-1">
                <asp:Label ID="lblShippingZiPError" ForeColor="Red" runat="server" Text="" Visible="false"></asp:Label></div>
          <div class="label-1">
                Zip Code*</div>
           
                <asp:TextBox ID="TextBoxShippingZip" TabIndex="118" runat="server" CssClass="text_field_1"></asp:TextBox>
        </div>
    </asp:Panel>
    <div class="form_line clearfix">
        <label class="label-3">
            Credit Card*</label>
        <div class="error-2">
            <asp:Label ID="LabelCreditCardTypeError" ForeColor="Red" runat="server" Text="" Visible="false"></asp:Label></div>
        <asp:DropDownList runat="server" ID="DropDownListCCType" TabIndex="119" CssClass="text-2" />
    </div>
    <div class="form_line clearfix">
        <label class="label-3">
            Exp Date*</label>
        <div class="error-2">
            <asp:Label ID="LabelExpMonthError" ForeColor="Red" runat="server" Text="" Visible="false"></asp:Label><asp:Label
                ID="LabelExpYearError" ForeColor="Red" runat="server" Text="" Visible="false"></asp:Label></div>
        <asp:DropDownList runat="server" ID="DropDownListExpMonth" CssClass="text-3" TabIndex="120">
            <asp:ListItem Value="00" Text=""></asp:ListItem>
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
        <asp:DropDownList runat="server" ID="DropDownListExpYear" CssClass="text-3" TabIndex="121">
            <asp:ListItem Value="0000" Text=""></asp:ListItem>
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
            Card Number*</label>
        <div class="error-2">
            <asp:Label ID="LabelCreditCardNumberError" ForeColor="Red" runat="server" Text=""
                Visible="false"></asp:Label></div>
        <asp:TextBox ID="TextBoxCCNum1" CssClass="text-4" MaxLength="4" TabIndex="122" runat="server"></asp:TextBox>
        <asp:TextBox ID="TextBoxCCNum2" CssClass="text-4" MaxLength="4" TabIndex="123" runat="server"></asp:TextBox>
        <asp:TextBox ID="TextBoxCCNum3" CssClass="text-4" MaxLength="4" TabIndex="124" runat="server"></asp:TextBox>
        <asp:TextBox ID="TextBoxCCNum4" CssClass="text-4" MaxLength="4" TabIndex="125" runat="server"></asp:TextBox>
    </div>
    <div class="form_line clearfix">
        <label class="label-3">
            Card Verification #* <a class="cvv" href="#">what's this?</a>
        </label>
        <div class="error-2">
            <asp:Label ID="LabelCreditCardCvvError" ForeColor="Red" runat="server" Text="" Visible="false"></asp:Label>
        </div>
        <asp:TextBox ID="TextBoxCVV" CssClass="text-4" MaxLength="4" TabIndex="126" runat="server"></asp:TextBox>
    </div>
    <div class="form_line clearfix">
        <label class="label-2">
            Send me new Product Updates
            <br />
            and Special Offers.</strong></label>
        <input type="checkbox" checked="checked" class="checkbox-right" />
    </div>
    <div class="form_line_btn">
        <asp:ImageButton ID="ImageButton1" TabIndex="129" CssClass="form_line_center" OnClick="ImageButton1_Click"
            runat="server" ImageUrl="/Content/Images/try_it_now_btn.png" />
    </div>
    <div class="form_line_guarantee">
        <a href="#">View 30-Day Guarantee</a>
    </div>
</div>
<!-- end page_form -->
<!-- www.hitslink.com/ web tools statistics hit counter code -->
<script type="text/javascript" id="wa_u"></script>
<script type="text/javascript">
        //<![CDATA[
    // Begin Variable Declarations
    wa_account = "858E8A969A8B"; wa_location = 24;
    wa_pageName = location.pathname + location.search;  // you can customize the page name here
    wa_MultivariateKey = 'B4';    //  Set this variable to perform multivariate testing
    // End Variable Declarations
    document.cookie = '__support_check=1;path=/'; wa_hp = 'http';
    wa_rf = document.referrer; wa_sr = window.location.search;
    wa_tz = new Date(); if (location.href.substr(0, 6).toLowerCase() == 'https:')
        wa_hp = 'https'; wa_data = '&an=' + escape(navigator.appName) +
        '&sr=' + escape(wa_sr) + '&ck=' + document.cookie.length +
        '&rf=' + escape(wa_rf) + '&sl=' + escape(navigator.systemLanguage) +
        '&av=' + escape(navigator.appVersion) + '&l=' + escape(navigator.language) +
        '&pf=' + escape(navigator.platform) + '&pg=' + escape(wa_pageName);
    wa_data = wa_data + '&cd=' +
        screen.colorDepth + '&rs=' + escape(screen.width + ' x ' + screen.height) +
        '&tz=' + wa_tz.getTimezoneOffset() + '&je=' + navigator.javaEnabled();
    wa_img = new Image(); wa_img.src = wa_hp + '://counter.hitslink.com/statistics.asp' +
        '?v=1&s=' + wa_location + '&eacct=' + wa_account + wa_data + '&tks=' + wa_tz.getTime() + '&mvk=' + wa_MultivariateKey;
    document.cookie = '__support_check=1;path=/;expires=Thu, 01-Jan-1970 00:00:01 GMT';
    document.getElementById('wa_u').src = wa_hp + '://counter.hitslink.com/track.js';
        //]]>
</script>
<!-- End www.hitslink.com/ statistics web tools hit counter code 
 

-->
