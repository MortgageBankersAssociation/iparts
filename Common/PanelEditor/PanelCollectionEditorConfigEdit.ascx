<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="PanelCollectionEditorConfigEdit.ascx.cs" Inherits="Asi.Web.iParts.Common.PanelEditor.PanelCollectionEditorConfigEdit" %>
<%@ Register Assembly="Telerik.Web.UI" Namespace="Telerik.Web.UI" TagPrefix="telerik" %>
<%@ Register TagPrefix="asiweb" Assembly="Asi.Web" Namespace="Asi.Web.UI.WebControls" %>

<asiweb:PanelTemplateControl ID="contactUserDefinedPanelsEdit" runat="server" FieldSet="True" ShowHeader="False" BorderStyle="None">
       
    <div id="availableWindowsErrorDiv" style="padding-left:160px;float:left;width:600px;" visible="false" runat="server">
        <asp:Label ID="availableWindowsError" runat="server" CssClass="Error" Visible="false"/>
    </div>
              
    <div class="AutoWidth">
        <asiweb:SmartControl ID="addAllWindows" runat="server" BoundPropertyName="AddAllWindows" DisplayCaption="true" AutoPostBack="true"
        DataSaveUponStateChange="false" />       
    </div>
    
    <div id="collapsedByDefaultDiv" style="padding-left:185px;padding-bottom:10px;width:600px;" runat="server"> 
    
        <asiweb:MultiSelectControl2 id="windowSelector" Height="200px" Width="250px" AllowReorder="true" runat="server" />
        
        <asp:Label ID="selectedWindowsError" runat="server" CssClass="Error" Visible="false"></asp:Label>
        
    </div>

    <div class="AutoWidth">
        <asiweb:SmartControl ID="ScrollingGridEnabled" runat="server" BoundPropertyName="ScrollingGridEnabled" DisplayCaption="true" PositionCaption="Right"
            AutoPostBack="true" DataSaveUponStateChange="false" />
        <div id="gridSizeDiv" runat="server" style="padding-left:20px">
            <asiweb:SmartControl ID="ScrollingGridWidth" runat="server" BoundPropertyName="ScrollingGridWidth" DisplayCaption="True" 
                DataSaveUponStateChange="false" ValidatorDisplay="Dynamic" MinValue="1" MaxValue="2000" />
            <asiweb:SmartControl ID="ScrollingGridHeight" runat="server" BoundPropertyName="ScrollingGridHeight" DisplayCaption="True" 
                DataSaveUponStateChange="false" ValidatorDisplay="Dynamic" MinValue="1" MaxValue="2000" />
        </div>
    </div> 
                    
    <div class="AutoWidth">
        <asiweb:SmartControl ID="allowEdit" runat="server" BoundPropertyName="AllowEdit" DisplayCaption="true" PositionCaption="Right" AutoPostBack="true" 
        DataSaveUponStateChange="false" />
        <div id="windowSizeDiv" runat="server" style="padding-left:20px">
            <asiweb:SmartControl ID="editWindowWidth" runat="server" BoundPropertyName="EditWindowWidth" DisplayCaption="True" 
            DataSaveUponStateChange="false" ValidatorDisplay="Dynamic" MinValue="1" MaxValue="2000" />
            <asiweb:SmartControl ID="editWindowHeight" runat="server" BoundPropertyName="EditWindowHeight" DisplayCaption="True"
            DataSaveUponStateChange="false" ValidatorDisplay="Dynamic" MinValue="1" MaxValue="2000" />
        </div>
    </div>
                  
</asiweb:PanelTemplateControl>