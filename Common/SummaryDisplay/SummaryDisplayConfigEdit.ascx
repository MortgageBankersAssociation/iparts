<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="SummaryDisplayConfigEdit.ascx.cs" Inherits="Asi.Web.iParts.Common.SummaryDisplay.SummaryDisplayConfigEdit" %>
<%@ Import Namespace="Asi"%>
<%@ Register TagPrefix="asiweb" Assembly="Asi.Web" Namespace="Asi.Web.UI.WebControls" %>

<asiweb:paneltemplatecontrol ID="ContainerPanel" runat="server" FieldSet="true" ShowHeader="false" BorderStyle="None">
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
         
    </div>    
   
    <asiweb:SmartControl ID="IQAQueryPath" runat="server" BoundPropertyName="IQAQueryPath" DisplayCaption="true" PositionCaption="Left" 
    DataSaveUponStateChange="false" AutoPostBack="false"/>  
                  
       
 </asiweb:paneltemplatecontrol>