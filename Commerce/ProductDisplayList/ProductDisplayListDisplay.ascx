<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="ProductDisplayListDisplay.ascx.cs" Inherits="Asi.Web.iParts.Commerce.ProductDisplayList.ProductDisplayListDisplay" %>
<%@ Register TagPrefix="telerik" Namespace="Telerik.Web.UI" Assembly="Telerik.Web.UI" %>
<%@ Register TagPrefix="asiweb" Assembly="Asi.Web" Namespace="Asi.Web.UI.WebControls" %>

<asp:Label ID="Error" runat="server" CssClass="Error" Visible="false" />  

<asp:Panel ID="ContentPanel" runat="server" Visible="true">
    <asiweb:TitleBar ID="TitleBar" Text="<%#PageTitle%>" OptionsMenuBehavior="AlwaysDisplay" runat="server" />
   
    <asiweb:StyledLabel ID="SourceMessage" runat="server" Visible="false"></asiweb:StyledLabel>

    <asiweb:Lister2 id="ResultsGrid" runat="server"       
        DeleteColumnLocation="None"        
        SelectColumnLocation="None"
        OnNeedDataSource="ResultsGrid_NeedDataSource"
        DisplayContentCode="ProductDisplay"
        HeaderVisible="false"
        EnableClientSideDelete="false"
        TargetPreserveStatefulBusinessContainer="true"
        AllowRowSelecting="false"
        OnItemDataBound="ResultsGrid_ItemDataBound"
        DisableQueryEdit="true"
    />     
</asp:Panel>       

