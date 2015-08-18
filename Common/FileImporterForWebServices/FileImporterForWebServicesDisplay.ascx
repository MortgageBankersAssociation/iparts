<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="FileImporterForWebServicesDisplay.ascx.cs" Inherits="Asi.Web.iParts.Common.FileImporterForWebServices.FileImporterForWebServicesDisplay" %>
<%@ Register TagPrefix="telerik" Namespace="Telerik.Web.UI" Assembly="Telerik.Web.UI" %>
<%@ Register TagPrefix="asiweb" Assembly="Asi.Web" Namespace="Asi.Web.UI.WebControls" %>
<%@ Register TagPrefix="uc1" TagName="FileUpload" Src="../../../AsiCommon/Controls/Shared/Utility/businessfileupload.ascx" %>


<asp:Panel ID="ContentPanel" runat="server" Visible="true"  >
    <asiweb:TitleBar ID="TitleBar" Text="<%#PageTitle%>" OptionsMenuBehavior="AlwaysDisplay" runat="server" />

<script type="text/javascript">

    document.onmousedown = clearMessages;

    function clearMessages() {
        var errorLabelId = "<%=ErrorLabel.ClientID %>";
        var infoLabelId = "<%=InfoLabel.ClientID %>";
        //alert('mousedown: errorid=' + errorLabelId + ' infoid=' + infoLabelId );
        var errorObj = document.getElementById(errorLabelId);
        if (errorObj != null && errorObj.innerHTML != '')
            errorObj.innerHTML = '';
        var infoObj = document.getElementById(infoLabelId);
        if (infoObj != null && infoObj.innerHTML != '')
            infoObj.innerHTML = '';
            
    }
</script>    


  <asiweb:StyledLabel ID="ErrorLabel" runat="server" CssClass="Error"></asiweb:StyledLabel>
  <asiweb:StyledLabel ID="InfoLabel" runat="server" CssClass="Info"></asiweb:StyledLabel>
  
  <asiweb:PanelTemplateControl ID="MainPanel" runat="server" Collapsible="false" FieldSet="true" ShowHeader="false"  BorderStyle="None">
    
      <asiweb:BusinessComboBox ID="FileTypesDropDown" runat="server" RenderPanelField="true" DisplayCaption="true" Required="true" >
      </asiweb:BusinessComboBox>
          
    <div class="PanelField">
      <label>&nbsp;</label>
      <uc1:FileUpload id="FileUpload1"  runat="server" DialogMode="true"  UploadDirectory="~\UploadedFiles"  OnFileUploaded="FileUpload1_FileUploaded"
      CreateUploadDirectory="true"   />
      
      <asp:TextBox runat="server" ID="fileFakeInput" Visible="false" Enabled="false" /> <asp:Button runat="server" ID="fileFakeButton1" Visible="false" Enabled="false" text="Browse..."/> <asp:Button runat="server" ID="fileFakeButton2" Visible="false" Enabled="false" text="Upload"/>
      
    </div>
  
  </asiweb:PanelTemplateControl>
</asp:Panel>       

