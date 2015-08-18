function Asi_Web_iParts_Events_EventFunctionPricing(priceMode, earlyCutoffDatePickerId, regularCutoffDatePickerId, cutoffRangeValidatorId, priceGridId, minPrice, maxPrice) {

    // private variables 
    var eventsAttached = false;
    var priceFocusValues;

    // constructor
    CachePrices();

    // public functions
    
    // called when all the controls have been initialised and loaded
    this.OnLoad = function () {

        // attach events
        if (!eventsAttached) {

            // attach events to the time pickers so we can tell when a time has been entered/edited
            // only applies when pricing mode is Event, we don't show the dates in Function mode
            if (priceMode == "Event") {
                $find(earlyCutoffDatePickerId).add_dateSelected(OnEarlyCutoffDateChanged);
                $find(regularCutoffDatePickerId).add_dateSelected(OnRegularCutoffDateChanged);
            }

            // attach events to price text fields
            jQuery("#" + priceGridId + " input[type=text][name*=TextPrice]").blur(OnPriceBlur);

            eventsAttached = true;

        }

        EnableDisablePriceFields();

    }

    // validate cut off date range
    // returns an object with following properties
    //      (bool)IsValid               Indicates if the date range is valid 
    this.ValidateCutoffDateRange = function () {

        //construct return object
        var r = { IsValid: true };

        //get early cut off date
        var earlyDate = $find(earlyCutoffDatePickerId).get_selectedDate();
        //get late cut off date
        var regularDate = $find(regularCutoffDatePickerId).get_selectedDate();

        // now compare them
        if (earlyDate != null && regularDate != null) {
            r.IsValid = !(earlyDate >= regularDate);
            return r;
        }
        return r;
    }
    
    // private functions
    
    // called when early cutoff date is changed
    function OnEarlyCutoffDateChanged(sender, eventArgs) {
        EnableDisablePriceFields();
        FireCutoffDateRangeValidator();
    }

    // called when regular cutoff date is changed
    function OnRegularCutoffDateChanged(sender, eventArgs) {
        EnableDisablePriceFields();
        FireCutoffDateRangeValidator();
    }

    // fire the cut off date range validator
    function FireCutoffDateRangeValidator()
    {
        ValidatorValidate($(cutoffRangeValidatorId));
    }

    // called when leaving a price field
    function OnPriceBlur(sender) {
        // tidy the price field
        var untidy = jQuery(sender.target).val();
        var tidy = TidyPriceString(untidy);
        if (untidy != tidy) jQuery(sender.target).val(tidy);
        // map standard price to discount
        MapPrices(sender.target.id);
        CachePrices();
    }

    // Cache the current prices
    function CachePrices() {
        priceFocusValues = new Array();
        jQuery("#" + priceGridId + " input[type=text][name*=TextPrice]").each(function(index) {priceFocusValues.push({id:this.id,price:this.value})});
    }

    // Map prices between the standard and discount rows
    function MapPrices(priceId) {

        // get the field ids
        var isStandard = IsStandardPriceId(priceId);
        var stId = isStandard ? priceId : StandardPriceIdFromDiscountPriceId(priceId);
        var diId = isStandard ? DiscountPriceIdFromStandardPriceId(priceId) : priceId;

        if (isStandard) {
            // map standard price field to discount field if they were previously the same
            // get the cached standard price
            var oldst = null;
            for (var i = 0; i < priceFocusValues.length; i++) {
                if (priceFocusValues[i].id == stId) {
                    oldst = priceFocusValues[i];
                    break;
                }
            }
            if (oldst == null) return;  // should never happen
            // if the current discount price, and old standard price are the same
            // OR the discount price is empty
            // then copy the standard price to the discount price
            var diTidy = TidyPriceString(jQuery("#" + diId).val());
            var oldstTidy = TidyPriceString(oldst.price);
            if (diTidy == oldstTidy || diTidy.length == 0)
                jQuery("#" + diId).val(jQuery("#" + stId).val());

        }
        else {
            // map standard to discount if discount is now empty
            if (jQuery("#" + diId).val().length == 0)
                jQuery("#" + diId).val(jQuery("#" + stId).val());
        }

    }

    // tests the id of an element to see if it is one of the standard price fields
    function IsStandardPriceId(priceFieldId) {
        return priceFieldId.indexOf("_TextPriceStandard") >= 0;
    }

    // gets the id of a corresponding discount price element from standard price id
    function DiscountPriceIdFromStandardPriceId(standardPriceId) {
        if (standardPriceId.indexOf("_TextPriceStandard") < 0) return null;
        return standardPriceId.replace("_TextPriceStandard", "_TextPriceDiscount");
    }

    // gets the id of a corresponding standard price element from discount price id
    function StandardPriceIdFromDiscountPriceId(discountPriceId) {
        if (discountPriceId.indexOf("_TextPriceDiscount") < 0) return null;
        return discountPriceId.replace("_TextPriceDiscount", "_TextPriceStandard");
    }

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

    // enable and disable price fields based on whether cutoff dates are specified
    function EnableDisablePriceFields() {

        // early prices
        var earlyDate = $find(earlyCutoffDatePickerId).get_selectedDate();
        if (earlyDate != null) {
            jQuery("#" + priceGridId + " input[type=text][name$=TextPriceStandardEarly]").removeAttr('disabled');
            jQuery("#" + priceGridId + " input[type=text][name$=TextPriceDiscountEarly]").removeAttr('disabled');
        }
        else {
            jQuery("#" + priceGridId + " input[type=text][name$=TextPriceStandardEarly]").attr('disabled', 'true');
            jQuery("#" + priceGridId + " input[type=text][name$=TextPriceDiscountEarly]").attr('disabled', 'true');
        }

        // late prices
        var regularDate = $find(regularCutoffDatePickerId).get_selectedDate();
        if (regularDate != null) {
            jQuery("#" + priceGridId + " input[type=text][name$=TextPriceStandardLate]").removeAttr('disabled');
            jQuery("#" + priceGridId + " input[type=text][name$=TextPriceDiscountLate]").removeAttr('disabled');
        }
        else {
            jQuery("#" + priceGridId + " input[type=text][name$=TextPriceStandardLate]").attr('disabled', 'true');
            jQuery("#" + priceGridId + " input[type=text][name$=TextPriceDiscountLate]").attr('disabled', 'true');
        }

    }

}

