<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="ProductDisplayDisplay.ascx.cs"
    Inherits="Asi.Web.iParts.Commerce.ProductDisplay.ProductDisplayDisplay" %>
<%@ Register TagPrefix="telerik" Namespace="Telerik.Web.UI" Assembly="Telerik.Web.UI" %>
<%@ Register TagPrefix="asiweb" Assembly="Asi.Web" Namespace="Asi.Web.UI.WebControls" %>
<asp:Panel ID="ContentPanel" runat="server" Visible="true">
    <asiweb:TitleBar ID="TitleBar" Text="<%#PageTitle%>" OptionsMenuBehavior="AlwaysDisplay"
        runat="server" />
    <asiweb:StyledLabel runat="server" ID="TopMessage" Visible="false" Text=""></asiweb:StyledLabel>
    <asp:Panel ID="DataPanel" runat="server" Visible="false">
        <asp:Table ID="ProductTable" runat="server" Width="100%" style="border:0px;margin:0px;padding:0px;">
            <asp:TableRow ID="TableRow1" runat="server">
                <asp:TableCell ID="ThumbnailCell" runat="server" Style="padding-right: 0.769em; border: 0px;
                    margin: 0px;" VerticalAlign="Top">
                    <asp:Image ID="ThumbnailImage" runat="server" AlternateText="Picture of the product"
                        ToolTip="Picture of the product" />
                </asp:TableCell>
                <asp:TableCell ID="DetailsCell" runat="server" VerticalAlign="Top" Style="border: 0px;
                    margin: 0px; padding: 0px;">
                    <asiweb:StyledLabel ID="ProductTitle" runat="server" Style="font-weight: bold;"></asiweb:StyledLabel><br />
                    <asiweb:StyledLabel ID="ProductDescription" runat="server"></asiweb:StyledLabel><br />
                    <br />
                    <div style="text-align: right; float: left;">
                        <asiweb:StyledLabel ID="Pricing" runat="server"></asiweb:StyledLabel>
                    </div>
                    <div runat="server" id="AddToCartDiv" style="text-align: right; float: right;">
                        Quantity &nbsp;&nbsp;<asiweb:NumberBox runat="server" ID="QuantityTextBox" style="text-align: right" ValidationGroup="<%# AddToCart.ClientID %>"
                            Text="1" Caption="Quantity" DisplayCaption="false" RenderPanelField="false" Width="3em"></asiweb:NumberBox>
                        &nbsp;&nbsp;
                        <asiweb:StyledButton ID="AddToCart" runat="server" Text="Add to Cart" OnClick="AddToCartClick" ValidationGroup="<%# AddToCart.ClientID %>"/>
                        <br />
                        <asp:CompareValidator ID="InventoryValidator" runat="server" Type="Double" ControlToValidate="QuantityTextBox" 
                            Operator="LessThanEqual" Display="Dynamic" ValidationGroup="<%# AddToCart.ClientID %>"/>
                        <br />
                        <asiweb:StyledLabel ID="ItemAddedMessageLabel" Visible="false" runat="server"></asiweb:StyledLabel>
                        &nbsp;<asiweb:BusinessHyperLink ID="CartLink" runat="server"></asiweb:BusinessHyperLink>
                    </div>
                </asp:TableCell>
            </asp:TableRow>
        </asp:Table>
    </asp:Panel>
</asp:Panel>
