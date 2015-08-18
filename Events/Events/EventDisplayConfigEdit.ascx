<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="EventDisplayConfigEdit.ascx.cs" Inherits="Asi.Web.iParts.Events.EventDisplayConfigEdit" %>
<%@ Import Namespace="Asi"%>

<asiweb:paneltemplatecontrol ID="ContainerPanel" runat="server" FieldSet="true" ShowHeader="false" BorderStyle="None">
    <asiweb:SmartControl ID="PageTitle" runat="server" BoundPropertyName="PageTitle" 
        DisplayCaption="true" DataSaveUponStateChange="false" Visible="false" />
    <div class="AutoWidth">
        <asiweb:SmartControl 
            ID="DoNotRenderInDesignMode" runat="server" 
            BoundPropertyName="DoNotRenderInDesignMode" DisplayCaption="true" 
            PositionCaption="Right" DataSaveUponStateChange="false" />
        <asiweb:SmartControl 
            ID="ShowBorderControl" runat="server" BoundPropertyName="ShowBorder" 
            DisplayCaption="true" PositionCaption="Right" DataSaveUponStateChange="false" />
    </div>    
    
    <asiweb:SmartControl ID="EventKey" runat="server" BoundPropertyName="EventKey" DisplayCaption="true" PositionCaption="Left" DataSaveUponStateChange="false" />
    <asiweb:SmartControl ID="ImageWidth" runat="server" BoundPropertyName="ImageWidth" DisplayCaption="true" PositionCaption="Left" DataSaveUponStateChange="false" />

    <asiweb:SmartControl ID="IQAQueryPath" runat="server" BoundPropertyName="IQAQueryPath" DisplayCaption="true" PositionCaption="Left" 
    DataSaveUponStateChange="false" AutoPostBack="false" />

 </asiweb:paneltemplatecontrol>