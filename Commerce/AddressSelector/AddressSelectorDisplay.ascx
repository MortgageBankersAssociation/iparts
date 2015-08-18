<%@ Control Language="C#" AutoEventWireup="True" CodeBehind="AddressSelectorDisplay.ascx.cs" Inherits="Asi.Web.iParts.Commerce.AddressSelector.AddressSelectorDisplay" %>
<%@ Register TagPrefix="telerik" Namespace="Telerik.Web.UI" Assembly="Telerik.Web.UI" %>
<%@ Register TagPrefix="asiweb" Assembly="Asi.Web" Namespace="Asi.Web.UI.WebControls" %>

<asp:Panel ID="ContentPanel" runat="server" Visible="true">
    <span runat="server" ID="ShowAddressPanel">
        <asiweb:TitleBar ID="TitleBar" Text="<%#PageTitle%>" OptionsMenuBehavior="AlwaysDisplay" runat="server"/>
        <asiweb:BusinessLabel runat="server" ID="LabelAddress"/>
        <br />
        <asiweb:BusinessHyperLink runat="server" ID="LinkChoose" Text="Choose another address"/>
    </span>
    <span runat="server" ID="DisplayButtonOnlyPanel">
        <telerik:RadButton ID="ChooseAddressButton" runat="server" SkinID="PanelCommandButtonEdit" ToolTip="Edit" Text="Edit" ButtonType="LinkButton" AutoPostBack="False"></telerik:RadButton>
    </span>
    
    <div style="visibility:hidden;display:none;">
        <asiweb:StyledButton runat="server" id="ButtonChooseAddressReturn" onclick="ButtonChooseAddressReturnClick" CausesValidation="false"/>
        <asiweb:BusinessTextBox runat="server" id="TextChooseAddressAction"/>
        <asiweb:BusinessTextBox runat="server" id="TextChooseAddressAddressId"/>
    </div>
</asp:Panel>       
