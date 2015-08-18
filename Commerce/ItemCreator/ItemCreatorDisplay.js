function checksubmit(sender) {
    // Check if fuser is cler or burn
    if (fuser == 0) {
        fuser = 1; //Burn the fuser
        sender._enabled = false; // disable the control until postback occurs
    }

};

//This AJAX Callback Function that should be fired after AJAX postback is complete
function OnajaxPostbackComplete(sender, args) {
    ResetBlocker();
};

// Function to reset Fuser
function ResetBlocker() {
    // Reset Fuser
    fuser = 0;
};

function NoDecimal(sender, eventArgs) {
    var c = eventArgs.get_keyCharacter();
    if (c == '.' || c == ',') // Disable both the decimal and comma to cover all localizations
        eventArgs.set_cancel(true);
}

function DisableEnter(sender, eventArgs) {
    if (eventArgs.get_domEvent().rawEvent.keyCode == 13) {
        eventArgs.get_domEvent().preventDefault();
        eventArgs.get_domEvent().stopPropagation();
    }
}

function QuantityOrDisplayOrderKeyPressed(sender, eventArgs) {
    NoDecimal(sender, eventArgs);
    DisableEnter(sender, eventArgs);
}

function Asi_Web_iParts_Commerce_ItemCreatorDisplay(standardPriceId, discountPriceId, minPrice, maxPrice, maxComponentCount) {
    //
    // Variables
    //'<%#CollectionItemsGrid.ClientID%>'
    this.CollectionItemsGrid;
    this.RefreshButtonId;
    this.HiddenProductGuidTextBoxId;
    this.MinComponentSelectionsTextBoxId;
    this.MaxComponentSelectionsTextBoxId;
    this.ComponentSelectionsCustomValidatorClientId;

    // keep a reference to "this" to use when "this" means something else
    var me = this;

    //cache standard price...
    var stdPriceId = standardPriceId;
    var disPriceId = discountPriceId;
    //cache price, and make sure it's within bounds....
    var stdPriceOld = jQuery("#" + stdPriceId).val();

    var componentSelectionsCustomValidatorValidateSelectedOnly = false;

    // called when all the controls have been initialised and loaded
    this.OnLoad = function () {

        // attach events to min and max text boxes
        // remove existing events first or the event runs multiple times
        jQuery("#" + this.MinComponentSelectionsTextBoxId).unbind("change", OnMinComponentsChange);
        jQuery("#" + this.MaxComponentSelectionsTextBoxId).unbind("change", OnMaxComponentsChange);
        jQuery("#" + this.MinComponentSelectionsTextBoxId).change(this, OnMinComponentsChange);
        jQuery("#" + this.MaxComponentSelectionsTextBoxId).change(this, OnMaxComponentsChange);

        // attach events to price text fields
        // remove existing events first or the event runs multiple times
        jQuery("#" + stdPriceId).unbind("blur", OnStandardPriceBlur);
        jQuery("#" + disPriceId).unbind("blur", OnDiscountPriceBlur);
        jQuery("#" + stdPriceId).blur(OnStandardPriceBlur);
        jQuery("#" + disPriceId).blur(OnDiscountPriceBlur);

        // fire the component selection validator
        this.Fire_ComponentSelectionsCustomValidator(true);

    }

    // event handlers

    //called when leaving standard price 
    function OnStandardPriceBlur() {
        var diTidy = TidyPriceString(jQuery("#" + disPriceId).val());
        var oldstTidy = TidyPriceString(stdPriceOld);
        if (diTidy == oldstTidy || diTidy.length == 0)
            jQuery("#" + disPriceId).val(jQuery("#" + stdPriceId).val());

        stdPriceOld = jQuery("#" + stdPriceId).val();
    }

    //called when leaving discount price
    function OnDiscountPriceBlur() {
        // map standard to discount if discount is now empty
        if (jQuery("#" + disPriceId).val().length == 0)
            jQuery("#" + disPriceId).val(jQuery("#" + stdPriceId).val());
    }

    // called when the Min components field changes
    // senderData.data contains a reference to this
    function OnMinComponentsChange(senderData) {
        senderData.data.Fire_ComponentSelectionsCustomValidator();
    }

    // called when the Max components field changes
    // senderData.data contains a reference to this
    function OnMaxComponentsChange(senderData) {
        senderData.data.Fire_ComponentSelectionsCustomValidator();
    }

    // public functions

    // add an item
    this.AddItem = function (url) {
        if (url == null || url == "") return;
        // RefreshButtonId = this.RefreshButtonId;
        // HiddenProductGuidTextBoxId = this.HiddenProductGuidTextBoxId;
        var dialog = ShowDialog(url, null, 800, 800, "Add Item", null, "E", null, null, false, false, AddItemOnClose, null);
    };

    // confirm clear of the components list
    this.ConfirmClearComponents = function (radioButton, message) {

        var grid = $find(this.CollectionItemsGrid);
        var MasterTable = grid.get_masterTableView();
        var numItems = MasterTable.get_dataItems().length;

        if (numItems == 0 || confirm(message)) {
            __doPostBack(radioButton.id, '');
        } else {
            return false;
        }
    };

    // validate Min component selection can be met by item set, checks
    // selected components >= min components
    // max components >= min components
    this.ComponentSelectionsCustomValidator = function (source, args) {

        // optional setting to allow us to just validate the component selection
        var validateSelectedOnly = typeof(componentSelectionsCustomValidatorValidateSelectedOnly) == typeof(Boolean()) ? componentSelectionsCustomValidatorValidateSelectedOnly : false;
        componentSelectionsCustomValidatorValidateSelectedOnly = false;    // reset

        // calculate the number of selected components
        var numItems = 0;
        var grid = $find(this.CollectionItemsGrid);
        if (grid) {
            var masterTable = grid.get_masterTableView();
            if (masterTable) {
                numItems = masterTable.get_dataItems().length;
            }
        }

        // get the min and max values as integers
        var minValue = parseInt(jQuery("#" + this.MinComponentSelectionsTextBoxId).val());
        var maxValue = parseInt(jQuery("#" + this.MaxComponentSelectionsTextBoxId).val());

        // check the standard validators for the minimum and max controls
        // this doesn't run the validators, it just tells us whether they are currently reporting a problem
        var minValid = CheckAllValidatorsForControl(this.MinComponentSelectionsTextBoxId, source.id) && !isNaN(minValue);
        var maxValid = CheckAllValidatorsForControl(this.MaxComponentSelectionsTextBoxId, source.id) && !isNaN(maxValue);

        // are there enough items selected
        // only run if we arent currently reporting another problem with the min field
        if (minValid) {
            if (minValue > 0 && minValue > numItems && minValue <= maxComponentCount) {
                args.IsValid = false;
                jQuery(source).text("Item set does not have enough components");
                return;
            }
        }

        // validate the range
        if (!validateSelectedOnly) {
            // only run if we arent currently reporting another problem with the min or max field
            if (minValid && maxValid) {
                // only run if we arent currently reporting another problem
                if (maxValue > 0 && minValue > maxValue && minValue <= maxComponentCount && maxValue <= maxComponentCount) {
                    args.IsValid = false;
                    jQuery(source).text("Invalid range");
                    return;
                }
            }
        }

    };

    // Fires the component selection custom validator
    // validateSelectedOnly = only validate the minimum component
    this.Fire_ComponentSelectionsCustomValidator = function (validateSelectedOnly) {
        if (me.ComponentSelectionsCustomValidatorClientId != null && me.ComponentSelectionsCustomValidatorClientId.length > 0 && $(me.ComponentSelectionsCustomValidatorClientId)!=null) {
            componentSelectionsCustomValidatorValidateSelectedOnly = typeof(validateSelectedOnly)==typeof(Boolean()) ? validateSelectedOnly : false;
            ValidatorValidate($(me.ComponentSelectionsCustomValidatorClientId));
        }
    }

    // private functions

    // Tidies a price string
    // Uses locale settings to format the number
    // Zero prices will be returned as empty
    function TidyPriceString(priceString) {

        // cleanup whitespace
        priceString = jQuery.trim(priceString + "");
        if (priceString == null || priceString.length == 0) return "";

        // determine if we have the Base Type Extensions that .NET injects to test and format numbers based on a locale
        // we should have them
        var useMsExtensions = typeof (Number.parseLocale) != "undefined";

        // convert string to a number
        var n = useMsExtensions ? Number.parseLocale(priceString) : parseFloat(priceString);
        if (isNaN(n)) n = 0;

        // check the range
        if (n < minPrice) n = minPrice;
        if (n > maxPrice) n = maxPrice;

        // return formatted for display
        if (n == 0) return "";
        return useMsExtensions ? n.localeFormat("N2") : n.toFixed(2);

    }

    // called when closing the item edit popup
    function AddItemOnClose(radWin) {
        if (radWin != null &&
            radWin.result != null &&
            radWin.result.length > 0) {

            var result = radWin.result[0];

            radWin.result = null; // clear out radWin.result in case we press the "cancel" button next time in the finder adder
            if (me.HiddenProductGuidTextBoxId != null) {
                $(me.HiddenProductGuidTextBoxId).value = result;
            }
        }

        if (me.RefreshButtonId != null) {
            $(me.RefreshButtonId).click();
        }

    };

    // Check all validators for a specific control
    // Returns true if they are all IsValid
    function CheckAllValidatorsForControl(controlId, exclude) {
        exclude = "," + exclude + ",";
        valid = true;
        for (var i = 0; i < Page_Validators.length; i++) {
            var v = Page_Validators[i];
            if (v.controltovalidate == controlId && exclude.indexOf("," + v.id + ",") < 0) {
                // ValidatorValidate(v);
                valid = valid && v.isvalid;
            }
        }
        return valid;
    }

}
