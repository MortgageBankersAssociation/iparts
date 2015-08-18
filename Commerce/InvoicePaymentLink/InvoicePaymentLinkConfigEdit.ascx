<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="InvoicePaymentLinkConfigEdit.ascx.cs" Inherits="Asi.Web.iParts.Commerce.InvoicePaymentLink.InvoicePaymentLinkConfigEdit" %>

<asiweb:paneltemplatecontrol ID="ContainerPanel" runat="server" FieldSet="true" ShowHeader="false" BorderStyle="None"> 
    <div>
        <asiweb:SmartControl 
            ID="LinkText" runat="server" BoundPropertyName="LinkText" 
            DisplayCaption="true" PositionCaption="Left" DataSaveUponStateChange="false" />
    </div>
    <div>
        <asiweb:SmartControl 
            ID="InvoiceLegend" runat="server" BoundPropertyName="InvoiceLegend" 
            DisplayCaption="true" PositionCaption="Left" DataSaveUponStateChange="false" />        
    </div>
    <div class="AutoWidth">
        <asiweb:SmartControl 
            ID="InvoiceTypeCaption" runat="server" BoundPropertyName="InvoiceTypeCaption" DisplayType="Caption" 
            DisplayCaption="true" PositionCaption="Left" DataSaveUponStateChange="false" />        
        <div class="SubItems">
            <asiweb:SmartControl 
                ID="InvoiceTypeStandard" runat="server" BoundPropertyName="InvoiceTypeStandard" 
                DisplayCaption="true" PositionCaption="Right" DataSaveUponStateChange="false" />
            <asiweb:SmartControl 
                ID="InvoiceTypeRenewal" runat="server" BoundPropertyName="InvoiceTypeRenewal" 
                DisplayCaption="true" PositionCaption="Right" DataSaveUponStateChange="false" />
        </div>
    </div>
    <div class="AutoWidth">
        <asiweb:SmartControl ID="DisplayOption" runat="server" BoundPropertyName="DisplayOption" DisplayCaption="true" 
            PositionCaption="Top" DataSaveUponStateChange="false" AutoPostBack="true" />       
        <div class="SubItems">
            <asiweb:SmartControl ID="NoOpenInvoice" runat="server" BoundPropertyName="NoOpenInvoice" 
                DisplayCaption="true" PositionCaption="Left" DataSaveUponStateChange="false" />
        </div> 
    </div>
 </asiweb:paneltemplatecontrol>