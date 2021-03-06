﻿<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="ProductDisplayListEdit.ascx.cs"
    Inherits="Asi.Web.iParts.Commerce.ProductDisplayList.ProductDisplayListEdit" %>

<script language="javascript" type="text/javascript">

    function BSABrowserCallback(window) {
        if (!window.result)
            return;
        document.getElementById(SelectedSourceKeyID).value = window.result;
        document.getElementById(SelectedSourcePathID).value = window.SelectedDocumentPath;
        document.getElementById(SourceSelectedTriggerID).click();
    }

    function OkClicked() {
        document.getElementById(OkClickedTriggerID).click();
    }

</script>

<input type="hidden" id="SelectedSourceKey" runat="server" name="SelectedSourceKey" />
<input type="hidden" id="SelectedSourcePath" runat="server" name="SelectedSourcePath" />
<div style="display: none">
    <asp:Button ID="SourceSelectedTrigger" runat="server" Text="" OnClick="SourceSelectedTrigger_Click" /></div>
<div style="display: none">
    <asp:Button ID="OkClickedTrigger" runat="server" Text="" OnClick="OkClickedTrigger_Click" /></div>
<asiweb:PanelTemplateControl ID="ContainerPanel" runat="server" FieldSet="true" ShowHeader="false"
    BorderStyle="None">
    <asiweb:SmartControl ID="PageTitle" runat="server" BoundPropertyName="PageTitle" DisplayCaption="true" />
    <div class="AutoWidth">
    
        <asiweb:SmartControl 
            ID="DoNotRenderInDesignMode" runat="server" 
            BoundPropertyName="DoNotRenderInDesignMode" DisplayCaption="true" 
            PositionCaption="Right" />
        <asiweb:SmartControl 
            ID="ShowBorderControl" runat="server" BoundPropertyName="ShowBorder" 
            DisplayCaption="true" PositionCaption="Right" />
            
                </div>    
            
    <asiweb:SmartControl ID="SourceFolderPathControl" runat="server" BoundPropertyName="SourcePathNotCommitted" DisplayCaption="true" ReadOnly="true" >      
        <div id="pathButtonBreak">
        <asiweb:StyledButton ID="SelectFolder" Text='<%#Asi.ResourceManager.GetWord("Select") %>' runat="server" AutoPostBack="false" 
                OnClientClick="OpenObjectBrowser('DocumentPath=$&iShowFolderTree=1&iAllowUpwardNavigation=1&iTypeFilter=IQD',BSABrowserCallback);" />
        <asiweb:StyledButton ID="ClearSourcePath" Text='<%#Asi.ResourceManager.GetWord("Clear") %>' CausesValidation="false" runat="server" AutoPostBack="true" 
            onclick="ClearSourcePath_Click" />
        </div>  
        <div class="PanelField Error"> 
             <asp:Label ID="LabelIQAError" runat="server" Visible="false"/>
        </div>  
    </asiweb:SmartControl>
        
        <asiweb:SmartControl 
            ID="ResultsPerPage" runat="server" 
            BoundPropertyName="ResultsPerPage" DisplayCaption="true" MinValue="1" MaxValue="1000" 
            PositionCaption="Left" />

        <div class="AutoWidth"><asiweb:SmartControl ID="DisplayPicture" runat="server" BoundPropertyName="DisplayPicture" DisplayCaption="true" PositionCaption="Right" />        </div>
        <asiweb:SmartControl ID="MaxPictureWidth" runat="server" BoundPropertyName="MaxPictureWidth" DisplayCaption="true" PositionCaption="Left" />
        <div class="AutoWidth"><asiweb:SmartControl ID="AllowPictureUpscale" runat="server" BoundPropertyName="AllowPictureUpscale" DisplayCaption="true" PositionCaption="Right" />        </div>
            
        <asiweb:SmartControl ID="NonMemberPriceLabel" runat="server" BoundPropertyName="NonMemberPriceLabel" DisplayCaption="true" PositionCaption="Left" />        
        
        <asiweb:SmartControl ID="MemberPriceLabel" runat="server" BoundPropertyName="MemberPriceLabel" DisplayCaption="true" PositionCaption="Left" />        
        
        <div class="AutoWidth"><asiweb:SmartControl ID="DisplayBothPricesToNonMembers" runat="server" BoundPropertyName="DisplayBothPricesToNonMembers" DisplayCaption="true" PositionCaption="Right" />  </div> 
        <asiweb:SmartControl ID="MemberPriceForNonMemberLabel" runat="server" BoundPropertyName="MemberPriceForNonMemberLabel" DisplayCaption="true" PositionCaption="Left" />        
        
        <div class="AutoWidth"><asiweb:SmartControl ID="DisplayBothPricesToMembers" runat="server" BoundPropertyName="DisplayBothPricesToMembers" DisplayCaption="true" PositionCaption="Right" /> </div> 
        <asiweb:SmartControl ID="NonMemberPriceForMemberLabel" runat="server" BoundPropertyName="NonMemberPriceForMemberLabel" DisplayCaption="true" PositionCaption="Left" /> 
            
        <div class="AutoWidth"><asiweb:SmartControl ID="DisplayDiscount" runat="server" BoundPropertyName="DisplayDiscount" DisplayCaption="true" PositionCaption="Right" /> </div> 
        <asiweb:SmartControl ID="DiscountLabel" runat="server" BoundPropertyName="DiscountLabel" DisplayCaption="true" PositionCaption="Left" /> 

        <div class="AutoWidth"><asiweb:SmartControl ID="DisplayAddToCart" runat="server" BoundPropertyName="DisplayAddToCart" DisplayCaption="true" PositionCaption="Right" /> </div> 

</asiweb:PanelTemplateControl>