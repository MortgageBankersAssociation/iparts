<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="ContactMiniProfileDisplay.ascx.cs" Inherits="Asi.Web.iParts.ContactManagement.ContactMiniProfile.ContactMiniProfileDisplay" %>
<%@ Register TagPrefix="telerik" Namespace="Telerik.Web.UI" Assembly="Telerik.Web.UI" %>
<%@ Register TagPrefix="asiweb" Namespace="Asi.Web.UI.WebControls" Assembly="Asi.Web" %>
<%@ Import Namespace="Asi" %>
<%@ Register TagPrefix="uc1" TagName="ContactName" Src="ContactNameDisplay.ascx" %>
<%@ Register TagPrefix="uc2" TagName="ContactPicture" Src="ContactProfilePictureDisplay.ascx" %>
<%@ Register TagPrefix="uc3" TagName="ContactAddress" Src="ContactAddressDisplay.ascx" %>
<%@ Register TagPrefix="uc4" TagName="ContactStatus" Src="ContactStatusDisplay.ascx" %>

<asp:Panel ID="contentPanel" runat="server" Visible="true">

    <telerik:RadAjaxLoadingPanel runat="server" ID="loadingPanel" Transparency="50" IsSticky="false" 
    BackColor="LightGray" BackgroundPosition="Center" >
    </telerik:RadAjaxLoadingPanel>
  
    <asp:Label ID="designMode" runat="server" Visible="false" CssClass="Information" />
                        
    <telerik:RadAjaxPanel ID="RadAjaxPanel1" runat="server" LoadingPanelID="loadingPanel">
    
        <asp:Button runat="server" id="refreshTrigger" style="display:none" Text="" OnClick="RefreshTriggerClick"></asp:Button>        
        
        <uc1:ContactName ID="contactName" runat="server" visible="false" PartyId='<%#PartyId %>' />
    </telerik:RadAjaxPanel>
    <div ID="divContactName" runat="server" visible="false">
        <br />
    </div>
       
    <uc2:ContactPicture ID="contactPicture" runat="server" Visible="false" PartyId='<%#PartyId %>' /> 
        
    <uc3:ContactAddress ID="contactAddress" runat="server" PartyId='<%#PartyId %>' />
    
    <div ID="divAddressBreak" runat="server" visible="false">
        <br />
    </div> 
    <telerik:RadAjaxPanel ID="RadAjaxPanel2" runat="server" LoadingPanelID="loadingPanel" >
     <asp:Button runat="server" id="refreshTrigger2" style="display:none" Text=""></asp:Button>       
        <uc4:ContactStatus ID="contactStatus" runat="server" Visible="false" PartyId='<%#PartyId %>' ShowTitle="false"/>
    </telerik:RadAjaxPanel>        
</asp:Panel>