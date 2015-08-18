<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="RecurringDonationCreatorConfigEdit.ascx.cs" Inherits="Asi.Web.iParts.Fundraising.RecurringDonationCreator.RecurringDonationCreatorConfigEdit" %>

<asiweb:PanelTemplateControl ID="ContainerPanel" runat="server" FieldSet="true" ShowHeader="false" BorderStyle="None">
            
    <asiweb:SmartControl
        ID="CommitSequenceControl" runat="server" BoundPropertyName="CommitSequence" 
        DisplayCaption="true" PositionCaption="Left" DataSaveUponStateChange="false" MinValue="0" />    

    <asiweb:SmartControl
        ID="MakeRecurringTextNoControl" runat="server" BoundPropertyName="MakeRecurringTextNo" 
        DisplayCaption="true" PositionCaption="Left" DataSaveUponStateChange="false" MinValue="0" />    

    <asiweb:SmartControl
        ID="MakeRecurringTextYesControl" runat="server" BoundPropertyName="MakeRecurringTextYes" 
        DisplayCaption="true" PositionCaption="Left" DataSaveUponStateChange="false" MinValue="0" />    

    <asiweb:SmartControl
        ID="GiftFrequencyMessageControl" runat="server" BoundPropertyName="GiftFrequencyMessage" 
        DisplayCaption="true" PositionCaption="Left" DataSaveUponStateChange="false" MinValue="0" />    

 </asiweb:PanelTemplateControl>