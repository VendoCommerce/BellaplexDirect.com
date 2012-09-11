<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="CacheUtility.aspx.cs" Inherits="CSWeb.Admin.CacheUtility" MasterPageFile="AdminSite.master" %>

<asp:Content ID="BodyContent" runat="server" ContentPlaceHolderID="MainContent">
No Cache Items: <asp:Label ID="lbltext" runat="server" Text=""></asp:Label><br /><br />

<asp:DropDownList ID="ddlList" runat="Server" AutoPostBack="false">

</asp:DropDownList>
<asp:LinkButton ID="lbItemAdd" runat="server" CssClass="link" OnCommand="btnAction_Command"
                        CommandName="Cache" Text="RemoveCache" />
   </asp:Content>