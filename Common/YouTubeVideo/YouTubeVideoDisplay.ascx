<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="YouTubeVideoDisplay.ascx.cs" Inherits="Asi.Web.iParts.Common.YouTubeVideo.YouTubeVideoDisplay" %>
<%@ Register TagPrefix="telerik" Namespace="Telerik.Web.UI" Assembly="Telerik.Web.UI" %>
<%@ Register TagPrefix="asiweb" Assembly="Asi.Web" Namespace="Asi.Web.UI.WebControls" %>

<asp:Panel ID="ContentPanel" runat="server" Visible="true">    
    <asiweb:TitleBar ID="TitleBar" Text="<%#PageTitle%>" runat="server" />    
    <div id="youTube" runat="server" >
    </div>
    
</asp:Panel>       
