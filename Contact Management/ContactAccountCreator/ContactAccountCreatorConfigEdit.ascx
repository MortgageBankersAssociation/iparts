<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="ContactAccountCreatorConfigEdit.ascx.cs"
    Inherits="Asi.Web.iParts.ContactManagement.ContactAccountCreator.ContactAccountCreatorConfigEdit" %>
<%@ Register TagPrefix="asiweb" Namespace="Asi.Web.UI.WebControls" %>
      
<asiweb:paneltemplatecontrol id="ContainerPanel" runat="server" fieldset="true" showheader="false"
    borderstyle="None">
    <div class="AutoWidth">       
        <asiweb:SmartControl
            ID="HideForAuthenticatedUsers" runat="server" 
            BoundPropertyName="HideForAuthenticatedUsers" DisplayCaption="true" 
            PositionCaption="Right" DataSaveUponStateChange="false" />
        <asiweb:SmartControl 
            ID="AccountTypeAllowed" runat="server" 
            BoundPropertyName="AccountTypeAllowed" DisplayCaption="true" 
            PositionCaption="Left" DataSaveUponStateChange="false" AutoPostBack="true" />
        <asiweb:SmartControl 
            ID="IncludePrefix" runat="server" 
            BoundPropertyName="IncludePrefix" DisplayCaption="true" 
            PositionCaption="Right" DataSaveUponStateChange="false" />
        <asiweb:SmartControl 
            ID="IncludeSuffix" runat="server" 
            BoundPropertyName="IncludeSuffix" DisplayCaption="true" 
            PositionCaption="Right" DataSaveUponStateChange="false" />
        <asiweb:SmartControl 
            ID="IncludePhone" runat="server" 
            BoundPropertyName="IncludePhone" DisplayCaption="true" 
            PositionCaption="Right" DataSaveUponStateChange="false" /> 
        <asiweb:SmartControl 
            ID="IncludeEmail" runat="server" 
            BoundPropertyName="IncludeEmail" DisplayCaption="true" 
            PositionCaption="Right" DataSaveUponStateChange="false" /> 
        <asiweb:SmartControl 
            ID="RequireAddress" runat="server" 
            BoundPropertyName="RequireAddress" DisplayCaption="true" 
            PositionCaption="Right" DataSaveUponStateChange="false" AutoPostBack="true" />
        <div style="padding-left:20px;">                  
            <asiweb:SmartControl 
                ID="MultipleAddressLines" runat="server" 
                BoundPropertyName="MultipleAddressLines" DisplayCaption="true" 
                PositionCaption="Right" DataSaveUponStateChange="false" />      
            <asiweb:SmartControl 
                ID="SingleTextAddress" runat="server" 
                BoundPropertyName="SingleTextAddress" DisplayCaption="true" 
                PositionCaption="Right" DataSaveUponStateChange="false" />                   
            <asiweb:SmartControl 
                ID="CreateAddressPurpose" runat="server" 
                BoundPropertyName="CreateAddressPurpose" DisplayCaption="true" 
                PositionCaption="Left" DataSaveUponStateChange="false" />
        </div> 
    </div>        
    <div class="AutoWidth">
        <asiweb:SmartControl 
            ID="IncludeLogOnLink" runat="server" 
            BoundPropertyName="IncludeLogOnLink" DisplayCaption="true" 
            PositionCaption="Right" DataSaveUponStateChange="false" />        
        <asiweb:SmartControl 
            ID="IncludeOptionToCreateLogon" runat="server" 
            BoundPropertyName="IncludeOptionToCreateLogon" DisplayCaption="true" 
            PositionCaption="Right" DataSaveUponStateChange="false" AutoPostBack="true" />
        <div style="padding-left:20px;">
            <asiweb:SmartControl 
                ID="RequireUserToCreateLogon" runat="server" 
                BoundPropertyName="RequireUserToCreateLogon" DisplayCaption="true" 
                PositionCaption="Right" DataSaveUponStateChange="false" />
            <asiweb:SmartControl 
                ID="UseEmailAsLogon" runat="server" 
                BoundPropertyName="UseEmailAsLogon" DisplayCaption="true" 
                PositionCaption="Right" DataSaveUponStateChange="false"  />
        </div>    
   </div>
    <asiweb:SmartControl ID="UrlRedirect" runat="server" visible="false" BoundPropertyName="UrlRedirect" 
    DisplayCaption="true" DataSaveUponStateChange="false" />

   <asiweb:SmartControl 
        ID="CommitSequenceControl" runat="server"
        BoundPropertyName="CommitSequence" DisplayCaption="true"
        PositionCaption="Left" DataSaveUponStateChange="false" MinValue="0" />
<script type="text/javascript">
    //<![CDATA[
    var cb = $get("<%#RequireAddress.ClientID%>_CheckBoxSet");
    var label = $get("<%#CreateAddressPurpose.ClientID%>_Caption");
    if (label != null && cb != null) {
        if (cb.checked == true)
            label.className = "Required";
        else
            label.className = null;
    }

    var select = $get("<%#CreateAddressPurpose.ClientID%>_DropDownList");
    if (select != null)
        select.remove(0);   
    //]]>
</script>            
            
 </asiweb:paneltemplatecontrol>
