<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="QueryChartViewerDisplay.ascx.cs" Inherits="Asi.Web.iParts.Common.QueryChartViewer.QueryChartViewerDisplay" %>
<%@ Register TagPrefix="telerik" Namespace="Telerik.Web.UI" Assembly="Telerik.Web.UI" %>
<%@ Register TagPrefix="asiweb" Assembly="Asi.Web" Namespace="Asi.Web.UI.WebControls" %>
<%@ Register TagPrefix="telerik" Namespace="Telerik.Charting" Assembly="Telerik.Web.UI" %>

<asp:Panel ID="ContentPanel" runat="server" Visible="true">
  
    <telerik:RadAjaxPanel ID="RadAjaxPanel1" runat="server" LoadingPanelID="loadingPanel">
    
        <asiweb:TitleBar ID="TitleBar" OptionsMenuBehavior="AlwaysDisplay" runat="server" />
                
        <telerik:RadChart ID="RadChart1" runat="server" DefaultType="Pie" Width="400" Height="400" AutoLayout="true" 
         IntelligentLabelsEnabled="true">
            <Series>
                <telerik:ChartSeries Type="Pie" DataYColumn="Value" DataLabelsColumn="Name" />
            </Series>
            <PlotArea> 
                <EmptySeriesMessage TextBlock-Text=""/>                                                             
            </PlotArea>                     
        </telerik:RadChart> 
                    
        <asp:Label ID="Debug" runat="server" Visible="true" />
    
    </telerik:RadAjaxPanel>
     
</asp:Panel>       
