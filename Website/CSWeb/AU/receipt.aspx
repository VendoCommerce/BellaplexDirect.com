<%@Page Language="C#" AutoEventWireup="true" Inherits="CSWeb.AU.Store.receipt" EnableViewState="true" EnableSessionState="True" %>
<%@ Register Src="UserControls/CheckoutThankYouModule.ascx" TagName="Form"
    TagPrefix="uc1" %>


<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
   <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>Keranique - Fuller Looking Hair - Thicker Looking Hair</title>

<link href="/Styles/cloudglobal_b2.css" rel="stylesheet" type="text/css" media="all" />
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
     <uc1:Form ID="Form1" runat="server" />
    </body>
</html>
  

