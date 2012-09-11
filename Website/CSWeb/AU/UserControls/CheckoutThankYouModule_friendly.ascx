<%@Control Language="C#" Inherits="CSWeb.AU.UserControls.CheckoutThankYouModule_friendly" CodeBehind="CheckoutThankYouModule-friendly.ascx.cs" %>

<%@ Register Src="TrackingPixels.ascx" TagName="TrackingPixels" TagPrefix="uc" %>

<div id="stretch_container" style="background: none">
<div id="receipt_content" style="height: auto; width: 884px; position:relative; padding: 20px 70px; color: #000">

<p style="font-size: 28px; padding-bottom: 20px; color: #000000">Congratulations and Thank You for Trying Keranique!</p>
<p style="padding-bottom: 20px;"><strong>We know you're going to love the same visible results that thousands of women nationwide have already experienced!</strong></p>
        <asp:Literal ID="ltOfferDetails" runat="server"></asp:Literal>
        <table width="819" border="0" cellspacing="0" cellpadding="0" id="receipt_table1">
            <tr>
                <td class="horizontal_dots2" colspan="3">
                </td>
            </tr>
                <tr>
<td width="132" valign="top"><strong> Customer ID:</strong></td>
<td><asp:Literal ID="ltOrderNumber" runat="server"></asp:Literal></td>
</tr>
            <tr>
                <td width="76%" valign="top" style="padding-bottom: 20px">
                    <strong>Description</strong>
                </td>
                <td width="12%" valign="top" align="center">
                    <strong>Quantity</strong>
                </td>
                <td width="12%" valign="top">
                    <strong>Total</strong>
                </td>
            </tr>
            <asp:DataList runat="server" ID="dlordersList" RepeatLayout="Flow" RepeatDirection="Horizontal">
                <ItemTemplate>
                    <tr>
                        <td width="76%" valign="top" style="padding-bottom: 20px">
                            <%# DataBinder.Eval(Container.DataItem, "LongDescription")%>
                        </td>
                        <td width="12%" valign="top" align="center">
                            <%# DataBinder.Eval(Container.DataItem, "Quantity")%>
                        </td>
                        <td width="12%" valign="top">
                            $<%# Math.Round(Convert.ToDecimal(DataBinder.Eval(Container.DataItem, "TotalPrice")), 2).ToString()%>
                        </td>
                    </tr>
                </ItemTemplate>
            </asp:DataList>
            <asp:Literal ID="LiteralTableRows" runat="server"></asp:Literal>
            <tr>
                <td class="horizontal_dots2" colspan="3">
                </td>
            </tr>
            <tr>
                <td valign="top">
                    &nbsp;
                </td>
                <td valign="top">
                    Subtotal:<br />
                    S &amp; H:
                    <br />
                    <asp:Panel ID="pnlRushLabel" runat="server" Visible="false">
                        Rush S &amp; H:<br />
                    </asp:Panel>
                    Tax:
                    <br />
                    <asp:Panel ID="pnlPromotionLabel" runat="server" Visible="false">
                        Discount:<br />
                    </asp:Panel>
                    Total:
                </td>
                <td valign="top">
                    $<asp:Literal ID="LiteralSubTotal" runat="server"></asp:Literal><br />
                    $<asp:Literal ID="LiteralShipping" runat="server"></asp:Literal><br />
                    <asp:Panel ID="pnlRush" runat="server" Visible="false">
                        $<asp:Literal ID="LiteralRushShipping" runat="server"></asp:Literal><br />
                    </asp:Panel>
                    $<asp:Literal ID="LiteralTax" runat="server"></asp:Literal><br />
                    <asp:Panel ID="pnlPromotionalAmount" runat="server" Visible="false">
                        <asp:Label runat="server" ID="lblPromotionPrice"></asp:Label><br />
                    </asp:Panel>
                    $<asp:Literal ID="LiteralTotal" runat="server"></asp:Literal>
                </td>
            </tr>
            <tr>
                <td class="horizontal_dots2" colspan="3">
                </td>
            </tr>
        </table>
        <table width="819" border="0" cellspacing="0" cellpadding="0" id="receipt_table2">
            <tr>
                <td colspan="2" valign="top">
                    <strong>Shipping Information:</strong>
                </td>
                <td colspan="2" valign="top">
                    <strong>Billing Information:</strong>
                </td>
            </tr>
            <tr>
                <td width="158" valign="top">
                    Name:
                    <br />
                    Address:
                    <br />
                    Address 2:
                    <br />
                    City:
                    <br />
                    State:
                    <br />
                    Zip Code:
                    <br />
                    Country:
                    <br />
                    Email Address:
                </td>
                <td width="206" valign="top">
                    <asp:Literal ID="LiteralName" runat="server"></asp:Literal><br />
                    <asp:Literal ID="LiteralAddress" runat="server"></asp:Literal><br />
                    <asp:Literal ID="LiteralAddress2" runat="server"></asp:Literal><br />
                    <asp:Literal ID="LiteralCity" runat="server"></asp:Literal><br />
                    <asp:Literal ID="LiteralState" runat="server"></asp:Literal><br />
                    <asp:Literal ID="LiteralZip" runat="server"></asp:Literal><br />
                    <asp:Literal ID="LiteralCountry" runat="server"></asp:Literal><br />
                    <asp:Literal ID="LiteralEmail" runat="server"></asp:Literal><br />
                </td>
                <td width="189" valign="top">
                    Name:
                    <br />
                    Address:
                    <br />
                    Address 2:
                    <br />
                    City:
                    <br />
                    State:
                    <br />
                    Zip Code:<br />
                    Country:
                </td>
                <td width="266" valign="top">
                    <asp:Literal ID="LiteralName_b" runat="server">
                    </asp:Literal><br />
                    <asp:Literal ID="LiteralAddress_b" runat="server"></asp:Literal><br />
                    <asp:Literal ID="LiteralAddress2_b" runat="server"></asp:Literal><br />
                    <asp:Literal ID="LiteralCity_b" runat="server"></asp:Literal><br />
                    <asp:Literal ID="LiteralState_b" runat="server"></asp:Literal><br />
                    <asp:Literal ID="LiteralZip_b" runat="server"></asp:Literal><br />
                    <asp:Literal ID="LiteralCountry_b" runat="server"></asp:Literal>
                </td>
            </tr>
            <tr>
                <td class="horizontal_dots2" colspan="4">
                </td>
            </tr>
        </table>
    </div>
</div>
<div id="footer">
    <div id="footertext">
        <p>
            Copyright &copy; 2012. All rights reserved.</p>
    </div>
</div>


<uc:TrackingPixels ID="TrackingPixels" runat="server" />