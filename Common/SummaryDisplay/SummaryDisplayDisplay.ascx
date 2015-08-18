<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="SummaryDisplayDisplay.ascx.cs" Inherits="Asi.Web.iParts.Common.SummaryDisplay.SummaryDisplayDisplay" %>
<%@ Register TagPrefix="telerik" Namespace="Telerik.Web.UI" Assembly="Telerik.Web.UI" %>

<asp:Panel ID="ContentPanel" runat="server" Visible="true">
    <asiweb:TitleBar ID="TitleBar" Text="<%#PageTitle%>" OptionsMenuBehavior="AlwaysDisplay" runat="server" />
    <asiweb:paneltemplatecontrol ID="QueryControlsPanel" runat="server" FieldSet="true" ShowHeader="false" BorderStyle="None" >
        <asiweb:StyledLabel ID="errorLabel" runat="server" CssClass="Error"></asiweb:StyledLabel>
        <asiweb:PanelTemplateColumn ID="PanelTemplateColumn1" runat="server"  >

        </asiweb:PanelTemplateColumn>
    </asiweb:paneltemplatecontrol>
</asp:Panel>       
