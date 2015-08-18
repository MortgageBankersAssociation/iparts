/// <reference path="Scripts/jquery-1.6.4-vsdoc.js" />

function Asi_Web_iParts_ContactProfilePictureEdit(containerClientID) {
	//-----------  Constructor -----------
	jQuery(document).ready(function () {
		EnableDisableFacebookOptions(jQuery('input:checkbox[id*=enableEdit]').is(':checked'));

		jQuery('input:checkbox[id*=enableEdit]').change(function () {
			EnableDisableFacebookOptions(jQuery(this).is(':checked'));
		});

	});
	//----------- Public methods ----------- 


	//----------- Private methods -----------

	function EnableDisableFacebookOptions(enableEdit) {
		if (enableEdit) {
			jQuery('input:checkbox[id*=useFacebookPicture]').prop('disabled', false);
		}
		else {
			jQuery('input:checkbox[id*=useFacebookPicture]').prop('disabled', true);
		}
	}

}
