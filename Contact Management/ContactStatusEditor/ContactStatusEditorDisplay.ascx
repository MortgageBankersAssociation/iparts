<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="ContactStatusEditorDisplay.ascx.cs" Inherits="Asi.Web.iParts.ContactManagement.ContactStatusEditor.ContactStatusEditorDisplay" %>
<%@ Register TagPrefix="telerik" Namespace="Telerik.Web.UI" Assembly="Telerik.Web.UI" %>
<%@ Register TagPrefix="asiweb" Assembly="Asi.Web" Namespace="Asi.Web.UI.WebControls" %>

<script type="text/javascript">
    //<![CDATA[        
      
    function HideTooltip()
    {
       var tooltip = Telerik.Web.UI.RadToolTip.getCurrent();
       if (tooltip) tooltip.hide();
    }
    
    // This Function is used with Caption control for the menuclick event - We need to make sure that name is UNIQUE within a page.
    function <asp:Literal ID="JSFuncPrefix" runat="server"></asp:Literal>OnClientMenuClick(MenuText, MenuValue){
        // Hide show the correct part of the panel
        if(MenuValue != null && MenuValue == 1)
            var tooltip = $find("<asp:Literal ID='hiddenHelper1' runat='server'></asp:Literal>");
              
        if (tooltip!=null) tooltip.show();
        return false;
    }
    //]]>        
</script>

<asp:Panel ID="ContentPanel" runat="server" Visible="true">

    <telerik:RadAjaxLoadingPanel runat="server" ID="LoadingPanel" Transparency="50" IsSticky="false" 
        BackColor="LightGray" BackgroundPosition="Center" >
    </telerik:RadAjaxLoadingPanel>
    
    <telerik:RadAjaxManager ID="RadAjaxManager1" runat="server" EnableAJAX="true" UpdatePanelsRenderMode="Inline"> 
        <AjaxSettings> 
            <telerik:AjaxSetting AjaxControlID="save"> 
                <UpdatedControls> 
                    <telerik:AjaxUpdatedControl ControlID="RadAjaxPanel1" />            
                </UpdatedControls> 
            </telerik:AjaxSetting> 
        </AjaxSettings> 
    </telerik:RadAjaxManager>   


    <asiweb:TitleBar ID="TitleBar" Text="<%#PageTitle%>" OptionsMenuBehavior="AlwaysDisplay" runat="server" TitleBarClickBehavior="SelectOnlyMenuItem" />

    <telerik:RadAjaxPanel ID="RadAjaxPanel1" LoadingPanelID="loadingPanel" runat="server" >
    
        <asp:Button runat="server" id="RefreshTrigger" OnClick="RefreshTriggerClick" style="display:none" Text=""></asp:Button>

        <asiweb:BusinessLabel ID="LabelStatus" runat="server" />

    </telerik:RadAjaxPanel>  
        
    <telerik:RadToolTip runat="server" ID="toolTip1" 
            TargetControlID="TitleBar" Animation="None" ShowEvent="FromCode" 
            ShowDelay="0" ShowCallout="false" Position="BottomCenter" OffsetX="-13" Modal="true"   
            HideEvent="ManualClose" RelativeTo="Mouse" RenderInPageRoot="true" >
                 
            <asp:UpdatePanel runat="server" ID="updatePanel1">

            <ContentTemplate>
                                
                <table class="Form">
                <tbody>
                
                    <tr>
                        <td colspan="2" align="left">        
                            <asp:Label id="LabelErrorMessage" runat="server" visible="false" cssclass="Error" />
                        </td>
                    </tr>
                               
                    <tr>
                        <td><asiweb:BusinessLabel id="LabelStatusPrompt" runat="server" /></td>
                        <td><asiweb:BusinessDropDownList runat="server" ID="SelectStatus" Style="float: none;" TabIndex="1" ShowNullItem="false" /></td>                                                                
                    </tr>                       
                    <tr>
                        <td colspan="2" align="right">   
                            <asp:Button id="save" Text="Save & Close" runat="server" OnClick="ChangePartyStatusClick" CssClass="PrimaryButton" TabIndex="2" />
                            &nbsp;<asp:Button id="cancel" runat="server" CssClass="Cancel" Text="Cancel" CausesValidation="false" OnClientClick="HideTooltip(); return true;" TabIndex="3" />                  
                        </td>
                    </tr>                   
                   
                </tbody>
                </table>
                 
            </ContentTemplate>
            
        </asp:UpdatePanel>
              
    </telerik:RadToolTip>    
       
</asp:Panel>
