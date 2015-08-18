<%@ Control Language="c#" Inherits="Asi.Web.iParts.Events.BusinessFileUpload" Codebehind="BusinessFileUpload.ascx.cs" %>
<%@ Register TagPrefix="asi" Namespace="Asi.Web.UI.WebControls" Assembly="Asi.Web" %>
<%@ Register TagPrefix="telerik" Namespace="Telerik.Web.UI" Assembly="Telerik.Web.UI" %>

<asp:UpdatePanel ID="up1" runat="server" UpdateMode="Conditional" >
    <ContentTemplate>
        <telerik:RadProgressManager id="RadProgress_Control" runat="server"  />
        <telerik:RadProgressArea id="radProgress_Area" runat="server" DisplayCancelButton="true" ProgressIndicators="TotalProgressBar,CurrentFileName,TimeElapsed,TimeEstimated"
          />
     
    <script language="javascript" type="text/javascript">
    //<![CDATA[
        ///Function to toggle submit button status. This JS is fired by Fileupload when file is selected or on page load    	
	    function ToggleUploadButton(radUpload, eventargs)
	    {
            var uploadButton = document.getElementById("<%#UploadButton.ClientID%>");
    	    if(uploadButton!=null)
                 uploadButton.disabled = true;
        
            if (eventargs!=null && uploadButton!=null)
            {
                uploadButton.disabled = false;
            }
	    }
	    
        // This Event fired by Telerik when File Upload added to the Telerik control (this event is always fired)
        function OnClientAdded(radUpload, eventargs)
        {
            setTimeout("BrowserFixes()",250);
            setTimeout("ToggleUploadButton(null,null)",250);
        }
	    
        /// Special method to fix visual issues in differnet browsers	    
	    function BrowserFixes()
	    {
	        var _uploadcontrol = document.getElementById("<%#radUploadControl.ClientID%>");
	        var _uploadbutton = document.getElementById("<%#UploadButton.ClientID%>");
    
	        // Firefox speciifc Fix
	        if (BrowserDetect.browser.toUpperCase() != 'EXPLORER' && _uploadcontrol != null) {
                _uploadcontrol.style.paddingTop = "1px";
                _uploadbutton.style.marginTop = "5px";
                // For SAFARI/CHROME VERY ODD fix for SUBMIT btn
                if (BrowserDetect.browser.toUpperCase() == 'SAFARI' || BrowserDetect.browser.toUpperCase() == 'MOZILLA') {
                    var _btn = null;
                    // Safari is very sensitive and picky :)))
                    try {
                        _btn = _uploadcontrol.lastChild.firstChild.firstChild.lastChild;
                    }
                    catch (e) { _btn = null; }

                    try {
                        // try to set Position of the btn
                        _uploadbutton.clientHeight = _btn.clientHeight + 2;
                        _uploadbutton.style.height = _btn.clientHeight + 2 + "px";
                    }

                    catch (e) {
                    // Do nothing
                    }

                 }
            }

            // IE8 Speciifc - There is aproblem with IE8 how it calculates a size of the the DIV that has Span with UL>LI>Buttons
            //So as safety swicth we set Submit button displayed a block so it will be on the next line
            // But if we can we will move it to be inline
            // It is based on the HTML structure of Telerik Upload: DIV UL LI SPAN and Submit Button is a last one
            if(_uploadcontrol!=null) {
                if (BrowserDetect.browser.toUpperCase() == 'EXPLORER' && BrowserDetect.version > 7) {
                    var _btn = null;
                    // IE8 is very sensitive and picky :)))
                    try {
                        _btn = _uploadcontrol.lastChild.firstChild.firstChild.lastChild;
                    }
                    catch (e) { _btn = null; }

                    try {
                        // try to set Position of the btn
                        //_uploadbutton.style.overflow="visible";
                        //_uploadbutton.style.display = "inline";
                        _uploadbutton.style.marginTop = "5px";
                        //_uploadbutton.style.paddingTop = "0px";
                        _uploadbutton.style.marginLeft = _btn.clientWidth + 2 + "px";
                        _uploadbutton.clientHeight = _btn.clientHeight - 2;
                        _uploadbutton.style.height = _btn.clientHeight - 2 + "px";
                    }

                    catch (e) {
                        // Safety swicth :))
                        _uploadbutton.style.display = "block";
                    }
                }
               
            }
	      }
      //]]>
    </script>
    <telerik:RadUpload
                            ID="radUploadControl" runat="server"
                            MaxFileInputsCount="1"
                            OverwriteExistingFiles="false" OnClientFileSelected = "ToggleUploadButton" 
                            OnClientAdded="OnClientAdded"
                             style="padding-top: 0px; padding-bottom:0px;font-size:small!Important; margin-top:0px;width:auto!Important; float:left; "
                             CssClass="" 
                               
                             EnableFileInputSkinning="True" ReadOnlyFileInputs="true" />
                             <asi:StyledButton 
                             id="UploadButton" Runat="Server" Text="<%#ButtonText%>" CssClass="ruButton ruBrowse ruFileInput"  />
    </ContentTemplate>
    <Triggers>
        <asp:PostBackTrigger ControlID="UploadButton" />
    </Triggers>
</asp:UpdatePanel>
