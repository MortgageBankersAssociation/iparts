<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="SSRSReportDisplay.ascx.cs" Inherits="Asi.Web.iParts.Common.SSRSReport.SSRSReportDisplay" %>
<%@ Register TagPrefix="rsweb" Assembly="Microsoft.ReportViewer.WebForms, Version=10.0.0.0, Culture=neutral, PublicKeyToken=b03f5f7f11d50a3a"  Namespace="Microsoft.Reporting.WebForms"  %>
<%@ Register TagPrefix="asiweb" Namespace="Asi.Web.UI.WebControls" %>

<asp:Panel ID="ContentPanel" runat="server" Visible="true">
    <asp:Label ID="errorLabel" runat="server" CssClass="Error" Visible="false" />
    <asiweb:TitleBar ID="TitleBar" Text="<%#PageTitle%>" OptionsMenuBehavior="AlwaysDisplay" runat="server" />
    <asp:PlaceHolder ID="ChildControlsPlaceHolder" Runat="server" Visible="true" /> 
    <asiweb:StyledLabel ID="ErrorMsgPlaceHolder" runat="server" Visible="false" />
    <asiweb:StyledLabel ID="DesignViewLabel" runat="server" Visible="false" />
</asp:Panel>