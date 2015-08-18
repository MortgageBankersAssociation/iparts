<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="PanelEditorConfigEdit.ascx.cs" Inherits="Asi.Web.iParts.Common.PanelEditor.PanelEditorConfigEdit" %>

<%@ Import Namespace="Asi" %>
<%@ Register TagPrefix="asiweb" Assembly="Asi.Web" Namespace="Asi.Web.UI.WebControls" %>
<%@ Register TagName="PanelDesigner" TagPrefix="PanelEditor" Src="PanelDesigner.ascx" %>
<%@ Register TagPrefix="telerik" Namespace="Telerik.Web.UI" %>

<script language="javascript">

    function ConfirmDeletePanel() 
    {
        answer = confirm("Delete this panel?");
        if (!answer)
            return false;
        return true;
    }

</script>

<telerik:RadAjaxManager ID="ajaxManager1" runat="server">
    <AjaxSettings>
        <telerik:AjaxSetting AjaxControlID="panelList">
            <UpdatedControls>
                <telerik:AjaxUpdatedControl ControlID="panelList" />
                <telerik:AjaxUpdatedControl ControlID="panelEditDelete" />
                <telerik:AjaxUpdatedControl ControlID="ScrollingGridEnabled" />
                <telerik:AjaxUpdatedControl ControlID="ScrollingGridWidth" />
                <telerik:AjaxUpdatedControl ControlID="ScrollingGridHeight" />
            </UpdatedControls>
        </telerik:AjaxSetting>
        <telerik:AjaxSetting AjaxControlID="refreshTrigger">
            <UpdatedControls>
                <telerik:AjaxUpdatedControl ControlID="panelList" />
                <telerik:AjaxUpdatedControl ControlID="panelEditDelete" />
                <telerik:AjaxUpdatedControl ControlID="ScrollingGridEnabled" />
                <telerik:AjaxUpdatedControl ControlID="ScrollingGridWidth" />
                <telerik:AjaxUpdatedControl ControlID="ScrollingGridHeight" />
            </UpdatedControls>
        </telerik:AjaxSetting>
    </AjaxSettings>
</telerik:RadAjaxManager>
<asp:Button runat="server" id="refreshTrigger" OnClick="RefreshTriggerClick" style="display:none" Text=""></asp:Button>
<asiweb:PanelTemplateControl ID="contactUserDefinedFieldsEdit" runat="server" FieldSet="True" ShowHeader="False" BorderStyle="None">
    <div class="AutoWidth">
        <asiweb:SmartControl ID="DisplayForAuthorizedUsersOnly" runat="server" BoundPropertyName="DisplayForAuthorizedUsersOnly" 
            DisplayCaption="true" PositionCaption="Right" DataSaveUponStateChange="false" />
    </div>
    <asiweb:SmartControl ID="panelList" runat="server" BoundPropertyName="PanelDefinitionId" DisplayCaption="true"
     DataSaveUponStateChange="false" AutoPostBack="true" OnDataChange="PanelListChanged" EnableAjaxPostback="true">
        <asp:Panel runat="server" ID="panelEditDelete">
            <asp:Button ID="linkEditPanel" runat="server" CssClass="unitText"></asp:Button>
            <asp:Button ID="linkDeletePanel" runat="server" OnClick="LinkDeletePanelClick" 
                CssClass="unitText" OnClientClick="if (!ConfirmDeletePanel()) return false;"></asp:Button>
            <asp:Button ID="linkImportPanels" runat="server" OnClick="LinkImportPanelsClick" CssClass="unitText"/><asiweb:StyledLabel runat="server" ID="UserMessage" Visible="false" />
        </asp:Panel>
    </asiweb:SmartControl>
    <div class="AutoWidth">
        <asiweb:SmartControl ID="ScrollingGridEnabled" runat="server" BoundPropertyName="ScrollingGridEnabled" DisplayCaption="true" PositionCaption="Right"
            AutoPostBack="false" DataSaveUponStateChange="false" Enabled="false" />
        <div id="gridSizeDiv" runat="server" style="padding-left:20px">
            <asiweb:SmartControl ID="ScrollingGridWidth" runat="server" BoundPropertyName="ScrollingGridWidth" DisplayCaption="True" 
                DataSaveUponStateChange="false" Enabled="false" ValidatorDisplay="Dynamic" MinValue="1" MaxValue="2000" />
            <asiweb:SmartControl ID="ScrollingGridHeight" runat="server" BoundPropertyName="ScrollingGridHeight" DisplayCaption="True" 
                DataSaveUponStateChange="false" Enabled="false" ValidatorDisplay="Dynamic" MinValue="1" MaxValue="2000" />
        </div>
    </div>        
    <div class="AutoWidth">
        <asiweb:SmartControl ID="allowEdit" runat="server" BoundPropertyName="AllowEdit" DisplayCaption="true" PositionCaption="Right"
         AutoPostBack="false" DataSaveUponStateChange="false" />
        <div id="windowSizeDiv" runat="server" style="padding-left:20px">
            <asiweb:SmartControl ID="editWindowWidth" runat="server" BoundPropertyName="EditWindowWidth" DisplayCaption="True" 
             DataSaveUponStateChange="false" ValidatorDisplay="Dynamic" MinValue="1" MaxValue="2000" />
            <asiweb:SmartControl ID="editWindowHeight" runat="server" BoundPropertyName="EditWindowHeight" DisplayCaption="True" 
             DataSaveUponStateChange="false" ValidatorDisplay="Dynamic" MinValue="1" MaxValue="2000" />
        </div>
    </div>
</asiweb:PanelTemplateControl>
