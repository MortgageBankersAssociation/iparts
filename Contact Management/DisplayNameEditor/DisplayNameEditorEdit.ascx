<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="DisplayNameEditorEdit.ascx.cs" Inherits="Asi.Web.iParts.ContactManagement.DisplayNameEditor.DisplayNameEditorEdit" %>

<%@ Register TagPrefix="asiweb" Assembly="Asi.Web" Namespace="Asi.Web.UI.WebControls" %>
<%@ Register TagPrefix="telerik" Namespace="Telerik.Web.UI" %>

<asiweb:PanelTemplateControl ID="DisplayNameEditorEditPanel" runat="server" FieldSet="True" ShowHeader="False" BorderStyle="None">
    
	<asiweb:SmartControl
		ID="CommitSequenceControl" runat="server" BoundPropertyName="CommitSequence" 
		DisplayCaption="true" PositionCaption="Left" DataSaveUponStateChange="false" MinValue="0" /> 
	
	<asiweb:SmartControl
		ID="SalutationTypeControl" runat="server" BoundPropertyName="SalutationType" 
		DisplayCaption="true" PositionCaption="Left" DataSaveUponStateChange="false" /> 
	<div id="anonPanel" style="margin-left: 30px; display: block;">
		<asiweb:SmartControl
			ID="AnonCheckboxTextControl" runat="server" BoundPropertyName="AnonCheckboxText" 
			DisplayCaption="true" PositionCaption="Left" DataSaveUponStateChange="false"  /> 
	</div>
	<asiweb:SmartControl
		ID="LabelTextControl" runat="server" BoundPropertyName="LabelText" 
		DisplayCaption="true" PositionCaption="Left" DataSaveUponStateChange="false" /> 


</asiweb:PanelTemplateControl>