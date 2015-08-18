<%@ Control Language="vb" AutoEventWireup="false" CodeBehind="MBA_Subs.ascx.vb" Inherits="MBA_vbParts.MBA_Subs" %>
<div class="iMIS-WebPart">
    <div style="float: middle;">
        
           <div  class="PanelBody">
             <div class="WebPartZone ">
                <table cellpadding="5" cellspacing="5" class="Form" style="width: 501px; margin: auto;">
                    <tr>
                        <td colspan="2">
                        <p>When transferring subscriptions from one individual to another, please be sure to 
                            physically click on the subscription you would like to transfer (even if there 
                            is only one subscription record). The “Transfer to ID….” option will be disabled 
                            until you physically click on the item you would like to transfer. </p>
                        </td>
                    </tr>
                    <tr style="background-color: #CCCCCC;">
                        <td width="15%" align="left"><strong>Imis ID:</strong></td>
                        <td align="left">
                            <asp:TextBox ID="txtID" runat="server" AutoPostBack="True"></asp:TextBox>&nbsp;
                            <asp:Label ID="lblName" runat="server"></asp:Label>
                            
                            
                            
                        </td>
                    </tr>
                    <tr style="background-color: #CCCCCC;">
                        <td align="left"><strong>Subscription Type:</strong></td>
                        <td align="left">
                            <asp:DropDownList ID="cboSubDesc" runat="server" Height="21px" Width="389px" 
                                AutoPostBack="True">
                            </asp:DropDownList>
                        </td>
                    </tr>
                    <tr>
                        <td colspan="2"><strong>Subscriptions </strong>(Click subscription to select)</td>
                    </tr>
                    <tr>
                        <td colspan="2">
                            <asp:GridView ID="gvSubs" DataKeyNames="Product Code" runat="server" 
                                CellPadding="4" ForeColor="#333333" GridLines="None" Width="100%">
                                <FooterStyle BackColor="#507CD1" Font-Bold="True" ForeColor="White" />
                                <RowStyle BackColor="#EFF3FB" />
                                <EmptyDataTemplate>No subscriptions</EmptyDataTemplate>
                                <Columns>
                                   <asp:TemplateField Visible="false">
                                        <ItemTemplate>
                                            <asp:LinkButton runat="server" CommandName="select" ID="selectButton" Text="select"></asp:LinkButton>
                                        </ItemTemplate>
                                   </asp:TemplateField>
                                </Columns>
                                <PagerStyle BackColor="#2461BF" ForeColor="White" HorizontalAlign="Center" />
                                <SelectedRowStyle BackColor="#D1DDF1" Font-Bold="True" ForeColor="#333333" />
                                <HeaderStyle BackColor="#507CD1" Font-Bold="True" ForeColor="White" />
                                <EditRowStyle BackColor="#2461BF" />
                                <AlternatingRowStyle BackColor="#CCCCCC" />
                            </asp:GridView>
                        </td>
                    </tr>
                    <tr>
                        <td colspan="2">
                            <table >
                                <tr style="background-color: #CCCCCC;">
                                    <td><strong>Subscription Task(s):</strong></td>
                                </tr>
                                <tr>
                                    <td>
                                        <asp:RadioButtonList ID="radtask" runat="server" RepeatColumns="2" 
                                            RepeatDirection="Horizontal" AutoPostBack="True" Width="500px">
                                            <asp:ListItem Value="1">Transfer ID</asp:ListItem>
                                            <asp:ListItem Value="2">Change Product</asp:ListItem>
                                            <asp:ListItem Value="3">New Subscription</asp:ListItem>
                                            <asp:ListItem Value="4">Create &quot;Bill Me&quot; Subscription</asp:ListItem>
                                        </asp:RadioButtonList>
                                    </td>
                                </tr>
                                <asp:Panel ID="panelNewType" runat="server" CssClass="StandardPanel" style="width: 500px; margin: auto;"  >
                                <tr>
                                    <td><hr /></td>
                                </tr>
                                <tr>
                                    <td>
                                        <table>
                                            <tr>
                                                <td>Item:</td>
                                                <td>
                                                    <asp:DropDownList ID="cboItem" runat="server" AutoPostBack="true">
                                                    </asp:DropDownList><asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" 
                                ControlToValidate="cboItem" ErrorMessage="*" ValidationGroup="NewSub" InitialValue="99"></asp:RequiredFieldValidator>
                                                </td>
                                                <td>Begin:</td>
                                                <td><asp:TextBox ID="txtBegin" runat="server"></asp:TextBox><asp:RequiredFieldValidator ID="RequiredFieldValidator3" runat="server" 
                                ControlToValidate="txtBegin" ErrorMessage="*" ValidationGroup="NewSub"></asp:RequiredFieldValidator></td>
                                            </tr>
                                            <tr>
                                                <td colspan="4">
                                                    <asp:Label ID="lblDesc" runat="server" ></asp:Label>
                                                </td>
                                            </tr>
                                            <tr>
                                                <td>Served:</td>
                                                <td colspan="3">
                                                    <asp:DropDownList ID="cboServed" runat="server" AutoPostBack="False" 
                                                        Height="21px" Width="247px">
                                                    </asp:DropDownList>
                                                </td>
                                            </tr>
                                            <tr>
                                                <td>Other Desc:</td>
                                                <td colspan="3">
                                                    <asp:TextBox ID="txtOtherDesc" runat="server" Width="246px"></asp:TextBox>
                                                </td>
                                            </tr>
                                            <tr>
                                                <td>Qual:</td>
                                                <td colspan="3">
                                                    <asp:DropDownList ID="cboQual" runat="server" AutoPostBack="False" 
                                                        Height="21px" Width="247px">
                                                    </asp:DropDownList>
                                                </td>
                                            </tr>
                                            <tr>
                                                <td>Amount:</td>
                                                <td>
                                                    <asp:TextBox ID="txtAmount" runat="server" Width="73px" ValidationGroup="NewSub"></asp:TextBox>
                                                     <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" 
                                ControlToValidate="txtAmount" ErrorMessage="*" ValidationGroup="NewSub"></asp:RequiredFieldValidator><asp:RegularExpressionValidator ID="RegularExpressionValidator1" runat="server" 
                                ControlToValidate="txtAmount" ErrorMessage="Valid amt req." 
                                ValidationExpression="\d{1,5}(\.\d{0,2})?" ValidationGroup="NewSub"></asp:RegularExpressionValidator>
                               
                                                </td>
                                                <td>Promo Months:</td>
                                                <td>
                                                    <asp:TextBox ID="txtPromo" runat="server" Width="108px"></asp:TextBox>
                                                    <asp:RequiredFieldValidator ID="RequiredFieldValidator5" runat="server" 
                                ControlToValidate="txtPromo" ErrorMessage="*" ValidationGroup="NewSub"></asp:RequiredFieldValidator>
                                                </td>
                                            </tr>
                                            <tr>
                                                <td>Bill ID:</td>
                                                <td><asp:TextBox ID="txtBillID" runat="server"></asp:TextBox><asp:RequiredFieldValidator ID="RequiredFieldValidator6" runat="server" 
                                ControlToValidate="txtBillID" ErrorMessage="*" ValidationGroup="NewSub"></asp:RequiredFieldValidator></td>
                                                <td colspan="2">
                                                    <asp:CheckBox ID="chkPromo" runat="server" Text="Promo"/>
                                                    <asp:CheckBox ID="chkMag" runat="server" Text="Yes to Mag" />
                                                </td>
                                            </tr>
                                            <tr>
                                                <td colspan="4" align="center">
                                                    <asp:Button ID="cmdCreateNew" runat="server" Text="Create" ValidationGroup="NewSub" />
                                                </td>
                                            </tr>
                                            <tr>
                                                <td colspan="4" align="center">
                                                    <br />
                                                    <asp:Label runat="server" ID="lblNewResult"></asp:Label><br /><asp:LinkButton runat="server" ID="lnkNewReturn" Text="Return"></asp:LinkButton>
                                                </td>
                                            </tr>
                                        </table>
                                    </td>
                                </tr>
                               </asp:Panel>
                                <asp:Panel ID="panelBillType" CssClass="StandardPanel" runat="server" style="width: 500px; margin: auto;">
                               <tr>
                                    <td><hr /></td>
                                </tr>
                                <tr>
                                    <td>
                                        <table>
                                            <tr>
                                                <td>Bill Me:</td>
                                                <td colspan="3"> <asp:DropDownList ID="cboBillMe" runat="server" AutoPostBack="False" 
                                                        Height="21px" Width="247px">
                                                    </asp:DropDownList>
                                                    <asp:RequiredFieldValidator ID="RequiredFieldValidator7" runat="server" 
                                ControlToValidate="cboBillMe" ErrorMessage="*" ValidationGroup="BillSub" InitialValue="99"></asp:RequiredFieldValidator>
                                                    </td>
                                            </tr>
                                            <tr>
                                                <td>Begin Date:</td>
                                                <td><asp:TextBox ID="txtBeginDate" runat="server"></asp:TextBox>
                                                <asp:RequiredFieldValidator ID="RequiredFieldValidator4" runat="server" 
                                ControlToValidate="txtBeginDate" ErrorMessage="*" ValidationGroup="BillSub"></asp:RequiredFieldValidator>
                                                </td>
                                                <td>Source</td>
                                                <td><asp:TextBox ID="txtSource" runat="server"></asp:TextBox></td>
                                            </tr>
                                            <tr>
                                                <td colspan="4" align="center">
                                                    <asp:Button ID="cmdCreateBill" runat="server" Text="Create" CausesValidation="true" ValidationGroup="BillSub" />
                                                </td>
                                            </tr>
                                            <tr>
                                                <td colspan="4" align="center">
                                                <br />
                                                <asp:Label runat="server" ID="lblBillResult"></asp:Label><br />
                                                <asp:LinkButton ID="lnkReturnBill" runat="server" Text="Return"></asp:LinkButton></td>
                                            </tr>
                                        </table>
                                    </td>
                                </tr>
                               </asp:Panel>
                                <asp:Panel ID="panelTransType" CssClass="StandardPanel" runat="server" style="width: 500px; margin: auto;">
                               <tr>
                                    <td><hr /></td>
                                </tr>
                                <tr>
                                    <td>
                                        <table>
                                            <tr>
                                                <td>Transfer ID:</td>
                                                <td>
                                                    <asp:TextBox ID="txtNewID" runat="server"></asp:TextBox><asp:RequiredFieldValidator ID="RequiredFieldValidator9" runat="server" 
                                ControlToValidate="txtNewID" ErrorMessage="*" ValidationGroup="TransSub"></asp:RequiredFieldValidator>&nbsp;<asp:Button ID="cmdTransfer"
                                                        runat="server" Text="Transfer" CausesValidation="true" ValidationGroup="TransSub" />&nbsp;<asp:LinkButton ID="lnkReturnTrans" runat="server" Text="Return"></asp:LinkButton></td>
                                            </tr>
                                            <tr>
                                                <td colspan="2"><asp:Label runat="server" ID="lblTransResult"></asp:Label></td>
                                            </tr>
                                        </table>
                                   </td>
                               </tr>
                               </asp:Panel>   
                                <asp:Panel ID="panelChangeType" CssClass="StandardPanel" runat="server"  style="width: 500px; margin: auto;">
                               <tr>
                                    <td><hr /></td>
                                </tr>
                                <tr>
                                    <td>
                                        <table>
                                            <tr>
                                                <td>New Product Code:</td>
                                                <td>
                                                    <asp:DropDownList ID="cboChangeCodes" runat="server">
                                                    </asp:DropDownList>
                                                    <asp:RequiredFieldValidator ID="RequiredFieldValidator8" runat="server" 
                                ControlToValidate="cboChangeCodes" ErrorMessage="*" ValidationGroup="ChangeSub" InitialValue="99"></asp:RequiredFieldValidator>
                                                    &nbsp;<asp:Button ID="cmdChange"
                                                        runat="server" Text="Change" CausesValidation="true" ValidationGroup="ChangeSub" /> &nbsp;<asp:LinkButton ID="lnkReturnChange" runat="server" Text="Return"></asp:LinkButton></td>
                                            </tr>
                                            <tr>
                                                <td colspan="2"><asp:Label runat="server" ID="lblChangeResult"></asp:Label></td>
                                            </tr>
                                        </table>
                                   </td>
                               </tr>
                               </asp:Panel>
                                <asp:Panel runat="server" CssClass="StandardPanel" ID="panelDelete">
                                 <tr>
                                    <td><hr /></td>
                                </tr>
                                <tr>
                                    <td>
                                        <table>
                                            <tr>
                                                <td><asp:Label ID="lblDelteSub" runat="server"></asp:Label></td>
                                            </tr>
                                            <tr>
                                                <td>&nbsp;</td>
                                            </tr>
                                            <tr>
                                                <td><asp:LinkButton runat="server" ID="lnkDeleteNew" Text="Click here to Delete" CausesValidation="false"> </asp:LinkButton>&nbsp;&nbsp;&nbsp;&nbsp;<asp:LinkButton runat="server" ID="lnkCancel" Text="Return"></asp:LinkButton>&nbsp;&nbsp;</td>
                                            </tr>
                                        </table>
                                    </td>
                                 </tr>
                               </asp:Panel>           
                            </table>
                        </td>
                    </tr>
                </table>
                </div>
           </div>
   
</div>


</div>