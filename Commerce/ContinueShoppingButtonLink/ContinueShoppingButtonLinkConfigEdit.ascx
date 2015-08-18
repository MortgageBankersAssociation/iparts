<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="ContinueShoppingButtonLinkConfigEdit.ascx.cs"
    Inherits="Asi.Web.iParts.Commerce.ContinueShoppingButtonLink.ContinueShoppingButtonLinkConfigEdit" %>
<asiweb:PanelTemplateControl ID="ContainerPanel" runat="server" FieldSet="true" ShowHeader="false"
    BorderStyle="None">
    <asiweb:SmartControl ID="PageTitle" runat="server" BoundPropertyName="PageTitle" 
        DisplayCaption="true" DataSaveUponStateChange="false" />
    <div class="AutoWidth">
        <asiweb:SmartControl 
            ID="DoNotRenderInDesignMode" runat="server" 
            BoundPropertyName="DoNotRenderInDesignMode" DisplayCaption="true" 
            PositionCaption="Right" DataSaveUponStateChange="false" />
        <asiweb:SmartControl 
            ID="ShowBorderControl" runat="server" BoundPropertyName="ShowBorder" 
            DisplayCaption="true" PositionCaption="Right" DataSaveUponStateChange="false" />
            <asiweb:SmartControl TextBoxWidth="20em" ID="ContinueShoppingUrl" runat="server" BoundPropertyName="ContinueShoppingUrl" DisplayCaption="true" DataSaveUponStateChange="false" />
            
    </div>    
</asiweb:PanelTemplateControl>