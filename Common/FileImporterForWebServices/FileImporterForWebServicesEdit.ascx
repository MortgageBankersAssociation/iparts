<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="FileImporterForWebServicesEdit.ascx.cs" Inherits="Asi.Web.iParts.Common.FileImporterForWebServices.FileImporterForWebServicesEdit" %>
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

        <div class="PanelField">
            <asp:Label ID="ErrorLabel" runat="server" CssClass="Error" ></asp:Label>
            <br />
            <asiweb:MultiSelectControl2 RenderPanelField="true" id="FileTypeSelector" Height="15em" Width="22em" AllowReorder="true" runat="server"
                Caption="File Formats" PositionCaption="Top" DisplayCaption="true" />
        </div>
    </div>   
</asiweb:paneltemplatecontrol>
