<%@Page Language="C#" AutoEventWireup="true" Inherits="CSWeb.AU.Store.receipt_friendly" EnableViewState="true" EnableSessionState="True" %>
<%@ Register Src="UserControls/CheckoutThankYouModule_friendly.ascx" TagName="Form"
    TagPrefix="uc1" %>


<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
   <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>Keranique</title>
<link href="/Styles/cloudglobal_b2.css" rel="stylesheet" type="text/css" media="all" />
 <script src="https://api5.thesearchagency.net/v2/a5/tsaapi.js" language="JavaScript" type="text/javascript"></script> 
  <style>
body {
	background: none;	
}

#receipt_table1 td, #receipt_table2 td {
color: #000;	
}
</style>
    </head>
    <body onload="window.print();">
     <uc1:Form ID="Form1" runat="server" />
    </body>
</html>
  

