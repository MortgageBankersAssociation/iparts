<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="OrderConfirmationDisplayDisplay.ascx.cs" Inherits="Asi.Web.iParts.Commerce.OrderConfirmationDisplay.OrderConfirmationDisplayDisplay" %>
<%@ Import Namespace="Asi" %>
<%@ Register TagPrefix="telerik" Namespace="Telerik.Web.UI" Assembly="Telerik.Web.UI" %>
<%@ Register TagPrefix="asiweb" Assembly="Asi.Web" Namespace="Asi.Web.UI.WebControls" %>

<asp:Panel ID="ContentPanel" runat="server" Visible="true">
    <asiweb:TitleBar ID="TitleBar" Text="<%#PageTitle%>" OptionsMenuBehavior="AlwaysDisplay" runat="server" />
    <asp:Panel runat="server" ID="DataPanel" CssClass="StandardPanel" BorderStyle="None">
        <div style="width: 100%; text-align: center;"><strong><asp:Label ID="LetterheadNameLabel" runat="server" /></strong></div>
        <div style="width: 100%; text-align: center;"><asp:Label ID="LetterheadAddressLabel" runat="server" /></div>
        <div style="width: 100%; text-align: right;"><asp:HyperLink runat="server" ID="PrintFriendlyLink" Text='<%# ResourceManager.GetPhrase("Asi.Web.iParts.OrderConfirmationDisplay.PrintFriendlyLink", "Printable version") %>' Visible="false" /></div>
        <br />
        <asiweb:StyledLabel ID="OrderNumberLabel" runat="server" RenderPanelField="true" DisplayCaption="true" Caption="Order Number" PositionCaption="Left" />        
        <asiweb:StyledLabel ID="OrderDateLabel" runat="server" RenderPanelField="true" DisplayCaption="true" Caption="Order Date" PositionCaption="Left" />        
        <asp:Panel runat="server" ID="PaymentPanel" CssClass="StandardPanel" BorderStyle="None">
            <asiweb:StyledLabel ID="PaymentMethodLabel" runat="server" RenderPanelField="true" DisplayCaption="true" Caption="Payment Method" PositionCaption="Left" />
            <asiweb:StyledLabel ID="CCNameLabel" runat="server" RenderPanelField="true" DisplayCaption="true" Caption="Name on Card" PositionCaption="Left" />
        </asp:Panel>       
        <asiweb:StyledLabel ID="ShipAddressLabel" runat="server" RenderPanelField="true" DisplayCaption="true" Caption="Ship To" PositionCaption="Left" />
        <asiweb:StyledLabel ID="ShipMethodLabel" runat="server" RenderPanelField="true" DisplayCaption="true" Caption="Shipping Method" PositionCaption="Left" />
        <%-- Following DIV is essential to create a bit of space between the address and the item list --%>
        <div style="clear:both;"></div>
        <asiweb:Lister2 ID="ItemGrid" runat="server" AjaxEnabled="false" SelectColumnLocation="None" 
            EditColumnLocation="None" DeleteColumnLocation="None"  
            OnNeedDataSource="ItemGrid_OnNeedDataSource"
            TargetPreserveStatefulBusinessContainer="true" SortingEnabled="false" OnItemCreated="ItemGrid_OnItemCreated"  BorderStyle="None" BorderWidth="0" />        
        <div class="PanelBlock FloatRight">
        <asiweb:BusinessTextBox ID="TxtTotalAmount" runat="server" RenderPanelField="true" DisplayCaption="true" Caption="Item Total" PositionCaption="Left"  ReadOnly="true" BorderStyle="None" BorderWidth="0"  TabIndex="-10" />        
        <asiweb:BusinessTextBox ID="TxtShippingAmount" runat="server" RenderPanelField="true" DisplayCaption="true" Caption="Shipping" PositionCaption="Left"  ReadOnly="true" BorderStyle="None" BorderWidth="0"  TabIndex="-10" />        
        <asiweb:BusinessTextBox ID="TxtHandlingAmount" runat="server" RenderPanelField="true" DisplayCaption="true" Caption="Handling" PositionCaption="Left"  ReadOnly="true" BorderStyle="None" BorderWidth="0"  TabIndex="-10" />       
        <asp:placeholder id="TaxPlaceholder" runat="server" Visible="false" />
        <asiweb:BusinessTextBox ID="TxtTaxAmountTotal" runat="server" RenderPanelField="true"
            DisplayCaption="true" Caption="Tax" PositionCaption="Left" ReadOnly="true" BorderStyle="None"
            BorderWidth="0"  Visible="false" TabIndex="-10" /> 
        <asiweb:BusinessTextBox ID="TxtGrandTotalAmount" runat="server" RenderPanelField="true" DisplayCaption="true" Caption="Item Grand Total" PositionCaption="Left"  ReadOnly="true" BorderStyle="None" BorderWidth="0" TabIndex="-10" />        
        <asiweb:BusinessTextBox ID="TxtInvoiceTotal" runat="server" RenderPanelField="true" DisplayCaption="true" Caption="Invoice Total" PositionCaption="Left"  ReadOnly="true" BorderStyle="None" BorderWidth="0"  TabIndex="-10" />           
        <asiweb:BusinessTextBox ID="TxtTransTotalAmount" runat="server" RenderPanelField="true" DisplayCaption="true" Caption="Transaction Grand Total" PositionCaption="Left"  ReadOnly="true" BorderStyle="None" BorderWidth="0" TabIndex="-10" />        
        </div>
        <%-- Following DIV is essential to make borders draw properly --%>
        <div style="clear:both;"></div>
    </asp:Panel>
    <hr />
    <asp:Label runat="server" id="ErrorsLabel" Visible="false" CssClass="Error" Text=""></asp:Label>
    <div runat="server" id="EmailConfirmationDiv" style="text-align: right;" >
        <asp:Label runat="server" ID="EmailConfirmationLabel" Text="" />
        <asp:Label runat="server" ID="EmailConfirmationCopyLabel" Text='<%# ResourceManager.GetPhrase("Asi.Web.iParts.OrderConfirmationDisplay.EmailConfirmationCopy", "Send another copy to: ") %>'/><asiweb:BusinessTextBox ID="EmailTextBox" runat="server" /> <asiweb:StyledButton runat="server" Text="Send" ID="SendEmailButton" OnClick="SendEmailButtonClick" />
    </div>
</asp:Panel>       
