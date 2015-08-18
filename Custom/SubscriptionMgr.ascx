<%@ Control Language="vb" AutoEventWireup="false" CodeBehind="SubscriptionMgr.ascx.vb" Inherits="MBA_vbParts.SubscriptionMgr" %>
<script language="javascript" type="text/javascript">
    function runFilter(){
    
         __doPostBack('<%= lnkFilter.UniqueID %>','');
         
         
    }
  
</script>
<div class="iMIS-WebPart">
<asp:Panel ID="panelEditor" runat="server" CssClass="StandardPanel" style="width: margin: auto;">
<div style="float: middle;">
<div class="WebPartZone " >
<div  class="PanelBody">
<table cellpadding="5" cellspacing="5" width="100%">
    <tr>
        <td colspan="3"></td>
    </tr>
    <tr>
        <div class="PanelHead Distinguish">
            <td align="center"><span class="PanelTitle">Complimentary Subscriptions</span></td>
            <td></td>
            <td align="center"><span class="PanelTitle">Paid Subscriptions</span></td>
        </div>
    </tr>
    <tr>
        <td valign="top">
            <asp:GridView ID="grdSubs" DataKeyNames="ID" runat="server" 
                AutoGenerateColumns="False" Width="100%" BorderStyle="Solid" CellPadding="4" 
                ForeColor="#333333" GridLines="None" CellSpacing="1">
                <FooterStyle BackColor="#1C5E55" Font-Bold="True" ForeColor="White" />
                <RowStyle BackColor="#E3EAEB" />
                <columns>
                    <asp:BoundField HeaderText="#" DataField="count" ReadOnly="true" 
                        ItemStyle-Width="5%" >
<ItemStyle Width="5%"></ItemStyle>
                    </asp:BoundField>
                    <asp:BoundField DataField="id" ReadOnly="true" Visible="false"  />
                    <asp:BoundField HeaderText="Name"  DataField="full_name" ReadOnly="true" 
                        ItemStyle-Width="40%" >
<ItemStyle Width="40%"></ItemStyle>
                    </asp:BoundField>
                    <asp:BoundField HeaderText="Title" DataField="title" ReadOnly="true" 
                        ItemStyle-Width="40%" >
<ItemStyle Width="40%"></ItemStyle>
                    </asp:BoundField>
                    <asp:TemplateField>
                        <ItemTemplate>
                            <asp:Button runat="server" id="cmdAction" text="Assign" />
                        </ItemTemplate>
                    </asp:TemplateField>
                </columns>
                <PagerStyle BackColor="#666666" ForeColor="White" HorizontalAlign="Center" />
                <SelectedRowStyle BackColor="#C5BBAF" Font-Bold="True" ForeColor="#333333" />
                <HeaderStyle BackColor="#1C5E55" Font-Bold="True" ForeColor="White" />
                <EditRowStyle BackColor="#7C6F57" />
                <AlternatingRowStyle BackColor="White" />
            </asp:GridView>
        </td>
        <td>&nbsp;&nbsp;</td>
        <td valign="top">
            <asp:GridView ID="grdPaidSubs" DataKeyNames="ID,Paid_Thru,City,State_Province" runat="server" 
                AutoGenerateColumns="False" Width="100%" AllowSorting="True" 
                BorderStyle="Solid" CellPadding="4" ForeColor="#333333" GridLines="None" 
                CellSpacing="1">
                <FooterStyle BackColor="#1C5E55" Font-Bold="True" ForeColor="White" />
                <RowStyle BackColor="#E3EAEB" />
                <Columns>
                    <asp:BoundField HeaderText="Name"  DataField="full_name" ReadOnly="true" SortExpression="full_name" />
                    <asp:TemplateField HeaderText="City, St">
                        <ItemTemplate>
                            <asp:Label runat="server" ID="lblCtSt"></asp:Label>
                        </ItemTemplate>
                    </asp:TemplateField>
                     <asp:TemplateField HeaderText="Subscription Paid Thru" SortExpression="paid_thru">
                        <ItemTemplate>
                            <asp:Label runat="server" ID="lblPaid"></asp:Label>
                                 </ItemTemplate>
                    </asp:TemplateField>
                </Columns>
                <PagerStyle BackColor="#666666" ForeColor="White" HorizontalAlign="Center" />
                <SelectedRowStyle BackColor="#C5BBAF" Font-Bold="True" ForeColor="#333333" />
                <HeaderStyle BackColor="#1C5E55" Font-Bold="True" ForeColor="White" />
                <EditRowStyle BackColor="#7C6F57" />
                <AlternatingRowStyle BackColor="White" />
            </asp:GridView>
        </td>
    </tr>
</table>
</div>
</div>
</div>
</asp:Panel>
<asp:Panel runat="server" ID="panelList" Width="65%" BorderStyle="Solid" 
        BorderWidth="1px">

    <table border="1" style="background:#ffffff;" width="100%">
        <tr>
            <td>Last Name:</td>
            <td>
                <asp:TextBox ID="txtLName" runat="server" Width="360px"></asp:TextBox>
                <asp:LinkButton ID="lnkFilter" runat="server">Filter</asp:LinkButton>
            </td>
        </tr>
        <tr>
            <td colspan="2">
                
                <asp:GridView ID="grdRoster" DataKeyNames="Name_ID" runat="server" 
                    AllowPaging="True" AutoGenerateColumns="False" Width="100%" 
                    PageSize="15" BackColor="White" BorderColor="#999999" BorderStyle="Solid" 
                    BorderWidth="1px" CellPadding="3" ForeColor="Black" GridLines="Vertical">
                    <FooterStyle BackColor="#CCCCCC" />
                    <Columns>
                        <asp:TemplateField>
                            <ItemTemplate>
                                <asp:CheckBox runat="server" ID="chkSel"    />
                            </ItemTemplate>
                        </asp:TemplateField>
                        
                        <asp:BoundField DataField="FL_Name" ReadOnly="true"  SortExpression="Full_Name"  />
                        <asp:BoundField DataField="Title1" ReadOnly="true" SortExpression="Full_Name"  />
                        <asp:BoundField DataField="Name_ID" Visible="false" ReadOnly="true"  />
                    </Columns>
                    <PagerStyle BackColor="#999999" ForeColor="Black" HorizontalAlign="Center" />
                    <SelectedRowStyle BackColor="#000099" Font-Bold="True" ForeColor="White" />
                    <HeaderStyle BackColor="Black" Font-Bold="True" ForeColor="White" />
                    <AlternatingRowStyle BackColor="#CCCCCC" />
                </asp:GridView>
                
</td>
        </tr>
        <tr>
            <td colspan="2">
                <asp:Button ID="cmdSelect" runat="server" Text="Select" />
                <asp:Button ID="cmdCancel" runat="server" Text="Close" />
            </td>
        </tr>
    </table>


</asp:Panel>
<asp:Panel ID="panelAccessError" runat="server">
<div  class="PanelBody">
    <table>
        <tr>
            <td></td>
        </tr>
        <tr>
            <td>Your login credentials does not have sufficient permissions to access this area.</td>
        </tr>
        <tr>
            <td>
                &nbsp;</td>
        </tr>
        <tr>
            <td></td>
            
        </tr>
    </table>
    </div>
</asp:Panel>
</div>