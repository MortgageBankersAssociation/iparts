/// <reference path="Scripts/jquery-1.6.4-vsdoc.js" />

function Asi_Web_iParts_Fundraising_DonationCreatorDisplay(containerId, otherRadioVal, decimalNumberSeparator) {

    var container = jQuery('#' + containerId);
    
    jQuery(document).ready(function () {
        // hook up our focus change event to select the "other" radio when the amount
        // box is clicked into
        container.find('input[id$=GiftAmount2]').focus(function () {
            var otherRadio = jQuery(":radio[value=" + otherRadioVal + "]");
            // only check other radio if it's not currently checked
            if (!otherRadio.is(":checked")) {
                otherRadio.attr('checked', true);
                // find required field validator and enable/hook up to text box
                container.find('[id$=GiftAmountRequiredFieldValidator2]')[0].enabled = true;
            }
        });

        container.find('input[id$=GiftAmount2]').blur(function () { GiftBlur(jQuery(this).get(0)); });
        container.find('input[id$=GiftAmount]').blur(function () { GiftBlur(jQuery(this).get(0)); });

        container.find('input[id$=GiftAmount2]').change(function () { fireCustomValidator(); });
        

        container.find('input[name$=GiftAmountSelection]').change(function () {
            fireCustomValidator();
            jQuery(this).each(function () {
                if (jQuery(this).attr('checked')) {
                    if (jQuery(this).val() != otherRadioVal) {
                        // clicked on a radio button that isn't "Other"
                        container.find('input[id$=GiftAmount2]').val('');

                        //find required field validator and disable
                        // NOTE: ValidatorEnable causes the validator run, so when we enable we don't use ValidatorEnable, otherwise
                        // we end up with the validator behaving slightly differently to the others and displaying immediately.
                        ValidatorEnable(container.find('[id$=GiftAmountRequiredFieldValidator2]')[0], false);
                    }
                    else {
                        // re-enable validator
                        container.find('[id$=GiftAmountRequiredFieldValidator2]')[0].enabled = true;
                    }
                }
            });

        });

    });


    // tidy up amount if more than 2 dp
    function GiftBlur(amountControl) {
        var value = amountControl.value;

        if (value == null) return;

        if (decimalNumberSeparator == "") {
            decimalNumberSeparator = ".";
        }

        if (value.indexOf(decimalNumberSeparator) > 0) {
            var p = value.indexOf(decimalNumberSeparator);
            var rhs = value.substring(p + 1);
            if (rhs.length > 2) {
                amountControl.value = amountControl.value.substring(0, amountControl.value.length - (rhs.length - 2));
            }
        }
    }

    // For some reason our custom validator doesnt re-validate after a valid entry has bee set, i.e. it remains on screen when it shouldnt
    function fireCustomValidator() {
        window.ValidatorValidate(container.find("span[id$='RadioEntryCustomValidator']").get(0));
    }

    // Public Functions
    this.ValidateRadiosAndTextBox = function (source, args) {
        var checked = container.find("input[name$='GiftAmountSelection']:checked");
        if (checked.length == 0 && container.find("input[id$='GiftAmount2']").val() == "") {
            args.IsValid = false;
        } else {
            args.IsValid = true;
        }
    };

    this.EditCallBack = function (radWin) {
        var refresh = false;
        if (radWin != null && typeof (radWin.IsDirty) == 'boolean') {
            refresh = radWin.IsDirty;
        }
        else {
            // if for some reason we dont get a rad window then assume we should refresh
            refresh = true;
        }
        if (refresh)
            window.location.reload();
    };
    
}