<%@Page Language="C#" AutoEventWireup="true" CodeBehind="CardDecline.aspx.cs" Inherits=" CSWeb.Root.Store.CardDecline" EnableSessionState="True" %>
<%@ Register Src="UserControls/CardDecline.ascx" TagName="Form" TagPrefix="uc1" %>

<%@ Register Src="UserControls/TrackingPixels.ascx" TagName="TrackingPixels" TagPrefix="uc" %>
<%@ Register Src="UserControls/Header.ascx" TagName="Header" TagPrefix="uc" %>
<%@ Register Src="UserControls/footer.ascx" TagName="footer" TagPrefix="uc" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml">
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
    <form id="form1" runat="server">
    <div>
        <uc1:Form id="ucCardDecline" runat="server" />

    </div>
    </form>
    <br />
    <uc:footer ID="Footer1" runat="server" />

<uc:TrackingPixels ID="TrackingPixels1" runat="server" />
</body>
</html>
