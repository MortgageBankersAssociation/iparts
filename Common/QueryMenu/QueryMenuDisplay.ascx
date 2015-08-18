<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="QueryMenuDisplay.ascx.cs"
    Inherits="Asi.Web.iParts.Common.QueryMenu.QueryMenuDisplay" %>
<%@ Register TagPrefix="telerik" Namespace="Telerik.Web.UI" Assembly="Telerik.Web.UI" %>
<%@ Register TagPrefix="asiweb" Assembly="Asi.Web" Namespace="Asi.Web.UI.WebControls" %>
<script type="text/javascript" src="http://maps.googleapis.com/maps/api/js?sensor=false">
</script>
<%-- Runs mapping javascript after panel has been asynchronously updated --%>
<script type="text/javascript">
    var prm = Sys.WebForms.PageRequestManager.getInstance();
    prm.add_endRequest(EndRequest);
    function EndRequest(sender, args) {
        if (typeof initializeMap == 'function') {
            initializeMap();
        }
    }    
</script>
<asp:Panel ID="ContentPanel" runat="server" Visible="true">
    <asiweb:TitleBar ID="TitleBar" Text="<%#PageTitle%>" TitleBarClickBehavior="SelectFirstMenuItem"
        OptionsMenuBehavior="AlwaysDisplay" ShowActionBox="true" runat="server" />
    <asp:UpdatePanel ID="ListerPanel" runat="server">
        <ContentTemplate>         
            <asiweb:StyledLabel ID="SourceMessage" runat="server" Visible="false"></asiweb:StyledLabel>           
            <asiweb:Lister2 ID="ResultsGrid" runat="server" AjaxEnabled="true" SortingEnabled="true"
                PagingEnabled="true" ColumnReorderingEnabled="false" EnableClientSideDelete="false"
                EditColumnLocation="None" SelectColumnLocation="None" DeleteColumnLocation="None"
                AddButtonEnabled="false" DisableQueryEdit="true" OnNeedDataSource="ResultsGrid_NeedDataSource"
                OnItemDataBound="ResultsGrid_ItemDataBound" CollapsiblePanelTemplate="false" />
			<div id="errorLabel" class="iMISUserMessageInformation"></div>
            <asp:Panel ID="MapPanel" Visible="true" runat="server">
                <%--Place for google to show the map--%>
                <div id="map_canvas" style="width: 100%; height: 728px; margin-bottom: 2px;">
                </div>
                <br />
            </asp:Panel>
        </ContentTemplate>
    </asp:UpdatePanel>
</asp:Panel>
<telerik:RadToolTip runat="server" ID="QueryListDialog" TargetControlID="TitleBar"
    Animation="None" ShowEvent="OnClick" ShowDelay="0" ShowCallout="false" CssClass="RadToolTip_Telerik"
    HideEvent="LeaveTargetAndToolTip" RelativeTo="Mouse" RenderInPageRoot="true">
    <asp:UpdatePanel runat="server" ID="PopupMenuUpdatePanel">
        <ContentTemplate>
            <asp:Panel ID="QueryListPanel" runat="server">
                <br />
            </asp:Panel>
        </ContentTemplate>
    </asp:UpdatePanel>
</telerik:RadToolTip>
