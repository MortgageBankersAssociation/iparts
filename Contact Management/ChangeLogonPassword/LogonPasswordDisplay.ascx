<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="LogonPasswordDisplay.ascx.cs" Inherits="Asi.Web.iParts.ContactManagement.ChangeLogonPassword.LogonPasswordDisplay" %>
<%@ Register TagPrefix="asiweb" Assembly="Asi.Web" Namespace="Asi.Web.UI.WebControls" %>
<%@ Register TagPrefix="telerik" namespace="Telerik.Web.UI" assembly="Telerik.Web.UI" %>

<asp:panel ID="ContentPanel" runat="server" Enabled="true" Visible="true">

    <script type="text/javascript">
        //<![CDATA[
        var sActionControl="<asp:Literal ID='hiddenHelper1' runat='server'></asp:Literal>";
                       
        function HideTooltip(a)
        {
            var tooltip = Telerik.Web.UI.RadToolTip.getCurrent();
            if (tooltip) 
                tooltip.hide();                        
        }
           
        // This Function is used with Caption control for the menu click event - We need to make sure that name is UNIQUE within a page.
        function <asp:Literal ID="JSFuncPrefix" runat="server"></asp:Literal>OnClientMenuClick(MenuText, MenuValue){
            // Hide show the correct part of the panel
            if(MenuValue != null && MenuValue == 1)
                var tooltip = $find("<asp:Literal ID='hiddenHelper3' runat='server'></asp:Literal>");
            else
                var tooltip = $find("<asp:Literal ID='hiddenHelper4' runat='server'></asp:Literal>");
               
            if (tooltip!=null) tooltip.show();
            return false;
        }
       
        function <%#ClientID%>_ClientHide()
        { 
            ResetToolTipMessages();
        }
                  
        function ResetToolTipMessages()
        {                          
            // Declare an empty string
            var emptyString = new String();
        
            // Clean up any previous values or messages when the tooltip is closed 
            var errorChangeLogon = $get("<%#errorChangeLogon.ClientID%>");
            if (errorChangeLogon != null)
                errorChangeLogon.style.display = 'none';   
            
            var messageChangeLogon = $get("<%#messageChangeLogon.ClientID%>");
            if(messageChangeLogon != null)
                messageChangeLogon.style.display = 'none';  

            var errorChangePassword = $get("<%#errorChangePassword.ClientID%>");
            if(errorChangePassword != null)
                errorChangePassword.style.display = 'none';   
            
            var messageChangePassword = $get("<%#messageChangePassword.ClientID%>");
            if(messageChangePassword != null)
                messageChangePassword.style.display = 'none';  

            var passwordsMatchValidator = $get("<%#passwordsMatchValidator.ClientID%>");
            if(passwordsMatchValidator != null)
                passwordsMatchValidator.style.display = 'none';  
 
            var currentPasswordValidator = $get("<%#currentPasswordValidator.ClientID%>");
            if(currentPasswordValidator != null)
                currentPasswordValidator.style.display = 'none';              
                              
            var newLogon = $get("<%#newLogon.ClientID%>");
            if(newLogon != null)
                newLogon.value = emptyString;
            
            var newPassword = $get("<%#newPassword.ClientID%>");
            if(newPassword != null)
                newPassword.value = emptyString;
                           
            var confirmNewPassword = $get("<%#confirmNewPassword.ClientID%>");
            if(confirmNewPassword != null)
                confirmNewPassword.value = emptyString; 
                              
            var currentPassword = $get("<%#currentPassword.ClientID%>");
            if(currentPassword != null)
                currentPassword.value = emptyString; 
        }       
        //]]>        
    </script>

    <telerik:RadAjaxLoadingPanel runat="server" ID="LoadingPanel" Transparency="50" IsSticky="false" 
        BackColor="LightGray" BackgroundPosition="Center" >
    </telerik:RadAjaxLoadingPanel>

     <telerik:RadAjaxManager ID="RadAjaxManager1" runat="server" UpdatePanelsRenderMode="Inline" EnableAJAX="true"> 
        <AjaxSettings> 
            <telerik:AjaxSetting AjaxControlID="save"> 
                <UpdatedControls> 
                    <telerik:AjaxUpdatedControl ControlID="RadAjaxPanel1" />                         
                </UpdatedControls>           
            </telerik:AjaxSetting> 
        </AjaxSettings> 
    </telerik:RadAjaxManager>  

    <asiweb:TitleBar ID="pageCaption" runat="server" CssClass="TitleBarCaption" TitleBarClickBehavior="SelectOnlyMenuItem" OptionsMenuBehavior="AlwaysDisplay" />

    <telerik:RadAjaxPanel id="RadAjaxPanel1" runat="server" LoadingPanelID="loadingPanel" Visible="false">
    
        <asiweb:BusinessLabel id="LabelLogon" runat="server" Visible="false" />
    
        <asiweb:BusinessLabel id="error" runat="server" Visible="false" CssClass="Important" />
     
    </telerik:RadAjaxPanel>

    <telerik:RadToolTip runat="server" ID="toolTip1" 
            TargetControlID="pageCaption" Animation="None" ShowEvent="FromCode" 
            ShowDelay="0" ShowCallout="false" Position="BottomLeft" OffsetX="-13" Modal="true"   
            HideEvent="ManualClose" RelativeTo="Mouse" RenderInPageRoot="true">
             
            <asp:UpdatePanel runat="server" ID="updatePanel1">

            <ContentTemplate>
                            
                <table class="Form">
                <tbody>
                           
                    <tr><td colspan="2">
                                                                
                        <asiweb:BusinessLabel id="errorChangeLogon" runat="server" Visible="false" CssClass="Important" />
                        <asiweb:BusinessLabel id="messageChangeLogon" runat="server" Visible="false" CssClass="Information" />                     
                        <asiweb:BusinessLabel id="errorChangePassword" runat="server" Visible="false" CssClass="Important" />
                        <asiweb:BusinessLabel id="messageChangePassword" runat="server" Visible="false" CssClass="Information" /> 
                        <br/>
                        <asiweb:BusinessLabel id="changeSecurityMessageLabel" runat="server" Visible="false" />
                                 
                    </td></tr>
                    <tr><td colspan="2"></td></tr>
                
                    <tr>
                        <th>
                            <asiweb:BusinessLabel id="currentLogonCaption" runat="server" />
                        </th>
                        <td>                       
                            <asiweb:BusinessLabel id="currentLogon" runat="server" />
                        </td>
                    </tr>

                    <asp:Panel ID="editLogonPanel" runat="server" Enabled="false" Visible="false">

                        <tr>
                            <th>
                                <asiweb:BusinessLabel id="newLogonCaption" runat="server" />
                            </th>
                            <td>   
                                <asiweb:BusinessTextBox id="newLogon" runat="server" TabIndex="1" />
                            </td>
                        </tr>
                        <tr><td colspan="2">&nbsp;</td></tr>
                    
                    </asp:Panel>
                
                    <asp:Panel ID="editPasswordPanel" runat="server" Enabled="false" Visible="false">

                        <tr>
                            <th>
                                <asiweb:BusinessLabel id="newPasswordCaption" runat="server" />
                            </th>
                            <td>       
                                <asiweb:BusinessTextBox id="newPassword" runat="server" TextMode="Password" ValidationGroup="LogonPasswordDisplay" TabIndex="2" />
                            </td>
                        </tr>
                        <tr>
                            <th>
                                <asiweb:BusinessLabel id="confirmNewPasswordCaption" runat="server" />
                            </th>
                            <td>        
                                <asiweb:BusinessTextBox id="confirmNewPassword" runat="server" TextMode="Password" TabIndex="3"></asiweb:BusinessTextBox>                                
                                <asp:CompareValidator ID="passwordsMatchValidator" runat="server" EnableClientScript="true" ControlToValidate="confirmNewPassword" Display="Dynamic" ControlToCompare="newPassword" Type="String" Operator="Equal" CssClass="Important" ErrorMessage="Passwords must match"></asp:CompareValidator>                      
                            </td>
                        </tr>
                        <tr><td colspan="2">&nbsp;</td></tr>
  
                    </asp:Panel>
                
                    <tr><td colspan="2"><asiweb:BusinessLabel runat="server" id="pleaseEnterPassword" /></td></tr>
 
                     <tr>
                        <th>
                            <asiweb:BusinessLabel id="currentPasswordCaption" runat="server" CssClass="Required" />
                        </th>
                        <td>       
                            <asiweb:BusinessTextBox id="currentPassword" runat="server" TextMode="Password" ValidationGroup="LogonPasswordDisplay" TabIndex="4" />
                            <asiweb:AsiRequiredFieldValidator id="currentPasswordValidator" CssClass="Important" runat="server" ValidationGroup="LogonPasswordDisplay" Display="Dynamic" ErrorMessage="required" ControlToValidate="currentPassword" />                
                        </td>
                    </tr>
                            
                    <tr>
                        <td colspan="2" align="right">   
                            <asiweb:StyledButton id="save" Text="Save" runat="server" OnClick="ChangeSecurity_Click" CssClass="PrimaryButton" TabIndex="5" ValidationGroup="LogonPasswordDisplay" />
                            &nbsp;<asiweb:StyledButton id="cancel" runat="server" OnClick="Cancel_Click" CssClass="Cancel" Text="Cancel" CausesValidation="false" OnClientClick="HideTooltip(); return true;" />                  
                        </td>
                    </tr>                   
               
                </tbody>
                </table>

            </ContentTemplate>
        
        </asp:UpdatePanel>
    
    </telerik:RadToolTip>

</asp:panel>