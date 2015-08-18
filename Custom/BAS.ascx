<%@ Control Language="vb" AutoEventWireup="false" CodeBehind="BAS.ascx.vb" Inherits="MBA_vbParts.BAS" %>
<style type="text/css">
    .style1
    {
        font-weight: bold;
    }
</style>
<script language="javascript" type="text/javascript">
    function toggelLabel(elementID, type){
    
        var element = document.getElementById(elementID);
       // alert(element.style.display);
        if (type == 1)
        {
            element.style.visibility = 'visible';
            element.style.display = 'block';
           
        }
        else
        {
 
            element.style.visibility = 'hidden';
            element.style.display == 'none';
        }
    }
     
</script>
<div class="iMIS-WebPart">
    <asp:Panel ID="panelEditor" runat="server" CssClass="StandardPanel" style="width: 500px; margin: auto;">
    
    <div class="WebPartZone ">
        <div class="style1" style="min-height: 20px; zoom: 1 !important; padding: 0px; margin: 0px;">
            <div class="PanelHead Distinguish">
                <span class="PanelTitle">Builder's Application Survey</span>
            </div>
            <div class="PanelBody">
                <asp:Panel ID="panelMain" runat="server">
                <table class="Form">
                    <tr>
                        <td class="PanelTablePrompt" colspan="3">
                            <span lang="en-us">1) </span>What are the <span lang="en-us">average rates for 
                            60 day locks that were offered last month</span>?</td>
                    </tr>
                    <tr>
                        <td colspan="3"></td>
                    </tr>
                    <tr>
                        <td ><b>Conventional Loans</b></td>
                        <td><b><span lang="en-us">Avg. </span>Contract Rate</b></td>
                        <td><b><span lang="en-us">Avg. </span>Total Point<span lang="en-us">s</span><br />(including Orig. Fee)</b></td>
                    </tr>
                    <tr>
                        <td class="PanelTablePrompt">30-year, 80% LTV, FRM:</td>
                        <td class="PanelTableValue">
                           <asp:TextBox ID="txt30yrLoan" runat="server" Width="115px"></asp:TextBox>
                        </td>
                         <td class="PanelTableValue">
                            <asp:TextBox ID="txt30yrPoint" runat="server" Width="115px"></asp:TextBox>
                        </td>
                    </tr>
                     <tr>
                        <td class="PanelTablePrompt">15-year, 80% LTV, FRM:</td>
                        <td class="PanelTableValue">
                           <asp:TextBox ID="txt15yrLoan" runat="server" Width="115px"></asp:TextBox>
                        </td>
                         <td class="PanelTableValue">
                            <asp:TextBox ID="txt15yrPoint" runat="server" Width="115px"></asp:TextBox>
                        </td>
                    </tr>
                     <tr>
                        <td class="PanelTablePrompt">30-year Jumbo, 80% LTV:</td>
                        <td class="PanelTableValue">
                           <asp:TextBox ID="txtJumboLoan" runat="server" Width="115px"></asp:TextBox>
                        </td>
                         <td class="PanelTableValue">
                            <asp:TextBox ID="txtJumboPoint" runat="server" Width="115px"></asp:TextBox>
                        </td>
                    </tr>
                    <tr>
                        <td class="PanelTablePrompt">5/1 ARM, 80% LTV:</td>
                        <td class="PanelTableValue">
                           <asp:TextBox ID="txt5yrLoan" runat="server" Width="115px"></asp:TextBox>
                        </td>
                         <td class="PanelTableValue">
                            <asp:TextBox ID="txt5yrPoint" runat="server" Width="115px"></asp:TextBox>
                        </td>
                    </tr>
                    
                     <tr>
                        <td class="PanelTablePrompt">FHA 203(b) Loans:</td>
                        <td class="PanelTableValue">
                           <asp:TextBox ID="txtFHALoan" runat="server" Width="115px"></asp:TextBox>
                        </td>
                         <td class="PanelTableValue">
                            <asp:TextBox ID="txtFHAPoint" runat="server" Width="115px"></asp:TextBox>
                        </td>
                    </tr>
                    <tr>
                        <td colspan="3">&nbsp;</td>
                    </tr>
                    <tr>
                        <td class="PanelTablePrompt">
                            <asp:LinkButton ID="lnkShow1" runat="server">%Cash Share of Sales:</asp:LinkButton>
                        </td>
                        <td class="PanelTableValue">
                            <asp:TextBox ID="txtShares" runat="server" Width="115px"></asp:TextBox>
                        </td>
                        <td class="PanelTableValue">&nbsp;</td>
                    </tr>
                    <tr>
                        <td class="PanelTablePrompt" colspan="3">
                            <asp:Label ID="lblShow1" runat="server" 
                                Text="* Total # of Cash Buyers / Total # of Sales" style="display: none;"></asp:Label>
                        </td>
                    </tr>
                    <tr>
                        <td class="PanelTablePrompt">
                            <asp:LinkButton ID="lnkShow2" runat="server">%Backlog Capture Ratio:</asp:LinkButton>
                        </td>
                        <td class="PanelTableValue">
                            <asp:TextBox ID="txtBacklog" runat="server" Width="115px"></asp:TextBox>
                        </td>
                        <td class="PanelTableValue">&nbsp;</td>
                    </tr>
                    <tr>
                        <td class="PanelTablePrompt" colspan="3">
                            <asp:Label ID="lblShow2" runat="server" 
                                Text="* Total # of Loan Applications / (Total # of Sales - Total # of Cash Buyers)" style="display: none;"></asp:Label>
                        </td>
                    </tr>
                    <tr>
                        <td colspan="3">&nbsp;</td>
                    </tr>
                    <tr>
           
                        <td class="PanelTablePrompt" colspan="3">
                            2. Please attached and submit your application-level activity file from last
                            <span lang="en-us">month</span>.<span lang="en-us"> </span><b>To view </b>
                            <span class="style1" lang="en-us">an example of the Builder Application File 
                            layout</span><b>&nbsp; <a href="http://mymba2.mortgagebankers.org/docs/Builder_Mtg_Apps_Layout_2012.pdf" target="_blank">click here</a>. </b>
                        </td>
                    </tr>
                    <tr>
                        <td colspan="3"></td>
                    </tr>
                     <tr>
                        <td colspan="3">
                            <asp:FileUpload ID="FileUpload1" runat="server" Width="454px" />
                        </td>
                    </tr>
                     <tr>
                        <td colspan="3"></td>
                    </tr>
                     <tr>
                        <td colspan="3">
                            <asp:Button ID="cmdUpdate" runat="server" Text="Add" Width="77px" />  <asp:Button ID="cmdCancelAdd" runat="server" CausesValidation="False" 
                                Text="Cancel" Width="74px" /><br />
                                <asp:Label ID="lblError" runat="server" Font-Bold="True" 
                                ForeColor="#FF3300"></asp:Label>
                         </td>
                    </tr>
                </table>
                </asp:Panel>
                <asp:Panel ID="panelFinish" runat="server">
                    <table>
                        <tr>
                            <td><asp:Label ID="lblResult" runat="server"></asp:Label></td>
                        </tr>
                        <tr>
                            <td>
                                <asp:Button ID="cmdCancel" runat="server" Text="Back" />
                            </td>
                        </tr>
                    </table>
                </asp:Panel>
                <asp:Panel ID="panelAccess" runat="server">
                    <table>
                        <tr>
                            <td>You do not have permission to access this area.</td>
                        </tr>
                    </table>
                </asp:Panel>
            </div>
        </div>
        </div>
    </div>
    </asp:Panel>
</asp:Panel>