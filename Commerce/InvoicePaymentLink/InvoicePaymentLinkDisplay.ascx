<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="InvoicePaymentLinkDisplay.ascx.cs" Inherits="Asi.Web.iParts.Commerce.InvoicePaymentLink.InvoicePaymentLinkDisplay" %>

<asp:Panel ID="ContentPanel" runat="server" Visible="true">
    <asiweb:StyledLabel ID="InvoiceMessage" runat="server" CssClass="Description" Text="<%#InvoiceLegend%>" /> 
    <asiweb:StyledLabel ID="NoOpenInvoiceMessage" runat="server" CssClass="Description" Text="<%#NoOpenInvoice%>" Visible="false" />    
    <div runat="server" id="divSpacer" style="clear:both;padding:0.2em" Visible="false"></div>
    <asiweb:StyledButton ID="PayInvoiceButton" runat="server" OnClick="PayInvoiceButtonOnClick" Text="<%#LinkText%>"  /> 
    <div style="clear:both;"></div>
</asp:Panel>       
