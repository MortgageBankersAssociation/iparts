<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="GroupListEditorConfigEdit.ascx.cs" Inherits="Asi.Web.iParts.Groups.GroupListEditor.GroupListEditorConfigEdit" %>
<%@ Register TagPrefix="asiweb" Namespace="Asi.Web.UI.WebControls" %>

<asiweb:PanelTemplateControl ID="ContainerPanel" runat="server" FieldSet="true" ShowHeader="False" BorderStyle="None">
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
        <asiweb:SmartControl ID="DisplayForAuthorizedUsersOnly" runat="server" 
            BoundPropertyName="DisplayForAuthorizedUsersOnly" DisplayCaption="true" 
            PositionCaption="Right" DataSaveUponStateChange="false" />
        <asiweb:SmartControl ID="DisplayProfileImage" runat="server" BoundPropertyName="DisplayProfileImage" 
            DisplayCaption="true" PositionCaption="Right" DataSaveUponStateChange="false" />
        <asiweb:SmartControl ID="ShowInactive" runat="server" BoundPropertyName="ShowInactive" DisplayCaption="true" 
            PositionCaption="Right" DataSaveUponStateChange="false" />
        <asiweb:SmartControl ID="AllowEdit" runat="server" BoundPropertyName="AllowEdit" DisplayCaption="true" 
            PositionCaption="Right" DataSaveUponStateChange="false" />
    </div>
    <asiweb:SmartControl ID="AddMemberText" runat="server" BoundPropertyName="AddMemberText" DisplayCaption="true" DataSaveUponStateChange="false" />
    <div class="AutoWidth">
        <asiweb:SmartControl ID="GroupMode" runat="server" BoundPropertyName="GroupMode" DisplayCaption="true" PositionCaption="Top"
            AutoPostBack="true" DataSaveUponStateChange="false" OnDataChange="GroupMode_OnDataChange" />
    </div>
    <asiweb:SmartControl ID="UrlParameter" runat="server" BoundPropertyName="UrlParameter" DisplayCaption="true" DataSaveUponStateChange="false" />
    <asiweb:SmartControl ID="OwnerType" runat="server" BoundPropertyName="OwnerType" DisplayCaption="true" DataSaveUponStateChange="false"/>
    <div class="Top" id="GroupTypesDiv" runat="server">
        <div class="PanelField">
            <asiweb:StyledLabel runat="server" ID="LabelGroupTypes" AssociatedControlID="groupTypeSelector" Text='<%#Asi.ResourceManager.GetPhrase("GroupTypes", "Choose the group types to include")%>' />
            <div class="PanelFieldValue" style="margin:3px;">
                <asiweb:MultiSelectControl2 id="groupTypeSelector" Height="150px" Width="200px" AllowReorder="true" runat="server" OnInit="GroupTypeSelectorInit" />
            </div>
        </div>
    </div>
    <asiweb:SmartControl ID="GroupType" runat="server" BoundPropertyName="SelectedGroupTypes" DisplayCaption="true" 
        DataSaveUponStateChange="false"/>
 </asiweb:PanelTemplateControl>