<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="ShippingMethodSelectorDisplay.ascx.cs"
    Inherits="Asi.Web.iParts.Commerce.ShippingMethodSelector.ShippingMethodSelectorDisplay" %>
<%@ Import Namespace="Asi" %>
<%@ Register TagPrefix="telerik" Namespace="Telerik.Web.UI" Assembly="Telerik.Web.UI" %>
<%@ Register TagPrefix="asiweb" Assembly="Asi.Web" Namespace="Asi.Web.UI.WebControls" %>
<%@ Register TagPrefix="uc1" TagName="AddressSelector" Src="~/iParts/Commerce/AddressSelector/AddressSelectorDisplay.ascx" %>
<asp:Panel ID="ContentPanel" runat="server" Visible="true">

    <asiweb:TitleBar ID="TitleBar" Text="<%#PageTitle%>" OptionsMenuBehavior="AlwaysDisplay"
        runat="server" />
    <asp:Panel runat="server" ID="DataPanel" class="StandardPanel" BorderStyle="None">
        <div class="PanelField Left">
            <div class="PanelFieldLabel">
                <label>Ship To</label></div>
            <div runat="server" id="AddressSelectorDiv" class="PanelFieldValue">
                    <uc1:AddressSelector runat="Server" id="AddressSelectorSM" AddressPath="Cart.ShippingAddress" OverrideFloating="true"
                        PageTitle="" ShowBorder="false">
                    </uc1:AddressSelector>
            </div>
        </div>
        <asiweb:BusinessDropDownList runat="server" ID="ShippingMethodDropDown" DisplayCaption="true"
            RenderPanelField="true" Caption="Shipping Method" OnSelectedIndexChanged="ShippingMethodDropDown_SelectedIndexChanged"
            AutoPostBack="true" />
        <div style="clear: both;">
        </div>
    </asp:Panel>
    <div runat="server" id="DivErrors" visible="false">
        <asp:Label ID="SoaErrorLabel" runat="server" CssClass="Error" Text='<%# ResourceManager.GetPhrase("SoaServiceUnavailable", "Temporarily Unavailable") %>' />
    </div>
    <div style="clear: both;">
    </div>
</asp:Panel>
