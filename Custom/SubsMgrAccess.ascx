<%@ Control Language="vb" AutoEventWireup="false" CodeBehind="SubsMgrAccess.ascx.vb" Inherits="MBA_vbParts.SubsMgrAccess" %>
<br />
<br />
<asp:Panel ID="pnlBusApp" runat="server" Visible="false">

	<div id="SubsManagerLink">
		<asp:Button ID="btnSubs" runat="server" Text="Manage Magazine Subscriptions" />
	    <asp:Button ID="btnDirectory" runat="server" Text="Manage Company Profile" />
	</div>

</asp:Panel>