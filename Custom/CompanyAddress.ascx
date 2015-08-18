<%@ Control Language="VB" AutoEventWireup="false" CodeFile="CompanyAddress.ascx.vb" Inherits="Custom_GE_CompanyAddress" %>

<asp:Panel ID="pnlCompanyAddress" runat="server">
    <table cellpadding = "5px">
        <tr>
            <td valign="top"><b>Company:</b></td><td>&nbsp;&nbsp;</td>
            <td valign="top"><asp:Label ID="lblCompany" runat="server" /></td>
        </tr>
        <tr>
            <td valign="top"><b>Address:</b></td><td>&nbsp;&nbsp;</td>
            <td valign="top"><asp:Label ID="lblAddress" runat="server" /></td>
        </tr>
        <tr>
            <td valign="top"><b>Phone:</b></td><td>&nbsp;&nbsp;</td>
            <td valign="top"><asp:Label ID="lblPhone" runat="server" /></td>
        </tr>
        <tr>
            <td valign="top"><b>Fax:</b></td><td>&nbsp;&nbsp;</td>
            <td valign="top"><asp:Label ID="lblFax" runat="server" /></td>
        </tr>
        <tr>
            <td valign="top"><b>Toll Free:</b></td><td>&nbsp;&nbsp;</td>
            <td valign="top"><asp:Label ID="lblTollFree" runat="server" /></td>
        </tr>
        <tr>
            <td valign="top"><b>Website:</b></td><td>&nbsp;&nbsp;</td>
            <td valign="top"><asp:Label ID="lblWebsite" runat="server" /></td>
        </tr>
        <tr>
            <td valign="top"><b>Membership Renewal:</b></td><td>&nbsp;&nbsp;</td>
            <td valign="top"><asp:Label ID="lblPaidThru" runat="server" /></td>
        </tr>
    </table>
</asp:Panel>
<asp:Panel ID="pnlNoCompany" runat="server" Visible="false">
    <div>
        There is no company associated with your contact record.
    </div>
</asp:Panel>
