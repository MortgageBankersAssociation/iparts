<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="DonationCreatorConfigEdit.ascx.cs" Inherits="Asi.Web.iParts.Fundraising.DonationCreator.DonationCreatorConfigEdit" %>

<asiweb:PanelTemplateControl ID="ContainerPanel" runat="server" FieldSet="true" ShowHeader="false" BorderStyle="None">
    <div class="AutoWidth">
        <asiweb:SmartControl 
            ID="DisplayDescriptionControl" runat="server" BoundPropertyName="DisplayItemDescription" 
            DisplayCaption="true" PositionCaption="Right" DataSaveUponStateChange="false" />
        <asiweb:SmartControl 
            ID="ProcessingModeControl" runat="server" BoundPropertyName="ProcessingMode" 
            DisplayCaption="true" PositionCaption="Top" DataSaveUponStateChange="false" />    
    </div>    
    <div class="AutoWidth">            
        <asiweb:SmartControl 
            ID="DistributionModeControl" runat="server" BoundPropertyName="DistributionMode" 
            DisplayCaption="true" PositionCaption="Top" DataSaveUponStateChange="false" AutoPostback="true" />       
        <div style="padding-left:60px;">   
            <asiweb:SmartControl ID="DistributionListControl" runat="Server" BoundPropertyName="DistributionValue" DisplayCaption="true" />
        </div>
    </div>

    <asiweb:SmartControl
        ID="CommitSequenceControl" runat="server" BoundPropertyName="CommitSequence" 
        DisplayCaption="true" PositionCaption="Left" DataSaveUponStateChange="false" MinValue="0" />    

    <asiweb:SmartControl 
        ID="ItemAddedLabelControl" runat="server" BoundPropertyName="ItemAddedLabel" 
        DisplayCaption="true" PositionCaption="Left" DataSaveUponStateChange="false" /> 

 </asiweb:PanelTemplateControl>