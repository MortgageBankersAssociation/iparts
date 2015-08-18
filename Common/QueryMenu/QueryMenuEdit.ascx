<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="QueryMenuEdit.ascx.cs" Inherits="Asi.Web.iParts.Common.QueryMenu.QueryMenuEdit" %>
<%@ Register TagPrefix="asiweb" Namespace="Asi.Web.UI.WebControls" %>
<%@ Import Namespace="Asi"%>

<asiweb:paneltemplatecontrol ID="ContainerPanel" runat="server" FieldSet="true" ShowHeader="false" BorderStyle="None">
<asiweb:SmartControl ID="PageTitle" 
    runat="server" BoundPropertyName="PageTitle" DisplayCaption="true" DataSaveUponStateChange="false" />
    <div class="AutoWidth">
        <asiweb:SmartControl 
            ID="DoNotRenderInDesignMode" runat="server" 
            BoundPropertyName="DoNotRenderInDesignMode" DisplayCaption="true" 
            PositionCaption="Right" DataSaveUponStateChange="false" />
        <asiweb:SmartControl 
            ID="ShowBorderControl" runat="server" 
            BoundPropertyName="ShowBorder" DisplayCaption="true" 
            PositionCaption="Right" DataSaveUponStateChange="false" />
        <asiweb:SmartControl ID="DisplayForAuthorizedUsersOnly" runat="server" BoundPropertyName="DisplayForAuthorizedUsersOnly" 
            DisplayCaption="true" PositionCaption="Right" DataSaveUponStateChange="false" />    
        <asiweb:SmartControl 
            ID="UsePopupControl" runat="server" BoundPropertyName="UsePopup" 
            DisplayCaption="true" PositionCaption="Right" DataSaveUponStateChange="false" />
        <asiweb:SmartControl 
            ID="EnableExport" runat="server" 
            BoundPropertyName="EnableExport" DisplayCaption="true" 
            PositionCaption="Right" DataSaveUponStateChange="false" />
        <asiweb:SmartControl 
            ID="MapResults" runat="server" 
            BoundPropertyName="MapResults" DisplayCaption="true" 
            PositionCaption="Right" DataSaveUponStateChange="false" />
    </div>
    
    <asiweb:SmartControl ID="SourceFolderPathControl" runat="server" BoundPropertyName="SourceFolderPathControl" DisplayCaption="true" PositionCaption="Left" 
    DataSaveUponStateChange="false" AutoPostBack="false" />              

    <asiweb:SmartControl ID="MenuCaptionText" runat="server" BoundPropertyName="MenuCaptionText" DisplayCaption="true" PositionCaption="Left" DataSaveUponStateChange="false"></asiweb:SmartControl>

    <asiweb:SmartControl ID="ListPageSize" runat="server" BoundPropertyName="ListPageSize" DisplayCaption="true" PositionCaption="Left" DataSaveUponStateChange="false"></asiweb:SmartControl>

    <asiweb:SmartControl ID="PagerMode" runat="server" BoundPropertyName="PagerMode" DisplayCaption="true" PositionCaption="Left" DataSaveUponStateChange="false"></asiweb:SmartControl>
       
 </asiweb:paneltemplatecontrol>