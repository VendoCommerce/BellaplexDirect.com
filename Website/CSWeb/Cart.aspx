<%@Page Language="C#" AutoEventWireup="true" Inherits="CSWeb.Root.Store.cart" EnableSessionState="True" %>
<%@ Register Src="UserControls/TrackingPixels.ascx" TagName="TrackingPixels" TagPrefix="uc" %>
<%@ Register Src="UserControls/ShippingCreditForm.ascx" TagName="ShippingCreditForm"
    TagPrefix="uc" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml" xml:lang="en">
<head id="Head1" runat="server">

<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
	<title>Keranique Checkout</title>
<script type="text/javascript" src="https://ajax.googleapis.com/ajax/libs/jquery/1.7.1/jquery.min.js"></script>

	<script type="text/javascript" src="fancybox/jquery.fancybox-1.3.4.pack.js"></script>
	<link rel="stylesheet" type="text/css" href="fancybox/jquery.fancybox-1.3.4.css" media="screen" />
	<script type="text/javascript">
	    $(document).ready(function () {
	        $("a.popup").fancybox({
	            'width': 700,
	            'height': 400,
	            'margin': 20,
	            'padding': 20,
	            'overlayColor': '#333',
	            'autoScale': false,
	            'centerOnScroll': true,
	            'transitionIn': 'none',
	            'transitionOut': 'none',
	            'type': 'iframe'
	        });
	    });

	    function MM_showHideLayers() { //v9.0
	        var i, p, v, obj, args = MM_showHideLayers.arguments;
	        for (i = 0; i < (args.length - 2); i += 3)
	            with (document) if (getElementById && ((obj = getElementById(args[i])) != null)) {
	                v = args[i + 2];
	                if (obj.style) { obj = obj.style; v = (v == 'show') ? 'block' : (v == 'hide') ? 'none' : v; }
	                obj.display = v;
	            }
	    }
    </script>

<script type="text/javascript">


    function pageLoad(sender, args) {


        $('.label_check input:checkbox:checked').attr("checked", false);

        $('.label_check').click(function () {
            var $checkbox = $(this).find(':checkbox');
            $(this).toggleClass('c_on');
            $checkbox.attr('checked', !$checkbox.attr('checked'));

        });
    };

    // end -->
</script>

<link media="all" rel="stylesheet" href="Styles/cloudglobal_b2.css" type="text/css" />

</head>

<body class="checkout">
<form runat="server">
<div class="content">
<div class="checkout_header"><img src="https://dd991rkqr6iba.cloudfront.net/Images/top_cc.jpg" width="912" height="101" alt="Thinning hair solution for women" /></div>
<div class="center_content">
      <div class="checkout_left">
    <div class="orderDetails">
          <div class="orderTitle">
        <h2>Order Details</h2>
      </div>
          <div class="orderProduct orderPadding"> <img class="product" alt="Keranique thinning hair solution" src="https://dd991rkqr6iba.cloudfront.net/Images/product_cc.jpg">
        <div class="contentProduct">
              <h4>Keranique Thinning Hair Solution</h4>
              <p style="color: #7a7a7a; font-size: 11px; line-height: normal; margin-top: 7px; width: 260px;">When you order Keranique Hair Rejuvenating System to try RISK FREE for 30 days, you receive Revitalizing Shampoo for Thinning Hair, Volumizing Conditioner, Hair Regrowth treatment, and 8-Day Intensive Scalp Treatment. Plus, you receive a free gift of Fortifying Mousse. You pay only $3.95 for shipping and processing today. With our 30 Day Money Back Guarantee, if you're not completely satisfied, you can call within 30 days of receipt to cancel and return the product as instructed and will not be billed any additional amount, and the free gifts are yours to keep. </p>
        </div>
        <div class="priceProduct">
              <h1 class="highlight">TRIAL</h1>
            </div>
        <div class="clear"></div>
      </div>
      <div class="orderProduct orderPadding">
<img class="product" width="93" height="99" alt="Fortifying Mousse and daily essentials" src="https://dd991rkqr6iba.cloudfront.net/Images/gift_cc.jpg">
<div class="contentProduct">
<h4>
<span class="highlight">Order Today</span>
and receive Fortifying
<br>
Mousse Gift!
</h4>
<ul>
<li>1 Bottle of Keranique Fortifying Mousse</li>
</ul>
</div>
<div class="priceProduct">
<span class="line-through">$20.00</span>
<h1 class="highlight">FREE</h1>
</div>
    <div class="clear"></div>  
        </div> 
        <div id="redeem_toggle">
 <div class="orderCode">
<div id="discount-form" class="active">
<h3 class="left">SAVE 50% off shipping!</h3>

<p class="enterCode">
SHIPSAVE
</p>
<p class="submitCode" onclick="MM_showHideLayers('redeem_toggle','','hide','redeem_toggle2','','show')">

</p>

</div>

</div>       
     <div id="orderShipping" class="orderPadding">
<strong>

<span id="regular-price-sm">Shipping &amp; Processing: $7.95</span>
</strong>
<h2 class="right">
<span id="regular-price">ONLY PAY $7.95 TODAY!</span>
</h2>
<div class="clear"></div>
</div>   
    </div>  
    
     <div id="redeem_toggle2" style="display:none">
 <div class="orderCode" style="text-align:center">
<img width="524" height="59" src="https://dd991rkqr6iba.cloudfront.net/Images/discount-applied_cc.png">

</div>       
     <div id="orderShipping" class="orderPadding" style="background:#e8d3dd;">
<strong>

<span id="regular-price-sm">Shipping &amp; Processing: $3.95</span>
</strong>
<h2 class="right">
<span id="regular-price" class="highlight">ONLY PAY $3.95 TODAY!</span>
</h2>
<div class="clear"></div>
</div>   
    </div>    
    
    
      
        </div>
        <div class="terms">
          <p>*Terms &amp; Conditions: Congratulations on taking the first step to fuller, thicker hair. We are confident you will obtain results from Keranique that you will not find in any other hair products. If you decide to keep the products, you will be billed in two easy payments of $79.95, the first 30 days and second payment 60 days following receipt of trial shipment. Then, unless you cancel, you will continue to receive a fresh 60 day supply every 2 months with the same guaranteed low price of just $79.95 per month plus $7.95 S&P per shipment which will be conveniently billed to the card you provided today. By clicking "Rush My Order", you authorize us to charge your card for each shipment per the terms described above. There is no commitment to continue and no minimum purchase. You can call customer service at 1-888-237-4131 at any time to cancel. Each shipment you receive is covered by the same 30-day Money Back Guarantee, just call within 30 days and return the product within two weeks for a full refund of the purchase price!</p>
          <p style="text-align:center"><img src="https://dd991rkqr6iba.cloudfront.net/Images/logos_cc.png"></p>
        </div>
        
         </div>

         <uc:ShippingCreditForm runat="server" RedirectUrl="Store/AddProduct.aspx" />
      

    <div class="clear"></div>
    <div id="footer"> <a href="terms/privacy.aspx" class="popup">Privacy Policy</a> | <a href="terms/returns.aspx" class="popup">Returns / Cancellations</a> | <a href="terms/offers.aspx" class="popup">Offer Terms</a> | <a href="terms/contact.aspx" class="popup">Contact</a><br />
          © 2012 All Rights Reserved. </div>
 </div></div>
   
   <uc:TrackingPixels runat="server" />
</form>
</body>
</html>