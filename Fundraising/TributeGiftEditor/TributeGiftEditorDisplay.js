/// <reference path="Scripts/jquery-1.6.4-vsdoc.js" />

function Asi_Web_iParts_ContactManagement_TributeGiftEditorDisplay(detailsPanelID, radioOptionsName, notifyPanelID, checkboxID, tributeAccountValidatorID, showTributeNotifyPanelID) {

    var saveEnabledArray = new Array();
    var validatorArray;

    jQuery(document).ready(function () {

        // Tribute settings
        ToggleTributeDetails(true);
        jQuery("input[name$='" + radioOptionsName + "']").click(function () { ToggleTributeDetails(false); });

        // Validator array
        var el = jQuery("#" + tributeAccountValidatorID);
        if (el.length == 0) {
            alert('unable to access account ids');
            return;
        }

        // remember the original enabled and disabled settings for the validators
        var idString = el.val();
        validatorArray = idString.split(',');

        // remember validators enabled and disabled
        for (var i = 0; i < validatorArray.length; i++) {
            var validator = document.getElementById(validatorArray[i]);
            if (validator) {
                saveEnabledArray[i] = validator.enabled;
            }
        }

        // Notification settings
        if (showTributeNotifyPanelID.length != 0) {
            // hide the notify panel            
            jQuery('#' + showTributeNotifyPanelID).hide();
        }
        else {
            // display notify options
            ToggleTributeNotificationDetails(true);
            jQuery("#" + checkboxID).click(function () { ToggleTributeNotificationDetails(false); });
        }

    });


    //Toggle the display/show of our tribute details
    function ToggleTributeDetails(firstLoad) {

        var detailPanel = jQuery("#" + detailsPanelID);
        // get the checked radio option
        var selectedRadio = jQuery("input[name$='" + radioOptionsName + "']:checked")

        if (selectedRadio.val() == 'true') {
            detailPanel.show("slow");
        }
        else {
            if (!firstLoad) {
                // detailPanel.show("slow"); // TO DEBUG
                detailPanel.hide("slow");                
            }
            else {
                // detailPanel.show("slow"); // TO DEBUG
                detailPanel.hide(); // on first load, if hiding then do it quickly, otherwise it looks strange                
            }
        }
    }


    // Toggle the display of the Notification details
    function ToggleTributeNotificationDetails(firstLoad) {
        var notifyPanel = jQuery("#" + notifyPanelID);
        // get the checkbox
        var notifyCheckbox = jQuery("#" + checkboxID)

        if (notifyCheckbox.is(':checked')) {
        	notifyPanel.show("slow");
            TributeValidatorEnable(true);
        }
        else {
            if (!firstLoad) {
                // notifyPanel.show(); // TO DEBUG
            	notifyPanel.hide("slow");
                TributeValidatorEnable(false);
            }
            else {
                // notifyPanel.show(); // TO DEBUG
                notifyPanel.hide(); // on first load, if hiding then do it quickly, otherwise it looks strange
                TributeValidatorEnable(false);
            }
        }
    }

    // enable or disable the validators on the contact account creator embedded iPart
    function TributeValidatorEnable(isEnabled) {

//        var el = jQuery("#" + tributeAccountValidatorID);
//        if (el == null) {
//            alert('unable to access account ids');
//            return;
//        }
//        
//        var idString = el.val();
//        var validatorArray = idString.split(',');

        var setCount = 0;
        for (var i = 0; i < validatorArray.length; i++) {
            var validator = document.getElementById(validatorArray[i]);
            if (validator) {
                // ValidatorEnable(validator, isEnabled); // This is the recommended way, but it fires the validators when called
                if (isEnabled) {
                    validator.enabled = saveEnabledArray[i];
                }
                else {
                    validator.enabled = false;
                }
                ValidatorUpdateIsValid(); 
                setCount++;
            }
            else {
                // this is ok - we sometimes don't show all the controls
                // for example if the logon controls aren't wanted
            }
        }

        // alert('Set ' + setCount + ' Enabled to ' + isEnabled);
    }
}