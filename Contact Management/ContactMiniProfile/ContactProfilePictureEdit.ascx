<%@ Control Language="C#" ClassName="Asi.Web.iParts.ContactManagement.ContactMiniProfile.ContactProfilePictureEdit" Inherits="Asi.Web.UI.WebControls.iPartEditBase" %>
<%@ Import Namespace="System.Globalization" %>

<script runat="server" language="C#">
    public override string AtomComponentName
    {
        get
        {
            return "Contact Profile Picture";
        }
    }

	protected override void OnPreRender(EventArgs e)
	{
		base.OnPreRender(e);

		// var we store our JS object in
		string javascriptManagerVar = string.Format(CultureInfo.InvariantCulture, "window[\"{0}_jsmanager\"]", ClientID);

		ScriptManager.GetCurrent(Page).Scripts.Add( new ScriptReference(Asi.Web.Utilities.GetTildeExpansion() +
								"/iparts/Contact Management/ContactMiniProfile/ContactProfilePictureEdit.js"));

		// create an instance of the js manager and register it in window
		var js = string.Format(CultureInfo.InvariantCulture,
							   "if(typeof({0})=='undefined') {{ {0}=new Asi_Web_iParts_ContactProfilePictureEdit('{1}');}}",
							   new string[]
				                       	{
				                       		javascriptManagerVar,
											""
				                       	});
		ScriptManager.RegisterStartupScript(Page, Page.GetType(), ClientID + "_jsmanager", js, true);			
	}
</script>

<asiweb:PanelTemplateControl id="contactProfilePicture" runat="server" fieldset="True" showheader="False" borderstyle="None">
  
    <div class="AutoWidth">
           
        <asiweb:SmartControl ID="DisplayForAuthorizedUsersOnly" runat="server" BoundPropertyName="DisplayForAuthorizedUsersOnly" DisplayCaption="true" PositionCaption="Right" DataSaveUponStateChange="false" />

        <asiweb:SmartControl id="enableEdit" runat="server" boundpropertyname="EnableEdit" displaycaption="True" positioncaption="Right" DataSaveUponStateChange="false" />
		<div class="SubItems">
			<asiweb:SmartControl id="useFacebookPicture" runat="server" boundpropertyname="UseFacebookPicture" displaycaption="True" positioncaption="Right" DataSaveUponStateChange="false" />
		</div>
    </div>  
            
    <asiweb:SmartControl id="maxFileSize" runat="server" boundpropertyname="MaxFileSize" displaycaption="True" positioncaption="Left" DataSaveUponStateChange="false" MinValue="1" MaxValue="1073741824" /> 
       
    <asiweb:SmartControl id="maxImageWidth" runat="server" boundpropertyname="MaxImageWidth" displaycaption="True" positioncaption="Left" DataSaveUponStateChange="false" MinValue="50" MaxValue="1000" />
    
    <asiweb:SmartControl id="fileTypes" runat="server" boundpropertyname="FileTypes" displaycaption="True" positioncaption="Left" DataSaveUponStateChange="false" />
                         
</asiweb:PanelTemplateControl>
