﻿<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="LogViewerForWebServicesConfigEdit.ascx.cs" Inherits="Asi.Web.iParts.Common.LogViewerForWebServices.LogViewerForWebServicesConfigEdit" %>
<%@ Import Namespace="Asi"%>


<asiweb:paneltemplatecontrol ID="ContainerPanel" runat="server" FieldSet="true" ShowHeader="false" BorderStyle="None">

    <asiweb:SmartControl ID="PageTitle" runat="server" BoundPropertyName="PageTitle" DisplayCaption="true" />
    <div class="AutoWidth">
                <asiweb:SmartControl 
            ID="DoNotRenderInDesignMode" runat="server" 
            BoundPropertyName="DoNotRenderInDesignMode" DisplayCaption="true" 
            PositionCaption="Right" />
        <asiweb:SmartControl 
            ID="ShowBorderControl" runat="server" BoundPropertyName="ShowBorder" 
            DisplayCaption="true" PositionCaption="Right" />

    </div>   
</asiweb:paneltemplatecontrol>