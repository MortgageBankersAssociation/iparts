<%@ Control Language="C#" AutoEventWireup="True" CodeBehind="ContentCollectionOrganizerDisplay.ascx.cs" Inherits="Asi.Web.iParts.Common.ContentCollectionOrganizer.ContentCollectionOrganizerDisplay" %>
<%@ Register Assembly="System.Web.Extensions, Version=3.5.0.0, Culture=neutral, PublicKeyToken=31bf3856ad364e35"    Namespace="System.Web.UI" TagPrefix="asp" %>
<%@ Register TagPrefix="telerik" Namespace="Telerik.Web.UI" Assembly="Telerik.Web.UI" %>
<%@ Register TagPrefix="asiweb" Assembly="Asi.Web" Namespace="Asi.Web.UI.WebControls" %>

<asp:UpdatePanel ID="updatePanel" runat="server" ChildrenAsTriggers="true" UpdateMode="Conditional">
   
    <ContentTemplate>

        <asp:Label ID="InfoControl" CssClass="Info" runat="server"/>
        
        <asp:Label id="MoreInfoControl" runat="server" CssClass="Info"/>
        
        <asp:Panel ID="TitlePanelControl" runat="server" CssClass="TitleBarCaption">
            <asp:Label ID="TitleControl" runat="server"/>
        </asp:Panel>
                     
        <asp:PlaceHolder ID="templateUserMessages" runat="server"/>
             
        <asp:Panel ID="MainContentControl" runat="server">
        
            <telerik:RadTabStrip runat="server" ID="radTab_Top" AutoPostBack="false"
                SelectedIndex="0" MultiPageID="radPage" CausesValidation="false" EnableViewState="true" ScrollChildren="false" ScrollButtonsPosition="Middle" >
            </telerik:RadTabStrip>
            <asp:Button runat="server" id="refreshTrigger" OnClick="RefreshTriggerClick" style="display:none" Text=""></asp:Button>
            <telerik:RadMultiPage ID="radPage" runat="server" 
                SelectedIndex="0" ></telerik:RadMultiPage>    
            <telerik:RadTabStrip runat="server" ID="radTab_Bottom" AutoPostBack="false"  
                SelectedIndex="0" MultiPageID="radPage" CausesValidation="false" EnableViewState="true" ScrollChildren="false" ScrollButtonsPosition="Middle">
            </telerik:RadTabStrip>
                            
        </asp:Panel>
        
        <asp:Panel ID="panStep" runat="server" EnableViewState="true"/>
        <asp:Label ID="debug" runat="server"/>
        
    </ContentTemplate>
    
</asp:UpdatePanel>

