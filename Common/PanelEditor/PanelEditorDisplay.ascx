<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="PanelEditorDisplay.ascx.cs" Inherits="Asi.Web.iParts.Common.PanelEditor.PanelEditorDisplay" %>
<%@ Register TagPrefix="telerik" Namespace="Telerik.Web.UI" Assembly="Telerik.Web.UI" %>
<%@ Register TagPrefix="asiweb" Assembly="Asi.Web" Namespace="Asi.Web.UI.WebControls" %>

<telerik:RadAjaxLoadingPanel runat="server" ID="loadingPanel" Transparency="50" IsSticky="false" 
    BackColor="LightGray" BackgroundPosition="Center">
</telerik:RadAjaxLoadingPanel>
   
<telerik:RadAjaxPanel ID="ajaxPanel1" runat="server" LoadingPanelID="loadingPanel" >
    <asp:Button runat="server" id="refreshTrigger" OnClick="RefreshTriggerClick" style="display:none" Text=""></asp:Button>
    <asp:Panel ID="readOnlyPanel" runat="server">
        <asp:Panel id="singleInstancePanel" runat="server" CssClass="FullWidth">
        </asp:Panel>
        <asp:Panel id="multipleInstancePanel" runat="server">
            <asiweb:Lister2 id="multipleInstanceList" runat="server"
                AjaxEnabled="false"
                SortingEnabled="true"
                PagingEnabled="true"
                PagerMode="Advanced"
                PageSize="20"
                ColumnReorderingEnabled="false"
                EnableClientSideDelete="false"
                EditColumnLocation="None"
                SelectColumnLocation="End"
                SelectColumnText="edit"
                DeleteColumnLocation="End"                                      
                AddButtonEnabled="false"                                    
                TargetUrl="seeCodeBehind"
                AddLinkTargetBehavior="NewWindowAllShare"
                DataSourceIsRealDataSource="true"
                UseUniformKey="false"
                TargetCloseWindowOnCommit="false"
            />    
        </asp:Panel>
        <asp:Panel ID="multipleInstanceDesignTimePanel" Visible="false" runat="server">
            <br /><asp:Label ID="multipleInstanceDesignTimeLabel" runat="server" Text="Label"></asp:Label><br /><br />
        </asp:Panel>
    </asp:Panel>
    <asiweb:StyledLabel ID="NoPanelSelectedLabel" runat="server" Visible="false"></asiweb:StyledLabel>
</telerik:RadAjaxPanel>

