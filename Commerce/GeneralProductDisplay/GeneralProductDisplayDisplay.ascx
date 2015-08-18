<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="GeneralProductDisplayDisplay.ascx.cs" Inherits="Asi.Web.iParts.Commerce.GeneralProductDisplay.GeneralProductDisplayDisplay" %>
<%@ Register TagPrefix="telerik" Namespace="Telerik.Web.UI" Assembly="Telerik.Web.UI" %>
<%@ Register TagPrefix="asiweb" Assembly="Asi.Web" Namespace="Asi.Web.UI.WebControls" %>
<%@ Reference Control="ProductDisplayDisplay.ascx" %>
<asiweb:StyledLabel runat="server" ID="TopMessage" Visible="false" Text="" />
<asp:Placeholder id="ProductDisplayPlaceholder" runat="server" ></asp:Placeholder>     
