<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="EmbeddedWebPageConfigEdit.ascx.cs" Inherits="Asi.Web.iParts.Common.EmbeddedWebPage.EmbeddedWebPageConfigEdit" %>
<%@ Register TagPrefix="asiweb" Namespace="Asi.Web.UI.WebControls" %>

<asiweb:paneltemplatecontrol id="ContainerPanel" runat="server" fieldset="true" showheader="false" borderstyle="None">
    <div>
        <asiweb:SmartControl 
            ID="Source" runat="server" 
            BoundPropertyName="Source" DisplayCaption="true" 
            PositionCaption="left" DataSaveUponStateChange="false" />
        <asiweb:SmartControl 
            ID="Height" runat="server"  
            BoundPropertyName="Height" DisplayCaption="true"
            PositionCaption="left" DataSaveUponStateChange="false" MinValue="20" MaxValue="1000" />
        <asiweb:SmartControl 
            ID="Width" runat="server" 
            BoundPropertyName="Width" DisplayCaption="true"
            PositionCaption="left" DataSaveUponStateChange="false" MinValue="20" MaxValue="1000" />
    </div>
 </asiweb:paneltemplatecontrol>