<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="SSRSReportConfigEdit.ascx.cs" Inherits="Asi.Web.iParts.Common.SSRSReport.SSRSReportConfigEdit" %>
<%@ Register TagPrefix="asiweb" Namespace="Asi.Web.UI.WebControls" %>
<%@ Import Namespace="Asi" %>

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
        <asiweb:SmartControl 
            ID="ShowPDFButtonControl" runat="server" BoundPropertyName="ShowPDFButton" 
            DisplayCaption="true" PositionCaption="Right" DataSaveUponStateChange="false" />
        <asiweb:SmartControl 
            ID="ShowExcelButtonControl" runat="server" BoundPropertyName="ShowExcelButton" 
            DisplayCaption="true" PositionCaption="Right" DataSaveUponStateChange="false" />
        <asiweb:SmartControl 
            TextBoxWidth="20em" ID="ReportDocumentPathControl" runat="server" BoundPropertyName="ReportDocumentPath" 
            DisplayCaption="true" PositionCaption="Left" DataSaveUponStateChange="false" AutoPostBack="false" 
            OnDataChange="ReportDocumentPathControlDataChanged" />
        <asiweb:SmartControl 
            ID="HideParamPanelControl" runat="server" BoundPropertyName="HideParamPanel" 
            DisplayCaption="true" PositionCaption="Right" DataSaveUponStateChange="false" />
        <asiweb:SmartControl 
            ID="HideToolbar" runat="server" BoundPropertyName="HideToolbar" 
            DisplayCaption="true" PositionCaption="Right" DataSaveUponStateChange="false" />
        <asiweb:SmartControl 
            ID="HidePageNavControls" runat="server" BoundPropertyName="HidePageNavControls" 
            DisplayCaption="true" PositionCaption="Right" DataSaveUponStateChange="false" />
        <asiweb:SmartControl 
            ID="HideAllButPrint" runat="server" BoundPropertyName="HideAllButPrint" 
            DisplayCaption="true" PositionCaption="Right" DataSaveUponStateChange="false" />
        <asiweb:SmartControl 
            ID="GetParamsFromSessionControl" runat="server" BoundPropertyName="GetParamsFromSession" 
            DisplayCaption="true" PositionCaption="Right" DataSaveUponStateChange="false" />
        <asiweb:SmartControl 
            ID="GetParamsFromQuerystringControl" runat="server" BoundPropertyName="GetParamsFromQuerystring" 
            DisplayCaption="true" PositionCaption="Right" DataSaveUponStateChange="false" />

    </div>    
 </asiweb:paneltemplatecontrol>
