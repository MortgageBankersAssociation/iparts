<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="DisplayNameEditorDisplay.ascx.cs" Inherits="Asi.Web.iParts.ContactManagement.DisplayNameEditor.DisplayNameEditorDisplay" %>
<%@ Import Namespace="Asi" %>
<%@ Register TagPrefix="telerik" Namespace="Telerik.Web.UI" Assembly="Telerik.Web.UI" %>
<%@ Register TagPrefix="asiweb" Assembly="Asi.Web" Namespace="Asi.Web.UI.WebControls" %>

<asiweb:PanelTemplateControl ID="DisplayNameEditorDisplayPanel" runat="server" FieldSet="True" ShowHeader="False" BorderStyle="None">
    
    <div class="AutoWidth">
        <asiweb:BusinessTextBox runat="server" ID="TextName" MaxLength="100" RenderPanelField="true" DisplayCaption="true" PositionCaption="Top" Caption='<%#LabelText%>' />
    </div>

	<div class="AutoWidth SubItems">
		<asiweb:BusinessCheckBox ID="AnonCheckBox" runat="server" RenderPanelField="true" PositionCaption="Right" Text='<%#AnonCheckboxText%>' />
	</div>

</asiweb:PanelTemplateControl>
