/// <reference path="Scripts/jquery-1.6.4-vsdoc.js" />

function Asi_Web_iParts_ContactProfilePictureDisplay(isInOnBehalfOfMode, containerClientID, toolTipPanelID) {

	//-----------  Constructor -----------

	/*
	Everything within the iPart is contained within a div with an ID of: containerClientID
	Therefore we only need to pass in the iPart ClientID and for all other (child) controls use a jQuery like so: container.find()
	The exception is our RadToolTip which is rendered outside of the iPart div, so we pass in toolTipPanelID
	*/
	var container = jQuery('#' + containerClientID);
	var toolTipContainer = jQuery('#' + toolTipPanelID);

	// Our facebookID property, this needs to be updated from the server code during a postback when the JS object has already been added to the DOM
	// currently updated via a call to OnLoad()
	var FacebookID = '';

	//the facebook id in the database.
	var StoredFBID = '';
	/*
	* hook up to our event which is fired when the facebook API has finished loading
	*/
	jQuery("body").on("FacebookAPIHasLoadedEvent", function (event) {
		//Facebook init work:

		//subscribe to the login, so after login we save their facebookID
		FB.Event.subscribe('auth.login', function (response) {
			if (response.authResponse) {
				// store the FB id in our database, but only if one isnt stored already
				// If we don't make this check the FB ID will be changed automatically when users login/out of FB
				if (FacebookID == "" && isInOnBehalfOfMode == 'False') {
					//alert('login detected');
					SetFacebookID(FB.getUserID());
					DisplayFacebookPic(FB.getUserID());
				}
			} else {
				// console.log('User cancelled login or did not fully authorize.');
			}
		});

		// check login status and then setup our page (but only if not viewing record as a staff user)
		if (isInOnBehalfOfMode == 'False') {
			FB.Event.subscribe('auth.authResponseChange', function (response) {
				/* authResponse has the following properties: accessToken,expiresIn,signedRequest, userID
				We could use this to check permissions and see if the user is known to our app
				http://developers.facebook.com/docs/reference/javascript/FB.getLoginStatus/
				*/
			});
			
			FB.getLoginStatus(function (response) {
				onStatus(response); // once on page load
				FB.Event.subscribe('auth.statusChange', onStatus); // every status change
			});
		}
	});
	//------------------------------


	/*
	* Setup our page each time it loads/postsback
	*/
	this.OnLoad = function (facebookID) {
		SetFacebookID(facebookID);
		StoredFBID = facebookID;
		jQuery(document).ready(function () {
			// Allow the user to choose if they want to use facebook or imis for their profile picture
			toolTipContainer.find("input[name$='UseFacebookRadios']").change(function () { ToggleUserImageOptions(); });

			// set the facebook profile pic image
			DisplayFacebookPic(FacebookID);

			// -- Hook up facebook events to our buttons (facebook login/out buttons are buggy) --
			// hook up logout button
			jQuery('#facebookLogOutDiv').click(function () {
				// logout and disconnect
				SetFacebookID('');
				DisplayFacebookPic("");
				FB.logout(function (response) {
				});
				onStatus('undefined'); // in case they are already logged out
				//automatically change radio selection and click the save button
				toolTipContainer.find("input[name$='UseFacebookRadios']").each(function () {
					if (jQuery(this).val() == 'imis') {
						jQuery(this).prop('checked', true);
						ToggleUserImageOptions(); // jQuery bug means we have to manually toggle
						//toolTipContainer.find("input[id$='submit']").trigger('click');
					}
				});

				// remove the app authentication, then log out
				//FB.api("/" + FacebookID + "/permissions", "delete", function (reponse) {			
				//	onStatus(response);
				//});
			});
			// hook up login button
			jQuery('#facebookConnectBtn').click(function () {
				// if not alreayd logged in, then login now!
				FB.getLoginStatus(function (response) {
					if (response.status != 'connected') {
						FB.login(function (response) {
							// do nothing else, let our event handle this
						});
					}
					else {
						onStatus(response);
					}
				});
			});
			// -- END Hook up facebook events to our buttons (facebook login/out buttons are buggy) --

			// If facebook api is already loaded then our FacebookAPIHasLoadedEvent wont be fired again so setup page again
			// fbEnsureInit makes sure FB.init has been called before we try to work with facebook API
			if (isInOnBehalfOfMode == 'False' && typeof fbEnsureInit == 'function')  {
				fbEnsureInit(0, function () {
					if(typeof FB != 'undefined'){
						FB.getLoginStatus(function (response) {
							onStatus(response); // once on page load
						});
					}
				});
			}
		});
	}

	//---------- Public Methods ------------

	//make sure when the user clicks the cancel button on the config (i.e. use FB/use imis pic)
	// we re-set the radios appropriately according to the existing settings
	this.ResetConfig = function () {
		if (StoredFBID != 'NoToFacebookPic') {
			toolTipContainer.find("input[name$='UseFacebookRadios']").each(function () {
				if (jQuery(this).val() == 'facebook') {
					jQuery(this).prop('checked', true);
					toolTipContainer.find('div[id$=iMISPicturePanel]').hide();
					toolTipContainer.find('div[id$=FacebookPicturePanel]').show();
					// restore previous FB ID in our JS
					FacebookID = StoredFBID;
					// see if we are connected to facebook and if we are display the facebook bits
					if (typeof FB != 'undefined') {
						FB.getLoginStatus(function (response) {
							onStatus(response); // once on page load
						});
					}
				}
			});
		}
		else {
			toolTipContainer.find("input[name$='UseFacebookRadios']").each(function () {
				if (jQuery(this).val() == 'imis') {
					jQuery(this).prop('checked', true);
					toolTipContainer.find('div[id$=iMISPicturePanel]').show();
					toolTipContainer.find('div[id$=FacebookPicturePanel]').hide();
				}
			});
		}
	}


	//----------- Private methods -----------

	//toggle config page options
	function ToggleUserImageOptions() {

		var selected = toolTipContainer.find("input[name$='UseFacebookRadios']:checked")
		// if facebook option selected:
		if (selected.val() == 'facebook') {
			//Hide the rest of the form (because we can't disable radupload)
			toolTipContainer.find('input[id$=checkBoxDeleteImage]').prop('checked', false);
			toolTipContainer.find('div[id$=iMISPicturePanel]').hide("slow");
			toolTipContainer.find('div[id$=FacebookPicturePanel]').show("slow");

			// see if we are connected to facebook and if we are display the facebook bits
			if (FacebookID == 'NoToFacebookPic') { FacebookID = ''; }
			DisplayFacebookPic(FacebookID);

			FB.getLoginStatus(function (response) {
				onStatus(response); // setup facebook bits
			});

			// Staff users can't fiddle with the facebook settings, so disable the save button
			if (isInOnBehalfOfMode == 'True' && FacebookID == '') {
				enableSaveButton(false);
			}

		} else {
			toolTipContainer.find('div[id$=iMISPicturePanel]').show("slow");
			toolTipContainer.find('div[id$=FacebookPicturePanel]').hide("slow");
			/* //only enable save button if they are uploading or the have an exisitng profile picture.
			if (toolTipContainer.find("[id$='checkBoxDeleteImage']").prop('disabled') &&
			toolTipContainer.find("[id$='AsyncUpload1ListContainer'] input[name='RowRemove']").length == 0) {
			enableSaveButton(false);
			}
			else {
			enableSaveButton(true);
			}*/
			enableSaveButton(true);
		}
	}

	//Set our facebook ID andd store it in a hidden field
	function SetFacebookID(arg) {
		FacebookID = arg;
		// instead of saving to the DB via a callbackback event, we now just set a hidden field
		container.find('input[id$=FacebookIDHiddenField]').val(arg);
	}


	// Set the URL to grab the facebook picture
	function DisplayFacebookPic(facebookID) {
		// if facebook section is not visible, then exit out
		if (facebookID == 'NoToFacebookPic') {
			return;
		}

		var facebookPic = toolTipContainer.find("img[id$='facebookPic']");
		var errorCount = 0;

		facebookPic.find("img[id$='facebookPic']").error(function () {
			// If we get an error from the first facebook id (maybe the Id is invalid)
			// try again with a blank ID, if that fails make sure we dont' get in an error loop
			// unfortunately this error handling still doesnt catch the 404 JS error
			if (errorCount < 1) {
				jQuery(this).attr("src", "https://graph.facebook.com//picture?type=normal");
			} else {
				jQuery(this).attr('alt', 'Error Grabbing facebook picture');
			}
			errorCount = errorCount + 1;
		});
		facebookPic.attr("src", "https://graph.facebook.com/" + facebookID + "/picture?type=normal");
		if (facebookID != '') { facebookPic.show(); }
	}

	/**
	* This will be called once on page load, and every time the Facebook status changes.
	*/
	function onStatus(response) {
		if (isInOnBehalfOfMode == 'True') {
			return;
		}

		if (FacebookID != '' && FacebookID != 'NoToFacebookPic') //If we have their ID saved,  show the picture and the logout buttons
		{
			DisplayFacebookPic(FacebookID);
			jQuery('#facebookConnectBtn').hide();
			jQuery('#facebookLogOutDiv').show("slow");
			enableSaveButton(true);
		}

		if (typeof (response) != 'undefined' && response.status == 'connected') {
			// If the user is connected, but we havent yet saved thier facebook ID, then do it now
			if (FacebookID == "" || FacebookID == 'NoToFacebookPic') {
				DisplayFacebookPic(FB.getUserID());
				SetFacebookID(FB.getUserID());
				jQuery('#facebookConnectBtn').hide();
				jQuery('#facebookLogOutDiv').show("slow");
			}
			enableSaveButton(true);
		} else {
			if (FacebookID == '') {
				//show login bits
				toolTipContainer.find("img[id$='facebookPic']").hide();
				jQuery('#facebookLogOutDiv').hide();
				jQuery('#facebookConnectBtn').show("slow");
				enableSaveButton(false);
			}
		}
	}

	function enableSaveButton(enable) {
		// if something has changed, enable the save button
		var selectedRadioValue = toolTipContainer.find("input[name$='UseFacebookRadios']:radio:checked").val();
		toolTipContainer.find('input[id$=submit]').prop('disabled', !enable);
	}
	//----------- END Private methods ----------- 
}
