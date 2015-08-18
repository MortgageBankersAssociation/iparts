<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="PanelEditDialog.aspx.cs" Inherits="Asi.Web.iParts.Common.PanelEditor.PanelEditDialog" %>

<asp:Content id="UDFContent" runat="server" ContentPlaceHolderID="TemplateBody">
    <asiweb:PanelTemplateControl ID="editPanel" runat="server" style="height:95%;overflow:inherit;" ShowHeader="false" Collapsible="false" BorderStyle="None">
        <asp:Label id="successMessage" runat="server" Visible="false" CssClass="Info" />
        <br />
        <asp:Panel id="editablePanel" runat="server" CssClass="FullWidth"></asp:Panel>
    </asiweb:PanelTemplateControl>  
</asp:Content>
