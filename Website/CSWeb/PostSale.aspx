<%@Page Language="C#" AutoEventWireup="true" CodeBehind="PostSale.aspx.cs" Inherits="CSWeb.Root.Store.PostSale" EnableEventValidation="false" EnableSessionState="true" %>

<%@ Register Src="UserControls/Header.ascx" TagName="Header" TagPrefix="uc" %>
<%@ Register Src="UserControls/Footer.ascx" TagName="Footer" TagPrefix="uc" %>
<%@ Register Src="UserControls/TrackingPixels.ascx" TagName="TrackingPixels" TagPrefix="uc" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>

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
    <form id="form1" runat="server">
    <asp:ScriptManager ID="ScriptManager1" runat="server">
    </asp:ScriptManager>
    <asp:Panel ID="pnlManual" runat="server">
        <!-- show the content with yes or no button to process logic -->
    </asp:Panel>
    
    <uc:Header ID="Header1" runat="server" /> 

    <div runat="server" id="mainContainer">
    </div>
    <asp:Button ID="btnYes" runat="server" Text="Button" OnClick="btnYes_OnClick" Visible="false" />
    <asp:Button ID="btnNo" runat="server" Text="Button" OnClick="btnNo_OnClick" Visible="false" />
    <uc:TrackingPixels ID="TrackingPixels" runat="server" />
    </form>
    <script type="text/javascript">
        function validateForm() {
            var container = $('#mainContainer');
            var isValid = true;
            $('*[required=true]', container).each(function (a) {
                if (this.id == "") {
                    this.id = "required_" + a;
                }
                var errorMessageControlID = this.id + "_error";

                if ($("#" + errorMessageControlID).size() == 0) {
                    var message = this.getAttribute('error');
                    if (message == null) {
                        message = "*";
                    }
                    //Create control to display error message
                    $(this).after($('<span style="display:none;" class="error" id="' + errorMessageControlID + '">' + message + "</span>"));
                }

                if (!(typeof this.value === 'undefined') && this.value == "") {
                    isValid = isValid && false;
                    $("#" + errorMessageControlID).fadeIn();
                }
                else {
                    $("#" + errorMessageControlID).fadeOut();
                }
            });

            if (typeof (customValidateForm) == 'function') {
                isValid = isValid && customValidateForm();
            }

            return isValid
        }
    </script>
</body>
</html>
