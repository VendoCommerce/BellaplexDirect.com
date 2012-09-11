<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="CouponList.aspx.cs" Inherits="CSWeb.Admin.CouponList"
    MasterPageFile="AdminSite.master" %>

<asp:Content ID="BodyContent" runat="server" ContentPlaceHolderID="MainContent">
    <br>
    <span class="header"><font color="blue">Define Versions</font> </span>
    <br />
    <br />
    <asp:ValidationSummary CssClass="failureNotification" ID="valError" runat="server"
        ShowSummary="True" DisplayMode="List" />
    <table width="100%" cellpadding="2" cellspacing="1" border="0">
        <tr>
            <td width="50%">
                <asp:Image AlternateText="Add" ID="imgAddItem" runat="server" ImageUrl='/Content/images/admin/add.gif'
                    BorderStyle="None"></asp:Image>
                <asp:LinkButton ID="lbItemAdd" runat="server" CssClass="link" OnCommand="btnAction_Command"
                    CommandName="AddNew" Text="Add Coupon"></asp:LinkButton>
            </td>
        </tr>
    </table>
    <table width="100%" border="0" cellspacing="1" cellpadding="2" border="2">
        <tr>
            <td class="title" colspan="3">
                Coupons
            </td>
        </tr>
        <tr class="header">
            <td align="left" width="40%" class="ibn-sectionheader">
                Code
            </td>
            <td align="left" width="30%" class="ibn-sectionheader">
                Discount
            </td>
            <td align="center" width="20%" class="ibn-sectionheader">
                Type
            </td>
            <td align="center" width="5%" class="ibn-sectionheader">
                Active
            </td>
            <td align="center" width="5%" class="ibn-sectionheader">
                Options
            </td>
        </tr>
        <asp:DataList runat="server" ID="dlCouponList" OnItemCommand="dlCouponList_ItemCommand"
            RepeatLayout="Flow" RepeatDirection="Horizontal" OnItemDataBound="dlCouponList_ItemDataBound">
            <ItemTemplate>
                <tr>
                    <td class="body" align="left" width="40%">
                        <asp:Literal runat="server" ID='lblTitle'></asp:Literal>
                    </td>
                    <td width="30%" align="left">
                        <asp:Literal runat="server" ID='lblDiscount'></asp:Literal>
                    </td>
                    <td width="20%" align="center">
                        <asp:Literal runat="server" ID='lblDiscountType'></asp:Literal>
                    </td>
                    <td width="5%" align="center">
                        <asp:Literal runat="server" ID='lblStatus'></asp:Literal>
                    </td>
                    <td nowrap align="center" width="5%">
                        <asp:LinkButton ID="lbSave" runat="server" CausesValidation="False" CommandName="Edit">
                            <asp:Image ID="Image1" runat="server" ImageUrl="/Content/images/admin/edit.gif" BorderWidth="0"
                                ToolTip='Edit' /></asp:LinkButton>
                        <asp:LinkButton ID="lbRemove" runat="server" CausesValidation="False" CommandName="Delete">
                            <asp:Image ID="Image2" runat="server" ImageUrl="/Content/images/admin/delete.gif"
                                BorderWidth="0" ToolTip='Delete' /></asp:LinkButton>
                    </td>
                </tr>
            </ItemTemplate>
            <EditItemTemplate>
                <tr>
                    <td class="body" align="left" width="40%">
                        <asp:RequiredFieldValidator ID="valName" runat="server" Display="Dynamic" ErrorMessage="Title is required field"
                            ControlToValidate="txtEditTitle">*</asp:RequiredFieldValidator>
                        <asp:TextBox ID="txtEditTitle" runat="server" Text='<%#DataBinder.Eval(Container.DataItem,"title")%>'
                            CssClass="body" MaxLength="50" Width="50%"></asp:TextBox>
                    </td>
                    <td class="body" align="left" width="30%">
                        <asp:TextBox ID="txtEditPercentage" runat="server" CausesValidation="true" Width="10%"
                            Text='<%# String.Format("{0:0.##}", DataBinder.Eval(Container.DataItem, "Discount")) %>'
                            MaxLength="5" />%
                        <asp:RequiredFieldValidator ID="reqValPercentage" runat="server" ControlToValidate="txtEditPercentage"
                            ErrorMessage="Percentage is required" ValidationGroup="valErrorPopup" CssClass="failureNotification">*</asp:RequiredFieldValidator>
                        <asp:CompareValidator ID="cmpValPercentage" runat="server" ControlToValidate="txtEditPercentage"
                            Type="Double" ErrorMessage="Percentage must be Double format" Operator="GreaterThanEqual"
                            ValidationGroup="valErrorPopup" CssClass="failureNotification" ValueToCompare="0">*</asp:CompareValidator>
                    </td>
                    <td width="20%" align="center">
                        <asp:RequiredFieldValidator ID="rfqDicountType" runat="server" Display="Dynamic"
                            ErrorMessage="DiscountType is required field" ControlToValidate="ddlEditDiscountType">*</asp:RequiredFieldValidator>
                        <asp:DropDownList runat="server" ID='ddlEditDiscountType' />
                    </td>
                    <td width="5%" align="center">
                        <asp:CheckBox ID="cbEditVisible" runat="server" Checked='<%# DataBinder.Eval(Container.DataItem, "Active") %>' />
                    </td>
                    <td align="center">
                        <asp:LinkButton ID="lbSave" runat="server" CausesValidation="True" CommandName="Update">
                            <asp:Image ID="Image1" runat="server" ImageUrl="/Content/images/admin/save.gif" BorderWidth="0"
                                ToolTip='Save' /></asp:LinkButton>
                        <asp:LinkButton ID="lbCancel" runat="server" CausesValidation="False" CommandName="Cancel">
                            <asp:Image ID="Image3" runat="server" ImageUrl="/Content/images/admin/cancel.gif"
                                BorderWidth="0" ToolTip='Cancel' /></asp:LinkButton>
                    </td>
                </tr>
            </EditItemTemplate>
        </asp:DataList>
        <asp:PlaceHolder ID="pnlAddCategory" runat="server" Visible="False">
            <tr class="searchlegend">
                <td colspan="1" class="body" width="40%">
                    <asp:RequiredFieldValidator ID="valAddName" runat="server" Display="Dynamic" ErrorMessage="Title is required field"
                        ControlToValidate="txtTitle">*</asp:RequiredFieldValidator>
                    <asp:TextBox ID="txtTitle" runat="server" Width="40%" MaxLength="50" CssClass="body" />&#160;&#160;
                </td>
                <td class="body" align="left" width="30%">
                    <asp:TextBox ID="txtPercentage" runat="server" CausesValidation="true" Width="10%"
                        MaxLength="5" />%
                    <asp:RequiredFieldValidator ID="reqValPercentage" runat="server" ControlToValidate="txtPercentage"
                        ErrorMessage="Percentage is required" ValidationGroup="valErrorPopup" CssClass="failureNotification">*</asp:RequiredFieldValidator>
                    <asp:CompareValidator ID="cmpValPercentage" runat="server" ControlToValidate="txtPercentage"
                        Type="Double" ErrorMessage="Percentage must be Double format" Operator="GreaterThanEqual"
                        ValidationGroup="valErrorPopup" CssClass="failureNotification" ValueToCompare="0">*</asp:CompareValidator>
                </td>
                <td width="20%" align="center">
                    <asp:RequiredFieldValidator ID="rfqDicountType" runat="server" Display="Dynamic"
                        ErrorMessage="DiscountType is required field" ControlToValidate="ddlDiscountType">*</asp:RequiredFieldValidator>
                    <asp:DropDownList runat="server" ID='ddlDiscountType' />
                </td>
                <td width="5%" align="center">
                    <asp:CheckBox ID="cbVisible" runat="server" />
                </td>
                <td nowrap align="center" width="10%">
                    <asp:LinkButton ID="lbSave" runat="server" CommandName="Add" OnCommand="btnAction_Command"
                        CausesValidation="True">
                        <asp:Image ID="Image1" runat="server" ImageUrl="/Content/images/admin/save.gif" BorderWidth="0"
                            ToolTip='Save' /></asp:LinkButton>
                    <asp:LinkButton ID="lbCancel" runat="server" CommandName="Cancel" OnCommand="btnAction_Command"
                        CausesValidation="False">
                        <asp:Image ID="Image3" runat="server" ImageUrl="/Content/images/admin/cancel.gif"
                            BorderWidth="0" ToolTip='Cancel' /></asp:LinkButton>
                </td>
            </tr>
        </asp:PlaceHolder>
        <tr>
            <td colspan="4">
                <asp:Button runat="server" ID="btnCancel" Text="Back" CommandName="Back" OnCommand="btnAction_Command" />
        </tr>
    </table>
    <br />
</asp:Content>
