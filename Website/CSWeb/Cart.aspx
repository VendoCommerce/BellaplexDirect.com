<%@Page Language="C#" AutoEventWireup="true" Inherits="CSWeb.Root.Store.cart" EnableSessionState="True" %>
<%@ Register Src="UserControls/TrackingPixels.ascx" TagName="TrackingPixels" TagPrefix="uc" %>
<%@ Register Src="UserControls/ShippingCreditForm.ascx" TagName="ShippingCreditForm"
    TagPrefix="uc" %>
    <%@ Register Src="UserControls/Bottomcta.ascx" TagName="Bottomcta" TagPrefix="uc" %>
<%@ Register Src="UserControls/footer.ascx" TagName="footer" TagPrefix="uc" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml" xml:lang="en">
<head id="Head1" runat="server">

<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
    <title>Order Bellaplex Now! - Wrinkle Reduction &amp; Prevention</title>

<script type="text/javascript" src="/Scripts/jquery-1.6.4.min.js"></script>
<script type="text/javascript" src="/js/autoTab.js"></script>

<link href="https://d186nm3tvejuoh.cloudfront.net/Css/cloudglobal.css" rel="stylesheet" type="text/css" media="all" />
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

<div id="cart_header">
<p id="phone_number">For Phone Orders Call: (800) 515-1070</p> 
</div>

<div id="stretch_container">
    <form id="Form1" runat="server">
        <uc:ShippingCreditForm ID="ShippingCreditForm1" runat="server" RedirectUrl="Store/AddProduct.aspx" Visible="true" />

    </form>
    <div style="clear: both"></div>
    &nbsp;
</div>
<div id="footer">
	<p style="float:left; margin-top:8px;">Copyright &copy; 2011. All rights reserved.</p>
</div>

<uc:TrackingPixels ID="TrackingPixels1" runat="server" />

</body>
</html>