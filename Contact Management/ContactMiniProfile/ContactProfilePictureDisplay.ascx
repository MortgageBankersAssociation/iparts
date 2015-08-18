<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="ContactProfilePictureDisplay.ascx.cs" Inherits="Asi.Web.iParts.ContactManagement.ContactMiniProfile.ContactProfilePictureDisplay" %>
<%@ Import Namespace="Asi" %>
<%@ Register TagPrefix="asiwc" Assembly="Asi.Web" Namespace="Asi.Web.UI.WebControls" %>
<%@ Register TagPrefix="asiweb" Namespace="Asi.Web.UI.WebControls" Assembly="Asi.Web" %>
<%@ Register tagPrefix="telerik" namespace="Telerik.Web.UI" assembly="Telerik.Web.UI" %>


<asp:Panel ID="panContent" runat="server" HorizontalAlign="Center" Visible="false">

    <telerik:RadCodeBlock ID="RadCodeBlock1" runat="server">

        <script type="text/javascript">
            //<![CDATA[
            var sActionControl="<asp:Literal ID='ltHiddenHelper1' runat='server'></asp:Literal>";         
            function HideTooltip(){ 
        
                <%#ClientID%>_ResetFields(); 
              
                var tooltip = Telerik.Web.UI.RadToolTip.getCurrent();
                if (tooltip) 
                    tooltip.hide();

            }
                    
            // This function is used with Caption control for the MenuClick event - We need to make sure that name is UNIQUE within a page.
            function <asp:Literal ID="ltJSFuncPrefix" runat="server"></asp:Literal>OnClientMenuClick(MenuText, MenuValue){     
                     
                // Hide show the correct part of the panel
                if(MenuValue != null && MenuValue == 1)
                    var tooltip = $find("<asp:Literal ID='ltHiddenHelper3' runat='server'></asp:Literal>");  
                else
                    var tooltip = $find("<asp:Literal ID='ltHiddenHelper4' runat='server'></asp:Literal>");
                       
                if (tooltip!=null) tooltip.show();
                    return false;
                       
            }
        
            function <%#ClientID%>_ResetFields()
            { 
                // Remove the error message
                $telerik.$(".UploadInvalid").html("");
      
                // Reset the remove checkbox
                var chkBox = $get("<%#checkBoxDeleteImage.ClientID%>");
                var chkBoxLabel = $get("<%#labelDeleteImage.ClientID%>"); 
                chkBox.checked = false;
                chkBoxLabel.disabled = false;
            
                // Disable Save & Cancel button
                var submit = $get("<%#submit.ClientID%>");
                submit.disabled = true;
            
                // Enable the upload
                var upload = $get("<%#AsyncUpload1.ClientID%>");
                upload.disabled = false; 
                
				if(typeof(<%#ClientID%>_jsmanager) != 'undefined')
				{
					<%#ClientID%>_jsmanager.ResetConfig();
				}
            }        
        
            function <%#ClientID%>_ClientHide()
            { 
            
                $telerik.$(".UploadInvalid").html("");
      
                // Reset the remove checkbox
                var chkBox = $get("<%#checkBoxDeleteImage.ClientID%>");
                var chkBoxLabel = $get("<%#labelDeleteImage.ClientID%>"); 
                chkBox.checked = false;
                chkBoxLabel.checked = false;
            
                // Disable Save & Cancel button
                var submit = $get("<%#submit.ClientID%>");
                submit.disabled = true;
            
                // Enable the upload
                var upload = $get("<%#AsyncUpload1.ClientID%>");
                upload.disabled = false;
                   
            }    
         
            function <%#ClientID%>_clientFileUploading(sender, args) {

                $telerik.$(".UploadInvalid").html("");
                      
                var submit = $get("<%#submit.ClientID%>");
                submit.disabled = false;
            
                var chkBox = $get("<%#checkBoxDeleteImage.ClientID%>");
                var chkBoxLabel = $get("<%#labelDeleteImage.ClientID%>"); 
                chkBox.checked = false;
                chkBox.disabled = true; 
                chkBoxLabel.disabled = true;           
                            
            }
        
            function <%#ClientID%>_clientValidationFailed(sender, args) {
        
                $telerik.$(".UploadInvalid").html("Invalid file format or file exceeds maximum size</br>");
            
                var submit = $get("<%#submit.ClientID%>");
                submit.disabled = true;
            
                var chkBox = $get("<%#checkBoxDeleteImage.ClientID%>"); 
                var chkBoxLabel = $get("<%#labelDeleteImage.ClientID%>");
                chkBox.checked = false;
                chkBox.disabled = true;
                chkBoxLabel.disabled = true;
            
            } 
        
            function <%#ClientID%>_clientClearing(sender, args) {
        
                var submit = $get("<%#submit.ClientID%>");
                submit.disabled = true; 
                         
            } 
        
            function <%#ClientID%>_clientFileUploadRemoving(sender, args) {
            
                // Clean up the input field so that a blind save does not happen
                $telerik.$(".UploadInvalid").html("");
          
                // Disable the Save & Close button and checkbox when the field are cleared
                var submit = $get("<%#submit.ClientID%>");         
                var chkBox = $get("<%#checkBoxDeleteImage.ClientID%>");
                var chkBoxLabel = $get("<%#labelDeleteImage.ClientID%>");
            
                submit.disabled = true;
                                  
                var image = $get("<%#profileImage.ClientID%>");
                if (image != undefined && image.nameProp != undefined) {
                    if (image.nameProp != "default_profile.png"){
                        chkBox.checked = false;
                        chkBox.disabled = false;
                        chkBoxLabel.disabled = false;                 
                    }
                }
            
                var imagePre = $get("<%#profileImagePreview.ClientID%>");
                if (imagePre != undefined && imagePre.nameProp != undefined) {
                    if (imagePre.nameProp != "default_profile.png"){
                        chkBox.checked = false;
                        chkBox.disabled = false;
                        chkBoxLabel.disabled = false;                 
                    }
                }                                  
            } 
        
            function <%#ClientID%>_clientShow(sender, args) {
                // Disable the Save & Close button when the tooltip is shown
                var submit = $get("<%#submit.ClientID%>");
                var chkBox = $get("<%#checkBoxDeleteImage.ClientID%>");
                var chkBoxLabel = $get("<%#labelDeleteImage.ClientID%>");
                //submit.disabled = true; 
                sender.updateClientState();
            
                var image = $get("<%#profileImage.ClientID%>");
                if (image != null) {
                    if (image.nameProp == "default_profile.png"){
                        chkBox.checked = false;
                        chkBox.disabled = true;
                        chkBoxLabel.disabled = true;                 
                    }
                }
            
                var imagePre = $get("<%#profileImagePreview.ClientID%>");
                if (imagePre != null) {
                    if (imagePre.nameProp == "default_profile.png"){
                        chkBox.checked = false;
                        chkBox.disabled = true;
                        chkBoxLabel.disabled = true;                 
                    }
                }             
            
                if (chkBox.disabled) {
                    chkBoxLabel.disabled = true;                    
                }
                                                  
            } 
        
            function <%#ClientID%>_updateSubmitState() {
        
                // Enable/Disable the Save & Cancel button and input field 
                // when the "Remove profile picture" checkbox is changed
                var submit = $get("<%#submit.ClientID%>");
                var chkBox = $get("<%#checkBoxDeleteImage.ClientID%>");
                var upload = $get("<%#AsyncUpload1.ClientID%>"); 

                if (chkBox.checked ){
                    submit.disabled = false; 
                    upload.disabled = true;
                }
                else {
                   // don't disable the save button once enabled submit.disabled = true; 
                    upload.disabled = false;
                } 
                                               
            }               
              
            //]]>   
        </script>
    
    </telerik:RadCodeBlock>   

        <telerik:RadAjaxLoadingPanel runat="server" ID="loadingPanel" Transparency="50" IsSticky="false" 
            BackColor="LightGray" BackgroundPosition="Center" >
        </telerik:RadAjaxLoadingPanel>
    
        <telerik:RadAjaxManager ID="RadAjaxManager1" runat="server" EnableAJAX="true" UpdatePanelsRenderMode="Inline"> 
            <AjaxSettings> 
                <telerik:AjaxSetting AjaxControlID="submit"> 
                    <UpdatedControls> 
                        <telerik:AjaxUpdatedControl ControlID="RadAjaxPanel1" />            
                    </UpdatedControls> 
                </telerik:AjaxSetting>                                                     
            </AjaxSettings>         
        </telerik:RadAjaxManager> 
    
    <asiweb:BusinessLabel id="designMode" runat="server" Visible="false" CssClass="Information" />
    
    <telerik:RadAjaxPanel id="RadAjaxPanel1" LoadingPanelID="loadingPanel" runat="server">
    
        <asiweb:BusinessLabel id="errorText" runat="server" CssClass="Error" />                                      
        <asp:Image runat="server" id="profileImage" BorderWidth="0" ImageAlign="Middle" Visible="false"  />
		<img id="facebookPicLarge"  alt="facebook picture" runat="server"  />
		<asp:HiddenField ID="FacebookIDHiddenField" runat="server" />

        <telerik:RadBinaryImage runat="server" ResizeMode="Fit" id="profileImagePreview" BorderWidth="0px" ImageAlign="Middle" Visible="false" /> 
                  
    </telerik:RadAjaxPanel> 
                           
    <telerik:RadToolTip runat="server" id="toolTip1" Position="BottomLeft" OffsetX="-13" Modal="true"  
        Animation="None" ShowEvent="FromCode" 
        ShowDelay="0" ShowCallout="false"     
        HideEvent="ManualClose" RelativeTo="Mouse" Visible="false" Enabled="false"> 

        <asp:UpdatePanel ID="panMain" runat="server" UpdateMode="Always">
        
            <ContentTemplate>
                                     
                <fieldset style="padding-left:3px;padding-right:3px;margin-top:8px;">
					<div class="PanelField Left AutoWidth FloatNone" style="margin-bottom:0.75em;">
						<asp:RadioButtonList ID="UseFacebookRadios" runat="server" RepeatDirection="Horizontal" RepeatLayout="Flow"   >
							<asp:ListItem Value="facebook"></asp:ListItem>
							<asp:ListItem Value="imis"></asp:ListItem>
						</asp:RadioButtonList>
					</div>
					
					<div runat="server" id="FacebookPicturePanel"  >
					<p>
						<img id="facebookPic"  alt="facebook picture" runat="server" style="display: none;" />
						<div id="facebookConnectBtn" style="display: none;">
							<a class="fb_button fb_button_medium" >
								<span class="fb_button_text">Connect to Facebook</span>
							</a>
						</div>
						<div id="facebookLogOutDiv" style="display: none;">
							<span >Not you?</span>
							<br/>
							<a class="fb_button fb_button_medium">
								<span class="fb_button_text">Disconnect from Facebook</span>
							</a>
						</div>
					</p>
					 <br />
					 </div>

					<div runat="server" id="iMISPicturePanel" >
					         
						<telerik:RadAsyncUpload runat="server" id="AsyncUpload1" 
							MaxFileInputsCount="1" 
							OnFileUploaded="AsyncUpload1_FileUploaded" 
							OverwriteExistingFiles="true"
							ControlObjectsVisibility="none"
							MultipleFileSelection="Disabled"
                            DisablePlugins="true" /> 
               
						<span class="UploadInvalid"></span> 
						<p>
						<asp:CheckBox runat="server" ID="checkBoxDeleteImage" /> <asp:Label ID="labelDeleteImage" runat="server">Delete current profile picture</asp:Label></p>                      
						<br />    
						<p><asiweb:BusinessLabel runat="server" id="allowedTypes" /></p>
						<p><asiweb:BusinessLabel runat="server" id="fileSizeLimit" /></p> 
						<br />
                    </div>
                    <div style="float:right;">
                        <asp:Button id="submit" Text="Save &amp; Close" runat="server" OnClick="SubmitClick" CssClass="PrimaryButton" />
                        <asp:Button id="cancel" runat="server" Text="Cancel" OnClientClick="HideTooltip(); return false;" CausesValidation="false" />   
                    </div>        
             
                    <asiweb:BusinessLabel ID="altText" runat="server" Visible="false" />
                    <asiweb:BusinessTextBox ID="altTextDescription" runat="server" TextMode="SingleLine" EnableViewState="true" Enabled="false" Visible="false" />
                	
                </fieldset>
            
            </ContentTemplate>
        
        </asp:UpdatePanel>
                                                      
    </telerik:RadToolTip>
                                     
</asp:Panel>

<asp:Panel ID="panHider" Visible="false" runat="server">
    <asp:Label ID="label1" runat="server" CssClass="Information">To render please uncheck "Do Not Render In Design Mode" checkbox on the configuration page.</asp:Label>
</asp:Panel>
