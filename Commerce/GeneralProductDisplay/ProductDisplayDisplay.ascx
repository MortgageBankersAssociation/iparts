<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="ProductDisplayDisplay.ascx.cs"
    Inherits="Asi.Web.iParts.Commerce.GeneralProductDisplay.ProductDisplayDisplay" %>
<%@ Import Namespace="Asi" %>
<%@ Register TagPrefix="telerik" Namespace="Telerik.Web.UI" Assembly="Telerik.Web.UI" %>
<%@ Register TagPrefix="asiweb" Assembly="Asi.Web" Namespace="Asi.Web.UI.WebControls" %>
<asp:Panel ID="ContentPanel" runat="server" Visible="true">
    <asiweb:TitleBar ID="TitleBar" Text="<%#PageTitle%>" OptionsMenuBehavior="AlwaysDisplay"
        runat="server" />
    <asp:Panel ID="DataPanel" runat="server" Visible="false">
        <asp:Table ID="ProductTable" runat="server" Width="100%" style="border:0px;margin:0px;padding:0px;">
            <asp:TableRow ID="TableRow1" runat="server">
                <asp:TableCell ID="ThumbnailCell" runat="server" Style="padding-right:0.769em;border:0px;margin: 0px;vertical-align:top">
                    <asp:Image ID="ThumbnailImage" runat="server" />
                </asp:TableCell>
                <asp:TableCell ID="DetailsCell" runat="server" Style="border:0px;margin:0px;padding:0px;vertical-align:top">
                    <asiweb:StyledLabel ID="ProductTitle" runat="server" Style="font-weight: bold;" /><br />
                    <asiweb:StyledLabel ID="ProductDescription" runat="server" /><br />
                    <asiweb:StyledLabel ID="InventoryLabel" runat="server" CssClass="Error" />
                    <div style="text-align:right;float:left">
                        <asiweb:StyledLabel ID="StandardPricing" runat="server" />
                        <asiweb:StyledLabel ID="DiscountPricing" runat="server" />                        
                        <asiweb:StyledLabel ID="CustomerPricing" runat="server" />
                        <br />
                        <asiweb:StyledLabel ID="Savings" runat="server" />
                    </div>
                    <div runat="server" id="AddToCartDiv" style="text-align:right;float:right;padding-left:0.225em;">
                        <asiweb:StyledLabel ID="QuantityLabel" runat="server" Text='<%# ResourceManager.GetWord("Quantity") %>' />&nbsp;&nbsp;
                        <asiweb:BusinessTextBox runat="server" ID="QuantityTextBox" style="text-align: right" Text="1" Caption="Quantity" 
                            DisplayCaption="false" RenderPanelField="false" MaxLength="5" Width="3em" />&nbsp;&nbsp;
                        <asiweb:AsiRequiredFieldValidator ID="QuantityRequiredFieldValidator" runat="server" ControlToValidate="QuantityTextBox" 
                            Display="None" ErrorMessage='<%# ResourceManager.GetPhrase("Asi.Web.iParts.Commerce.ProductDisplay.QuantityRequired", "Quantity is required") %>'
                            ValidationGroup='<%# UniqueID %>' />                        
                        <asp:RangeValidator ID="QuantityRangeValidator" runat="server" MinimumValue="0" MaximumValue="100000" Type="Integer" Display="None"
                            ControlToValidate="QuantityTextBox" ValidationGroup='<%# UniqueID %>'
                            ErrorMessage='<%# ResourceManager.GetPhrase("Asi.Web.iParts.Commerce.ProductDisplay.QuantityInteger", "Quantity must be a positive whole number")  %>' />
                        <asiweb:StyledButton ID="AddToCart" runat="server" Text="Add to Cart" OnClick="AddToCartClick" ValidationGroup='<%# UniqueID %>' />
                        <br />
                        <asp:ValidationSummary ID="AddToCartValidationSummary" runat="server" DisplayMode="List" ValidationGroup='<%# UniqueID %>' />
                        <asiweb:StyledLabel ID="ItemAddedMessageLabel" Visible="false" runat="server" />&nbsp;                        
                        <asiweb:BusinessHyperLink ID="CartLink" runat="server" />
                    </div>
                </asp:TableCell>
            </asp:TableRow>
        </asp:Table>
    </asp:Panel>
    <asp:Button ID="RefreshButton" runat="server" CausesValidation="false" Style="display: none"
        OnClick="RefreshButtonClick" />
</asp:Panel>
