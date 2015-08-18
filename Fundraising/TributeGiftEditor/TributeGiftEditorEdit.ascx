<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="TributeGiftEditorEdit.ascx.cs" Inherits="Asi.Web.iParts.Fundraising.TributeGiftEditor.TributeGiftEditorEdit" %>

<%@ Register TagPrefix="asiweb" Assembly="Asi.Web" Namespace="Asi.Web.UI.WebControls" %>
<%@ Register TagPrefix="telerik" Namespace="Telerik.Web.UI" %>

<asiweb:PanelTemplateControl ID="TributeGiftEditorEditPanel" runat="server" FieldSet="True" ShowHeader="False" BorderStyle="None">

	<asiweb:SmartControl
		ID="ShowNotifyDetailsControl" runat="server" BoundPropertyName="ShowNotifyDetails" CssClass="AutoWidth"
		DisplayCaption="true" PositionCaption="Right" DataSaveUponStateChange="false" /> 
        
    <asiweb:SmartControl
        ID="ShowNotifyTextControl" runat="server" BoundPropertyName="ShowNotifyText" 
        DisplayCaption="true" PositionCaption="Left" DataSaveUponStateChange="false" /> 
            
	<asiweb:SmartControl
		ID="CommitSequenceControl" runat="server" BoundPropertyName="CommitSequence" 
		DisplayCaption="true" PositionCaption="Left" DataSaveUponStateChange="false" MinValue="0" /> 
		   
</asiweb:PanelTemplateControl>