<%@ Control Language="vb" AutoEventWireup="false" CodeBehind="EmailPreference.ascx.vb" Inherits="MBA_vbParts.EmailPreference" %>
<script type="text/javascript" src="/js/jquery-1.2.2.pack.js"></script>
<style type="text/css">

DIV.htmltooltip
{
	z-index: 1000;
	border-bottom: black 10px solid;
	position: absolute;
	border-left: black 10px solid;
	padding-bottom: 3px;
	padding-left: 3px;
	width: 250px;
	padding-right: 3px;
	background: #999966;
	color: #000000;
	border-top: black 10px solid;
	top: -1000px;
	border-right: black 10px solid;
	padding-top: 3px;
	left: -1000px;
}

</style>
<script type="text/javascript" src="/js/htmltooltip.js">

/***********************************************
* Inline HTML Tooltip script- by JavaScript Kit (http://www.javascriptkit.com)
* This notice must stay intact for usage
* Visit JavaScript Kit at http://www.javascriptkit.com/ for this script and 100s more
***********************************************/

</script>
<asp:Literal ID="DisplayContentId" Runat="server"></asp:Literal>
<asp:Panel runat="server" ID="panelMain">
<TABLE cellSpacing="0" cellPadding="0" width="970" border="0">
	<TR>
		<TD align="center">
			<table width="550" border="0">
				<tr>
					<td align="center">
						<br>
						<asp:datagrid id="dgMailings" AutoGenerateColumns="False" runat="server" BorderWidth="0">
							<AlternatingItemStyle BackColor="#d4d0c8"></AlternatingItemStyle>
							<Columns>
								<asp:BoundColumn DataField="StrMailingCode" ReadOnly="True" Visible="False"></asp:BoundColumn>
								<asp:BoundColumn DataField="Optin" ReadOnly="True" Visible="False"></asp:BoundColumn>
								<asp:BoundColumn DataField="Optout" ReadOnly="True" Visible="False"></asp:BoundColumn>
								<asp:TemplateColumn>
									<ItemTemplate>
										<a href="#" rel="htmltooltip">
											<asp:Image ID="imgHelp" AlternateText="txt" runat="server" imageurl="../images/icon_info.gif"></asp:Image></a>
										
									</ItemTemplate>
								</asp:TemplateColumn>
								<asp:TemplateColumn HeaderText="<b>Mailing</b><br>&nbsp;" HeaderStyle-CssClass="p">
									<ItemTemplate>
										<%# Container.DataItem("MailingDescription") %>
										<asp:Label ID="lblTool" Runat="server"></asp:Label>
									</ItemTemplate>
								</asp:TemplateColumn>
								<asp:TemplateColumn HeaderText="<b>Opt-In</b>&nbsp;<br>&nbsp;" HeaderStyle-CssClass="p">
									<ItemTemplate>
										<center>
											<asp:RadioButton ID="radOptin" Runat="server" GroupName="optionme"></asp:RadioButton></center>
									</ItemTemplate>
								</asp:TemplateColumn>
								<asp:TemplateColumn HeaderText="&nbsp;<b>Opt-Out</b><br>&nbsp;" HeaderStyle-CssClass="p">
									<ItemTemplate>
										<center>
											<asp:RadioButton ID="radOptout" Runat="server" GroupName="optionme"></asp:RadioButton></center>
									</ItemTemplate>
								</asp:TemplateColumn>
								<asp:BoundColumn DataField="ContentID" ReadOnly="True" Visible="False"></asp:BoundColumn>
							</Columns>
						</asp:datagrid></td>
				</tr>
				<tr>
					<td align="center"><br>
						<br>
						<asp:button id="cmdUpdate" runat="server" Text="Update My Preferences"></asp:button><br>
						<br>
						<br>
						<br>
					</td>
				</tr>
			</table>
		</TD>
	</TR>
	
</TABLE>
</asp:Panel>
<asp:Panel runat="server" ID="panelResults">
<p><asp:Label ID="lblResult" runat="server"></asp:Label></p>
<p>&nbsp;</p>
<p><asp:Button ID="cmdReturn" runat="server" Text="Return to Preferences" /></p>
</asp:Panel>
