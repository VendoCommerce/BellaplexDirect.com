<%@ Control Language="C#" AutoEventWireup="true" Inherits="CSWeb.Root.UserControls.BillingForm"
    CodeBehind="BillingForm.ascx.cs" %>
<asp:ScriptManager runat="server" ID="sm1">
</asp:ScriptManager>
<asp:UpdatePanel ID="upBillingForm" runat="server">
    <ContentTemplate>
        <a name="tryitnow"></a>
        <div id="form_top">
            <img src="https://d186nm3tvejuoh.cloudfront.net/Images/form_top.png" width="281"
                height="122" alt="Bellaplex" /></div>
        <div id="page_form">
            <div class="form_line clearfix">
                <div class="error-1">
                    <asp:RequiredFieldValidator ID="rfvFirstName" runat="server" Display="Dynamic" ControlToValidate="txtFirstName"></asp:RequiredFieldValidator>
                    <asp:Label ID="lblFirstNameError" runat="server" Visible="false" ForeColor="Red">
                    </asp:Label>
                </div>
                <label class="label-1">
                    First Name*</label>
                <asp:TextBox ID="txtFirstName" TabIndex="100" MaxLength="60" CssClass="text-1" runat="server"></asp:TextBox>
            </div>
            <div class="form_line clearfix">
                <div class="error-1">
                    <asp:RequiredFieldValidator ID="rfvLastName" runat="server" Display="Dynamic" ControlToValidate="txtLastName"></asp:RequiredFieldValidator>
                    <asp:Label ID="lblLastNameError" runat="server" Visible="false" ForeColor="Red"></asp:Label></div>
                <label class="label-1">
                    Last Name*</label>
                <asp:TextBox ID="txtLastName" TabIndex="101" MaxLength="60" CssClass="text-1" runat="server"></asp:TextBox>
            </div>
            <div class="form_line clearfix">
                <div class="error-1">
                    <asp:RequiredFieldValidator ID="rfvAddress1" runat="server" Display="Dynamic" ControlToValidate="txtAddress1"></asp:RequiredFieldValidator>
                    <asp:Label ID="lblAddress1Error" runat="server" Visible="false" ForeColor="Red"></asp:Label></div>
                <label class="label-1">
                    Billing Address*</label>
                <asp:TextBox ID="txtAddress1" TabIndex="102" MaxLength="100" runat="server" CssClass="text-1"></asp:TextBox>
            </div>
            <div class="form_line clearfix">
                <div class="error-1">
                </div>
                <label class="label-1">
                </label>
                <asp:TextBox ID="txtAddress2" TabIndex="103" MaxLength="100" runat="server" CssClass="text-1"></asp:TextBox>
            </div>
            <div class="form_line clearfix">
                <div class="error-1">
                    <asp:RequiredFieldValidator ID="rfvCity" runat="server" Display="Dynamic" ControlToValidate="txtCity"></asp:RequiredFieldValidator>
                    <asp:Label ID="lblCityError" runat="server" Visible="false" ForeColor="Red"></asp:Label>
                </div>
                <label class="label-1">
                    City*</label>
                <asp:TextBox ID="txtCity" TabIndex="104" MaxLength="60" CssClass="text-1" runat="server"></asp:TextBox>
            </div>
            <div class="form_line clearfix">
                <div class="error-1">
                    <asp:Label ID="lblStateError" ForeColor="Red" runat="server" Text="" Visible="false"></asp:Label></div>
                <label class="label-1">
                    State*</label>
                <asp:DropDownList runat="server" DataTextField="NAME" TabIndex="105" ID="ddlState"
                    CssClass="text-1">
                </asp:DropDownList>
            </div>
            <div class="form_line clearfix">
                <div class="error-1">
                    <asp:Label ID="lblCountryError" ForeColor="Red" runat="server" Text="" Visible="false"></asp:Label></div>
                <label class="label-1">
                    Country*</label>
                <asp:DropDownList ID="ddlCountry" DataTextField="NAME" DataValueField="COUNTRYID"
                    AutoPostBack="true" runat="server" OnSelectedIndexChanged="Country_SelectedIndexChanged"
                    CssClass="text-1">
                </asp:DropDownList>
            </div>
            <div class="form_line clearfix">
                <div class="error-1">
                    <asp:RequiredFieldValidator ID="rfvZipCode" runat="server" Display="Dynamic" ControlToValidate="txtZipCode"></asp:RequiredFieldValidator>
                    <asp:Label ID="lblZiPError" runat="server" Visible="false" ForeColor="Red"></asp:Label></div>
                <label class="label-1">
                    Zip Code*</label>
                <asp:TextBox ID="txtZipCode" TabIndex="106" runat="server" CssClass="text-1" MaxLength="7"></asp:TextBox>
            </div>
            <div class="form_line clearfix">
                <div class="error-1">
                    <asp:RequiredFieldValidator ID="rfvPhoneNumber" runat="server" Display="Dynamic"
                        ControlToValidate="txtPhoneNumber1"></asp:RequiredFieldValidator>
                    <asp:Label ID="lblPhoneNumberError" runat="server" Visible="false" ForeColor="Red"></asp:Label></div>
                <label class="label-1">
                    Phone*</label>
                <asp:TextBox ID="txtPhoneNumber1" MaxLength="3" TabIndex="110" CssClass="text-4"
                    runat="server"></asp:TextBox>
                <asp:TextBox ID="txtPhoneNumber2" MaxLength="3" TabIndex="110" CssClass="text-4"
                    runat="server"></asp:TextBox>
                <asp:TextBox ID="txtPhoneNumber3" MaxLength="4" TabIndex="110" CssClass="text-6"
                    runat="server"></asp:TextBox>
            </div>
            <div class="form_line clearfix">
                <div class="error-1">
                    <asp:RequiredFieldValidator ID="rfvEmail" runat="server" Display="Dynamic" ControlToValidate="txtEmail"></asp:RequiredFieldValidator>
                    <asp:RegularExpressionValidator ID="revEmail" runat="server" ControlToValidate="txtEmail"
                        Display="Dynamic" ValidationExpression="^([\w-\.]+)@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.)|(([\w-]+\.)+))([a-zA-Z]{2,4}|[0-9]{1,3})(\]?)$" />
                    <asp:Label ID="lblEmailError" runat="server" Visible="false" ForeColor="Red"></asp:Label>
                </div>
                <label class="label-1">
                    Email*</label>
                <asp:TextBox ID="txtEmail" TabIndex="110" CssClass="text-1" runat="server" MaxLength="100"></asp:TextBox>
            </div>
            <div class="form_line2" style="text-align: right;">
                <asp:ImageButton ID="ImageButton1" TabIndex="129" OnClick="imgBtn_OnClick" runat="server"
                    ImageUrl="https://d186nm3tvejuoh.cloudfront.net/Images/try_it_now_btn.png" />
            </div>
        </div>
        <div id="form_bottom"><img src="https://d186nm3tvejuoh.cloudfront.net/Images/form_bottom.png" width="281" height="14" alt="Bellaplex" /></div>
    </ContentTemplate>
</asp:UpdatePanel>
