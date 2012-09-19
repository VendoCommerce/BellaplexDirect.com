<%@Page Language="C#" AutoEventWireup="true" Inherits="CSWeb.AU.Store.Return" EnableSessionState="True" %>
<%@ Register Src="UserControls/TrackingPixels.ascx" TagName="TrackingPixels" TagPrefix="uc" %>

<%@ Register Src="UserControls/BillingForm.ascx" TagName="BillingFormControl" TagPrefix="uc" %>

<%@ Register Src="UserControls/Header.ascx" TagName="Header" TagPrefix="uc" %>
<%@ Register Src="UserControls/Bottomcta.ascx" TagName="Bottomcta" TagPrefix="uc" %>
<%@ Register Src="UserControls/footer.ascx" TagName="footer" TagPrefix="uc" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml" xml:lang="en">

<head id="Head1" runat="server">

<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
    <title>Order Bellaplex Now! - Wrinkle Reduction &amp; Prevention</title>

<link href="https://d186nm3tvejuoh.cloudfront.net/Css/cloudglobal.css" rel="stylesheet" type="text/css" media="all" />
<script type="text/javascript" src="/Scripts/jquery-1.6.4.min.js"></script>
<script type="text/javascript" src="/js/autoTab.js"></script>

<link href="Styles/cloudglobal_b2.css" rel="stylesheet" type="text/css" media="all" />

<style>

#ucForm_TextBoxPhone{
	width:30px;
}

#ucForm_TextBoxPhone1{
	width:30px;
}

</style>

</head>

  <body>

  <uc:Header ID="Header1" runat="server" /> 

  
<div id="stretch_container">
 <div id="home_left" class="otherleft">
   <div id="left_txt">
     <h2><img src="https://d186nm3tvejuoh.cloudfront.net/Images/head_return.jpg" width="204" height="35" /></h2>
     <p>WHEN YOU ORDER YOUR 2 RISK FREE BOTTLES TODAY, GET DISCOUNTED SHIPPING AND PROCESSING of just $1.99 billed to your card today!  With our 30 Day Money Back Guarantee, if you're not completely satisfied, you can call within 30 days of receipt to cancel and return the product as instructed and will not be billed any additional amount. If you decide to keep the bottles, you will be billed in two easy payments of $69.95, the first 30 days and second payment 60 days following receipt of trial shipment. </p>
     <p>Then unless you cancel, you will continue to receive a fresh 60 day supply every 2 months with the same guaranteed low price of just $69.95 per month plus $7.95 S&amp;P per shipment which will be conveniently billed to the card you provided today. By clicking &quot;Order Securely&quot;, you authorize us to charge your card for each 2 bottle shipment per the terms described above. There is no commitment to continue and no minimum purchase.  You can call customer service at 1-800-515-1070 at any time to cancel. Each shipment you receive is covered by the same 30-day Money Back Guarantee, just call within 30 days and return the product within two weeks for a full refund of the purchase price!</p>
   </div>
 </div>
    <div id="home_right">

 <form id="form1" runat="server">
            <uc:BillingFormControl ID="ucForm" runat="server" RedirectUrl="Store/AddProduct.aspx" />


        </form>

    </div> 
    <div id="clear"></div>
  


</div>

<uc:Bottomcta runat="server" />

<uc:footer runat="server" />

<uc:TrackingPixels ID="TrackingPixels1" runat="server" />
 
</body>

</html