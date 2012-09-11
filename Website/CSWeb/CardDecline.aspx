﻿<%@Page Language="C#" AutoEventWireup="true" CodeBehind="CardDecline.aspx.cs" Inherits=" CSWeb.Root.Store.CardDecline" EnableSessionState="True" %>
<%@ Register Src="UserControls/CardDecline.ascx" TagName="Form" TagPrefix="uc1" %>

<%@ Register Src="UserControls/TrackingPixels.ascx" TagName="TrackingPixels" TagPrefix="uc" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml">
<head id="Head1" runat="server">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
    <title>Keranique - Fuller Looking Hair - Thicker Looking Hair</title>

<link href="Styles/cloudglobal_b2.css" rel="stylesheet" type="text/css" media="all" />
<style>
 body {
    background: url("https://dd991rkqr6iba.cloudfront.net/Images/site_bg.png") repeat-x scroll 0 0 #B9B9B9;
    font-family: Arial,Helvetica,sans-serif;
    font-size: 13px;
    margin: 0;
    padding: 0;
}   
    
#receipt_content p {
	color: #515151;
	padding-bottom: 20px;
	line-height: 21px;
	font-size: 14px;
}

#receipt_content p.ask {
	font-weight: bold;
	font-size: 33px;
	line-height: normal;
}

#footer 
{
    top: 0;
}

</style>
</head>
<body>
    <form id="form1" runat="server">
    <div>
        <uc1:Form id="ucCardDecline" runat="server" />

        <uc:TrackingPixels ID="ucTrackingPixels" runat="server" />

    </div>
    </form>
</body>
</html>