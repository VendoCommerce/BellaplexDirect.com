<%@Page Language="C#" AutoEventWireup="true" CodeBehind="ShoppingCart.aspx.cs" Inherits="CSWeb.AU.Store.ShoppingCartv4" EnableViewState="true" EnableSessionState="True" %>
<%@ Register Src="~/UserControls/ShippingBillingCreditControl.ascx" TagName="ShippingBillingCreditControl"
    TagPrefix="uc" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>CART C</title>
<link href="Styles/plugnsafeglobal.css" rel="stylesheet" type="text/css" />
</head>

<body>
<form id="Form1" runat="server">
<div id="cart_content_C" class="clearfix">

<table width="100%" border="0" cellspacing="0" cellpadding="0" class="shoppingcart_top">
  <tr>
    <td colspan="5" class="shoppingcart_header">Shopping Cart</td>
    </tr>
  <tr>
    <td align="center" class="shoppingcart_subheader">Item</td>
    <td class="shoppingcart_subheader">Description</td>
    <td class="shoppingcart_subheader">Size</td>
    <td class="shoppingcart_subheader">Quantity</td>
    <td class="shoppingcart_subheader">Price</td>
  </tr>
  <tr>
    <td align="center"><img src="images/cart_product_pic.png" width="111" height="74" alt="Ahh Bra" /></td>
    <td><p class="product_title">Ahh Bra</p>
    <p class="product_description">Lorem ipsum dolor sit amet, consectetur adipiscing elit. Ut nec vehicula urna. Maec enas gravida placerat turpis, sit amet dictum diam porta vitae. Maecenas vel velit aug ue, et sodales nunc. Ut erat sem, tincidunt pellentesque.</p></td>
    <td valign="top">
      <select name="select" id="select" class="shoppingtop_select">
      <option>XS</option>
      <option>S</option>
      
      </select></td>
    <td valign="top">
      <select name="select2" id="select2" class="shoppingtop_select">
      <option>1</option>
      <option>2</option>
      <option>3</option>
      </select></td>
    <td valign="top">$59.99</td>
  </tr>
  <tr>
    <td colspan="3" class="shoppingtop_promo"><label>Promotional Code:
    </label>      <input name="" type="text" />
    </td>
    <td class="shoppingtop_summary">Subtotal:<br />
      S&amp;H:<br />
      Total:</td>
    <td class="shoppingtop_price">$59.99<br />
      $9.99<br />
      $69.98</td>
  </tr>
</table>
<uc:ShippingBillingCreditControl runat="server" ID="Shipping">
                        </uc:ShippingBillingCreditControl>

</div>
<!-- end cart_content -->
</form>
</body>
</html>