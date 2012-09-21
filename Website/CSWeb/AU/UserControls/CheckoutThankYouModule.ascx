<%@Control Language="C#" Inherits="CSWeb.AU.UserControls.CheckoutThankYouModule" CodeBehind="CheckoutThankYouModule.ascx.cs" AutoEventWireup="True" %>
<%@ Register Src="Header.ascx" TagName="Header" TagPrefix="uc" %>
<%@ Register Src="footer.ascx" TagName="Footer" TagPrefix="uc" %>
<%@ Register Src="TrackingPixels.ascx" TagName="TrackingPixels" TagPrefix="uc" %>

<uc:Header runat="server" />

<div id="stretch_container">
    <div id="receipt_content" style="height: auto; width: 884px; position: relative;
        padding: 20px 70px;">
        <p style="text-align: right">
            <a href="receipt_friendly.aspx">
                <img src="https://d186nm3tvejuoh.cloudfront.net/Images/print_icon.jpg" width="182"
                    height="26" /></a></p>
        <p style="font-size: 28px; padding-bottom: 20px; color: #000000">
            Congratulations and Thank You for Trying Bellaplex!</p>
        <p style="padding-bottom: 20px; color: #515151">
            <strong>We know you're going to love the same visible results that thousands of men
                and women nationwide have already experienced!</strong></p>
        <asp:Panel ID="PanelMultiPay" runat="server">
            <p style="padding-bottom: 20px; color: #515151">
                WITH YOUR 2 RISK FREE BOTTLES TODAY, YOU GET DISCOUNTED SHIPPING AND PROCESSING
                of just $1.99 billed to your card today! With our 30 Day Money Back Guarantee, if
                you're not completely satisfied, you can call within 30 days of receipt to cancel
                and return the product as instructed and will not be billed any additional amount.
                If you decide to keep the bottles, you will be billed in two easy payments of $69.95,
                the first 30 days and second payment 60 days following receipt of trial shipment.
            </p>
            <p style="padding-bottom: 20px; color: #515151">
                Then unless you cancel, you will continue to receive a fresh 60 day supply every
                2 months with the same guaranteed low price of just $69.95 per month plus $6.95
                S&amp;P per shipment which will be conveniently billed to the card you provided
                today. By clicking &quot;Send My Trial&quot;, you authorize us to charge your card
                for each 2 bottle shipment per the terms described above. There is no commitment
                to continue and no minimum purchase.
            </p>
            <p style="padding-bottom: 20px; color: #515151">
                You can call customer service at 1-800-515-1070 at any time to cancel. Each shipment
                you receive is covered by the same 30-day Money Back Guarantee, just call within
                30 days and return the product within two weeks for a full refund of the purchase
                price!</p>
        </asp:Panel>
        <asp:Panel ID="PanelOnePay" runat="server" Visible="false">
            <p style="padding-bottom: 20px; color: #515151">
                We are sending you 3 bottles of Bellaplex for the low price of $139.90 charged today
                to the card you provided. If you like your product and want to continue to see results,
                you don't have to do anything else.</p>
            <p style="padding-bottom: 20px; color: #515151">
                As a member of our Beauty Auto Ship Program and to ensure you continue to see results
                without running out of Bellaplex, we'll send you 3 bottles every 90 days for the
                price of 2�so you'll always get one FREE�until you tell us to stop! You authorize
                that the card you provided today will automatically be charged the low price of
                $139.90 and a small shipping and processing fee of $7.95 for each shipment, on the
                day your order ships. And remember�we waived your initial shipping and processing
                fee - and with every 2 bottles you'll always get 1 FREE! All NJ residents will be
                charged sales tax. Customers can call to cancel future shipments at any time.</p>
            <p style="padding-bottom: 20px; color: #515151">
                Remember, you have our 30-Day Bottom-of-the-Bottle Guarantee with each shipment.
                If you are not completely delighted with Bellaplex, call Customer Service at 1-800-515-1070
                within 30 days of receipt of your shipment to request a return number and return
                2 of the containers of Bellaplex within two weeks�even if they are empty�to avoid
                future shipments and for a full refund of the product-purchase price, less the shipping
                and processing. Please include your return number with your return package. Customer
                is responsible for return shipping.<br />
            </p>
            <p style="padding-bottom: 20px; color: #515151">
                For questions about your order, call 1-800-515-1070 Monday - Sunday from 8am - 10pm
                US EST or email.</p>
        </asp:Panel>
        <table width="819" border="0" cellspacing="0" cellpadding="0" id="receipt_table1">
            <tr>
                <td colspan="3" valign="top" style="padding-bottom: 10px">
                    <img src="https://d186nm3tvejuoh.cloudfront.net/Images/horizontal_dots2.jpg" />
                </td>
            </tr>
            <tr>
                <td width="61%" valign="top" style="padding-bottom: 20px">
                    <strong>Description</strong>
                </td>
                <td width="17%" valign="top">
                    <strong>Quantity</strong>
                </td>
                <td width="22%" valign="top">
                    <strong>Amount Charged Today</strong>
                </td>
            </tr>
            <asp:DataList runat="server" ID="dlordersList" RepeatLayout="Flow" RepeatDirection="Horizontal">
                <ItemTemplate>
                    <tr>
                        <td width="76%" valign="top" style="padding-bottom: 20px">
                            <%# DataBinder.Eval(Container.DataItem, "LongDescription")%>
                        </td>
                        <td width="12%" valign="top">
                            <%# DataBinder.Eval(Container.DataItem, "Quantity")%>
                        </td>
                        <td width="12%" valign="top">
                            $<%# Math.Round(Convert.ToDecimal(DataBinder.Eval(Container.DataItem, "TotalPrice")), 2).ToString()%>
                        </td>
                    </tr>
                </ItemTemplate>
            </asp:DataList>
            <tr>
                <asp:Literal ID="LiteralTableRows" runat="server"></asp:Literal>
            </tr>
            <tr>
                <td colspan="3" valign="top">
                    <span style="padding-bottom: 20px">
                        <img src="https://d186nm3tvejuoh.cloudfront.net/Images/horizontal_dots2.jpg" /></span>
                </td>
            </tr>
            <tr>
                <td>
                    &nbsp;
                </td>
                <td align="right" valign="top" style="padding-right: 6px">
                    Subtotal:<br />
                    S&amp;P:<br />
                    Tax:<br />
                    Total:
                </td>
                <td valign="top">
                    $<asp:Literal ID="LiteralSubTotal" runat="server"></asp:Literal><br />
                    $<asp:Literal ID="LiteralShipping" runat="server"></asp:Literal><br />
                    $<asp:Literal ID="LiteralTax" runat="server"></asp:Literal><br />
                    $<asp:Literal ID="LiteralTotal" runat="server"></asp:Literal>
                </td>
            </tr>
            <tr>
                <td colspan="3" valign="top">
                    <span style="padding-bottom: 20px">
                        <img src="https://d186nm3tvejuoh.cloudfront.net/Images/horizontal_dots2.jpg" /></span>
                </td>
            </tr>
        </table>
        <table width="683" border="0" cellspacing="0" cellpadding="0" id="receipt_table2">
            <tr>
                <td colspan="2" valign="top">
                    <p>
                        <strong>Customer Order ID:<br />
                            <asp:Literal ID="ltOrderNumber" runat="server"></asp:Literal></strong></p>
                    <p>
                        &nbsp;</p>
                </td>
                <td colspan="2" valign="top">
                    &nbsp;
                </td>
            </tr>
            <tr>
                <td colspan="2" valign="top">
                    <strong>Shipping Information:</strong>
                </td>
                <td colspan="2" valign="top">
                    <strong>Billing Information:</strong>
                </td>
            </tr>
            <tr>
                <td width="132" valign="top">
                    First Name:
                    <br />
                    Last Name:
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
                    Email Address:
                </td>
                <td width="198" valign="top">                    
                    <asp:Literal ID="LiteralFirstName" runat="server"></asp:Literal><br />
                    <asp:Literal ID="LiteralLastName" runat="server"></asp:Literal><br />
                    <asp:Literal ID="LiteralAddress" runat="server"></asp:Literal><br />
                    <asp:Literal ID="LiteralAddress2" runat="server"></asp:Literal><br />
                    <asp:Literal ID="LiteralCity" runat="server"></asp:Literal><br />
                    <asp:Literal ID="LiteralState" runat="server"></asp:Literal><br />
                    <asp:Literal ID="LiteralZip" runat="server"></asp:Literal><br />
                    <asp:Literal ID="LiteralCountry" Visible="false" runat="server"></asp:Literal>
                    <asp:Literal ID="LiteralEmail" runat="server"></asp:Literal>
                    <asp:Literal ID="LiteralPhone" Visible="false" runat="server"></asp:Literal>
                    </p>
                </td>
                <td width="132" valign="top">
                    First Name:
                    <br />
                    Last Name:
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
                </td>
                <td width="221" valign="top">                    
                    <asp:Literal ID="LiteralFirstName_b" runat="server" /><br />
                    <asp:Literal ID="LiteralLastName_b" runat="server" /><br />
                    <asp:Literal ID="LiteralAddress_b" runat="server"></asp:Literal><br />
                    <asp:Literal ID="LiteralAddress2_b" runat="server"></asp:Literal><br />
                    <asp:Literal ID="LiteralCity_b" runat="server"></asp:Literal><br />
                    <asp:Literal ID="LiteralState_b" runat="server"></asp:Literal><br />
                    <asp:Literal ID="LiteralZip_b" runat="server"></asp:Literal><br />
                    <asp:Literal ID="LiteralCountry_b" Visible="false" runat="server"></asp:Literal>
                </td>
            </tr>
        </table>
        <p>
            &nbsp;</p>
        <p>
            &nbsp;</p>
    </div>
</div>
<!-- end stretch_container -->
<div id="receipt_bottom">
<img src="https://d186nm3tvejuoh.cloudfront.net/Images/receipt_bottom.png">
</div>
<uc:Footer runat="server" />


<!-- end footer -->
<uc:TrackingPixels ID="TrackingPixels" runat="server" />