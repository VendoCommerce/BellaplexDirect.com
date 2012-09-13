<%@Page Language="C#" AutoEventWireup="true" Inherits="CSWeb.Root.Store.contact" EnableSessionState="True" %>
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
<uc:Header ID="Header2" runat="server" /> 

<div id="stretch_container">
 <div id="home_left" class="otherleft">
   <div id="left_txt">
     <h2><img src="https://d186nm3tvejuoh.cloudfront.net/Images/head_contact.jpg" width="177" height="29" /></h2>
     <p>If you have any questions regarding your order, you can reach us at any time in the United States through phone or email. Our customer service lines are open 24 hours a day for all International customers.</p>
     <p style="float:left"><strong>Country you are calling from</strong><br />
       USA/CANADA<br />
       AUSTRALIA<br />
       NEW ZEALAND<br />
       GREAT BRITAIN </p>
     <p style="float:left; margin-left: 34px;"><strong>Toll Free Number</strong><br />
       (800) 515-1070<br />
       (0011) 800-3216-7711 <br />
       (00) 800-3216-7711<br />
       (00) 800-3216-7711 </p>
     <p style="float:left; margin-left: 34px;"><strong>Hours of Operation</strong><br />
       8:00 AM&mdash;10:00 PM EST<br />
       24 HOURS<br />
       24 HOURS<br />
       24 HOURS </p>
     <div class="clear"></div>
     <p><strong>NOTE:</strong> Please note that some mobile phone carriers do not allow toll free 800 numbers to the USA to connect. We suggest using a landline if you are having trouble with your mobile carrier.</p>
     <p>Alternatively, you can also call the number below, but please note that International calling rates apply.</p>
     <p><strong>(International Access Code) + 201-942-3600 [US Toll Number]</strong></p>
     <p><strong>Urban Nutrition<br />
       930 Newark Ave<br />
       Jersey City, NJ 07306 </strong></p>
     <p>You can also email us at <a href="mailto:bellaplexsupport@bellaplexdirect.com">bellaplexsupport@bellaplexdirect.com</a> to schedule a call back. Please provide First and Last Name, Country, Customer ID number, phone number, day and time to call you back. Please give us 24 hours advance notice.</p>
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

<%--..--%>

  
</body>

</html>