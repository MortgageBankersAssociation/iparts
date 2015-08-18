<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="CartChargesDisplayDisplay.ascx.cs"
    Inherits="Asi.Web.iParts.Commerce.CartChargesDisplay.CartChargesDisplayDisplay" %>
<%@ Register TagPrefix="telerik" Namespace="Telerik.Web.UI" Assembly="Telerik.Web.UI" %>
<%@ Register TagPrefix="asiweb" Assembly="Asi.Web" Namespace="Asi.Web.UI.WebControls" %>
<asp:Panel ID="ContentPanel" runat="server" Visible="true">
    <asiweb:TitleBar ID="TitleBar" Text="<%#PageTitle%>" OptionsMenuBehavior="AlwaysDisplay"
        runat="server" />
    <asp:Panel runat="server" ID="DataPanel" class="StandardPanel" BorderStyle="None">
        <asiweb:BusinessTextBox ID="TxtTotalAmount" runat="server" RenderPanelField="true"
            DisplayCaption="true" Caption="Item Total" PositionCaption="Left" ReadOnly="true"
            BorderStyle="None" BorderWidth="0" />
        <asiweb:BusinessTextBox ID="TxtShippingAmount" runat="server" RenderPanelField="true"
            DisplayCaption="true" Caption="Shipping" PositionCaption="Left" ReadOnly="true"
            BorderStyle="None" BorderWidth="0" />
        <asiweb:BusinessTextBox ID="TxtHandlingAmount" runat="server" RenderPanelField="true"
            DisplayCaption="true" Caption="Handling" PositionCaption="Left" ReadOnly="true"
            BorderStyle="None" BorderWidth="0" />
        <asp:placeholder id="TaxPlaceholder" runat="server" Visible="false" />
        <asiweb:BusinessTextBox ID="TxtTaxAmountTotal" runat="server" RenderPanelField="true"
            DisplayCaption="true" Caption="Tax" PositionCaption="Left" ReadOnly="true" BorderStyle="None"
            BorderWidth="0" Visible="false" />     
        <asiweb:BusinessTextBox ID="TxtItemGrandTotalAmount" runat="server" RenderPanelField="true"
            DisplayCaption="true" Caption="Item Grand Total" PositionCaption="Left" ReadOnly="true"
            BorderStyle="None" BorderWidth="0" />
        <asiweb:BusinessTextBox ID="TxtInvoiceTotal" runat="server" RenderPanelField="true"
            DisplayCaption="true" Caption="Invoice Total" PositionCaption="Left" ReadOnly="true"
            BorderStyle="None" BorderWidth="0" />
        <asiweb:BusinessTextBox ID="TxtTransactionGrandTotal" runat="server" RenderPanelField="true"
            DisplayCaption="true" Caption="Transaction Grand Total" PositionCaption="Left" ReadOnly="true"
            BorderStyle="None" BorderWidth="0" />
        <%-- Following DIV is essential to make borders draw properly --%>
        <div style="clear: both;">
        </div>
    </asp:Panel>
    <div runat="server" id="DivErrors" visible="false">
        <asp:Label ID="ErrorLabel" runat="server" CssClass="Error" />
    </div>
    <div style="clear: both;">
    </div>
</asp:Panel>
