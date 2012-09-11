<%@Control Language="C#" AutoEventWireup="true" Inherits="CSWeb.Root.UserControls.ReviewOrder" %>
<div id="voted" style="display: none; background: url(/Content/images/voted_overlay.png) no-repeat;
    width: 364px; height: 507px; z-index: 100; position: relative;">
    <a href="#" onclick="Popup.hide('voted')" style="position: absolute; width: 91px;
        height: 34px; left: 238px; top: 13px;"></a>
</div>
<div id="included" style="text-align: center; display: none;">
    <a href="#" onclick="Popup.hide('included')">
        <img src="/Content/images/whats_included_overlay.png" width="596" height="640"
            border="0" /></a></div>
<div id="guarantee" style="display: none; background: url(/Content/images/guarantee.png) no-repeat;
    width: 586px; height: 501px;">
    <a href="#" onclick="Popup.hide('guarantee')" style="position: relative; left: 469px;
        top: 33px;">
        <img src="/Content/images/close_blank.png" alt="No No Hair - Go weeks without shaving, and get long-term results! As Seen on TV" /></a>
    <p style="padding-top: 140px">
        We are so confident that you'll love your no!no! Hair device that if after using
        it for at least 45 days & no more than 60 days and you are not satisfied then we
        will:
    </p>
    <p style="text-indent: 20px">
        <strong>1. Refund the full Product Price! </strong>
    </p>
    <p style="text-indent: 20px">
        <strong>2. Refund The Shipping & Handling!</strong></p>
    <p style="text-indent: 20px">
        <strong>3. Pay The Cost To Ship It Back To Us!</strong></p>
    <p>
        To qualify for the triple guarantee you must have purchased directly from this website.
        Full guarantee details as well as the process for issuing an RMA and a prepaid return
        shipping label will be included with your order. If you choose to return before
        you've used the unit for at least 45 days then we will still gladly refund your
        product price but the cost of postage to return is your responsibility.
    </p>
</div>
<div id="header">
    <a id="nav-home" href="/default.aspx"></a><a id="nav-howitworks" href="/howitworks.aspx">
    </a><a id="nav-advantage" href="/advantage.aspx"></a><a id="nav-faq" href="/faq.aspx">
    </a><a id="nav-success" href="/successstories.aspx"></a><a id="nav-press" href="/press.aspx">
    </a><a id="nav-try" href=""></a><a id="nav-logo" href="/default.aspx"></a><a id="nav-voted"
        href="#" onclick="Popup.showModal('voted',null,null,{'screenColor':'#fff','screenOpacity':.5});return false;">
    </a><a id="nav-mcafee" target="_blank" href="https://www.mcafeesecure.com/RatingVerify?ref=www.trynono.com">
        <img width="65" height="37" border="0" src="//images.scanalert.com/meter/www.trynono.com/63.gif"
            alt="McAfee SECURE sites help keep you safe from identity theft, credit card fraud, spyware, spam, viruses and online scams"
            oncontextmenu="alert('Copying Prohibited by Law - McAfee Secure is a Trademark of McAfee, Inc.'); return false;"></a>
    <div id="phone_number" style="position: absolute; top: 97px; left: 573px; color: #515151;
        font-size: 14px; font-weight: bold;">
        For Phone Orders Call: (800) 948-8215
    </div>
    <h1>
        No&#33;No&#33; Hair - Go weeks without shaving, and get long-term results! As Seen
        on TV</h1>
</div>
<!-- end header -->
<div id="stretch_container">
    <div id="receipt_content" style="background: url(/Content/images/receipt_bg.png) no-repeat;
        height: auto; width: 801px; position: relative; padding-top: 40px; padding-left: 80px;
        padding-right: 80px;">
        <p style="line-height: normal; padding-bottom: 10px; font-size: 30px; color: #000;
            margin: 0;">
            Thank you for your order!</p>
        <p style="color: #000; font-size: 13px;">
            If you have any questions, feel free to contact our Customer Service team by email
            at <a href="mailto:cs@trynono.com">cs@trynono.com</a>
            <br />
            or call our toll-free number (888) 525-7580.</p>
        <asp:DataList runat="server" ID="dlShoppingCart" OnItemDataBound="dlShoppingCart_OnItemDataBound"
            DataKeyField="SkuId" OnItemCommand="dlShoppingCart_OnItemCommand">
            <HeaderTemplate>
                <table border="0" cellpadding="2" cellspacing="1" style='width: 100%;' class="cart_table">
            </HeaderTemplate>
            <ItemTemplate>
                <tr align="left">
                    <td>
                        <asp:Label runat="server" ID='lblSkuDescription' CssClass="basket_description"></asp:Label>
                        <asp:Label runat="server" ID='lblSkuCode'></asp:Label>
                    </td>
                    <td align="center">
                        <asp:TextBox runat="server" ID="txtQuantity" Font-Size="8pt" MaxLength="3" Columns="2"></asp:TextBox>
                    </td>
                    <td align="center">
                        <asp:Label runat="server" ID='lblSkuInitialPrice' CssClass="product_price"></asp:Label>
                    </td>
                    <td runat="server" width="1%" id='holderRemove'>
                        <asp:ImageButton ID="btnRemoveItem" runat="server" CommandName="delete" CausesValidation="false"
                            CssClass="ucRemoveButtonOverlay" ImageUrl="/Content/images/delete.gif" />
                    </td>
                </tr>
            </ItemTemplate>
           
        </asp:DataList>
        <tr>
            <td colspan="4" align="right">
                     <asp:Button ID="btnUpdate" runat="server" OnCommand="btnUpdate_OnCommand" Text="Update"
                    CausesValidation="true" />
            </td>
        </tr>
        <asp:Panel ID="pnlTotal" runat="server">
            <tr>
                <td colspan="4" class="horizontal_dots">
                </td>
            </tr>
            <tr>
                <td class='cartSubtotalTitle' align="right" colspan="3">
                    Subtotal:
                </td>
                <td class='cartSubtotalValue' align="center">
                    <asp:Literal runat="server" ID='lblSubtotal'></asp:Literal>
                </td>
            </tr>
            <tr>
                <td class='cartSubtotalTitle' align="right" colspan="3">
                    Tax:
                </td>
                <td class='cartSubtotalValue' align="center">
                    <asp:Literal runat="server" ID="lblTax"></asp:Literal>
                </td>
            </tr>
            <tr>
                <td class='cartSubtotalTitle' align="right" colspan="3">
                    Shipping:
                </td>
                <td class='cartSubtotalValue' align="center">
                    <asp:Literal runat="server" ID="lblShipping"></asp:Literal>
                </td>
            </tr>
            <tr id='holderRushShippingTotal' runat="server">
                <td class='cartSubtotalTitle' align="right" colspan="3">
                    Rush Shipping:
                </td>
                <td class='cartSubtotalValue' align="center">
                    <asp:Literal runat="server" ID="lblRushShipping"></asp:Literal>
                </td>
            </tr>
            <tr>
                <td class='cartSubtotalTitle' align="right" colspan="3">
                    Order Total:
                </td>
                <td class='cartSubtotalValue' align="center">
                    <asp:Literal runat="server" ID="lblOrderTotal"></asp:Literal>
                </td>
            </tr>
        </asp:Panel>
        </table>
    </div>
</div>
<div class="form_line clearfix">
    <label class="label-2">
        Send me new Product Updates
        <br />
        and Special Offers.</strong></label>
    <input type="checkbox" checked="checked" class="checkbox-right" />
</div>
<div class="form_line_btn">
    <asp:ImageButton ID="ImageButton1" TabIndex="129" OnClick="btnTry_OnClick" runat="server"
        ImageUrl="/Content/images/try_it_now_btn.png" />
</div>
<div id="receipt_bottom" style="position: relative; margin: 0 auto; padding: 0; width: 961px;">
    <img src="/Content/images/receipt_bottom.png" width="961" height="41" /></div>
<div id="footer">
    <p style="text-align: center">
        <img src="/Content/images/social_links.png" alt="Follow us on Facebook and Twitter"
            width="157" height="29" border="0" usemap="#social" />
        <map name="social" id="social">
            <area shape="rect" coords="89,0,120,29" href="http://www.facebook.com/pages/Nono-by-Radiancy/119755104749512?v=photos#!/pages/Nono-by-Radiancy/119755104749512?v=wall"
                target="_blank" />
            <area shape="rect" coords="128,0,156,29" href="http://twitter.com/#!/RadiancyLHE"
                target="_blank" />
        </map>
    </p>
    <p>
        &nbsp;
    </p>
    <p>
        <a href="/default.aspx">Home</a>&nbsp;&nbsp;|&nbsp;&nbsp;<a href="/howitworks.aspx">How
            It Works</a>&nbsp;&nbsp;|&nbsp;&nbsp;<a href="/advantage.aspx">The no!no Advantage</a>&nbsp;&nbsp;|&nbsp;&nbsp;<a
                href="/faq.aspx">FAQs</a>&nbsp;&nbsp;|&nbsp;&nbsp;<a href="/successstories.aspx">Success
                    Stories</a>&nbsp;&nbsp;|&nbsp;&nbsp;<a href="/contactus.aspx">Contact Us</a>&nbsp;&nbsp;|&nbsp;&nbsp;<a
                        href="/press.aspx">Press</a>&nbsp;&nbsp;|&nbsp;&nbsp;<a href="/privacypolicy.aspx"
                            target="_blank">Privacy Policy</a>&nbsp;&nbsp;|&nbsp;&nbsp;<a href="#" onclick="Popup.showModal('guarantee',null,null,{'screenColor':'#fff','screenOpacity':.5});return false;">Triple
                                Guarantee Return Policy</a>&nbsp;&nbsp;|&nbsp;&nbsp;<a href="/warranty.aspx">Product
                                    Warranty</a></p>
    <p>
        &nbsp;
    </p>
    <p>
        Copyright&nbsp;&copy;&nbsp;2010. All rights reserved.</p>
    <p>
        &nbsp;
    </p>
</div>
<!-- end footer -->
<script type="text/javascript">
    var gaJsHost = (("https:" == document.location.protocol) ? "https://ssl." : "http://www.");
    document.write(unescape("%3Cscript src='" + gaJsHost + "google-analytics.com/ga.js' type='text/javascript'%3E%3C/script%3E"));
</script>
<asp:Literal ID="GoogleAnalytics" runat="server"></asp:Literal>
<asp:Literal ID="GoogleAdwords" runat="server"></asp:Literal>
<script type="text/javascript" src="https://www.googleadservices.com/pagead/conversion.js">
</script>
<noscript>
    <div style="display: inline;">
        <img height="1" width="1" style="border-style: none;" alt="" src="https://www.googleadservices.com/pagead/conversion/1035651407/?value=100.0&amp;label=VAbNCMfamQEQz5Lr7QM&amp;guid=ON&amp;script=0" />
    </div>
</noscript>
<asp:Literal ID="MaxBounty" runat="server" Visible="False"></asp:Literal>
<asp:Literal ID="AsSeenOnPc" runat="server" Visible="False"></asp:Literal>
<asp:Literal ID="HitLinks" runat="server" Visible="False"></asp:Literal>
<script type="text/javascript">    if (!window.mstag) mstag = { loadTag: function () { }, time: (new Date()).getTime() };</script>
<script id="mstag_tops" type="text/javascript" src="//flex.atdmt.com/mstag/site/6be325f1-e30d-47f0-b90f-2458114e26ab/mstag.js"></script>
<script type="text/javascript">    mstag.loadTag("conversion", { cp: "5050", dedup: "1" })</script>
<noscript>
    <iframe src="//flex.atdmt.com/mstag/tag/6be325f1-e30d-47f0-b90f-2458114e26ab/conversion.html?cp=5050&dedup=1"
        frameborder="0" scrolling="no" width="1" height="1" style="visibility: hidden;
        display: none"></iframe>
</noscript>
<img src="https://secure.fastclick.net/w/roitrack.cgi?aid=11770" width="1" height="1"
    border="0">
<!-- Google Code for Conversion Page Remarketing List -->
<script type="text/javascript">
/* <![CDATA[ */
var google_conversion_id = 1035651407;
var google_conversion_language = "en";
var google_conversion_format = "3";
var google_conversion_color = "666666";
var google_conversion_label = "V7fzCI3vjAIQz5Lr7QM";
var google_conversion_value = 0;
/* ]]> */
</script>
<script type="text/javascript" src="https://www.googleadservices.com/pagead/conversion.js">
</script>
<noscript>
    <div style="display: inline;">
        <img height="1" width="1" style="border-style: none;" alt="" src="https://www.googleadservices.com/pagead/conversion/1035651407/?label=V7fzCI3vjAIQz5Lr7QM&amp;guid=ON&amp;script=0" />
    </div>
</noscript>
