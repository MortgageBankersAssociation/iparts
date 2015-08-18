<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="CartCheckoutButtonLinkDisplay.ascx.cs"
    Inherits="Asi.Web.iParts.Commerce.CartCheckoutButtonLink.CartCheckoutButtonLinkDisplay" %>
<%@ Register TagPrefix="asiweb" Assembly="Asi.Web" Namespace="Asi.Web.UI.WebControls" %>
<asp:Panel ID="ContentPanel" runat="server">
    <asp:UpdatePanel ID="UpdatePanel1" runat="server" UpdateMode="Always">
        <ContentTemplate>
            <div runat="server" id="RedirectToCartDiv">
                <div class="PanelField FloatRight">
                    <div class="FloatRight">
                        <asiweb:StyledButton runat="server" ID="RedirectToCartButton" />
                    </div>
                </div>
                <div style="clear: both;">
                </div>
            </div>
        </ContentTemplate>
    </asp:UpdatePanel>
</asp:Panel>
