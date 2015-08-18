﻿function Asi_Web_iParts_Events_EventEditDisplay(startDatePickerId, startTimePickerId, endDatePickerId, endTimePickerId, dateRangeValidator, regTypeRadioButtonListId, tabStripId, regOthersId, allowAddId, roLabelId, agLabelId) {   
        
    // private variables 
    var eventsAttached = false;
    var settingTime = false;
    var settingDate = false;    
    
    // public functions
    
    // called when all the controls have been initialised and loaded
    this.OnLoad = function () {

        // attach events
        if (!eventsAttached) {

            // attach events to the time pickers so we can tell when a time has been entered/edited
            $find(startDatePickerId).add_dateSelected(OnStartDateChanged);
            $find(startTimePickerId).add_dateSelected(OnStartTimeChanged);
            $find(endDatePickerId).add_dateSelected(OnEndDateChanged);
            $find(endTimePickerId).add_dateSelected(OnEndTimeChanged);

            // attach events to reg type radio buttons 
            jQuery("#" + regTypeRadioButtonListId + " [type=radio]").change(OnRegTypeChanged);

            jQuery("input#" + regOthersId).change(ConfigureCheckBoxes);
            
            eventsAttached = true;
        }

        ConfigureTabs();
        ConfigureCheckBoxes();
    }

    // validate the start and end date range
    // returns an object with following properties
    //      (bool)IsValid               Indicates if the date range is valid 
    //      (string)ErrorType           Type of error   date:invalid date range, datetime:invalid datetime range
    this.ValidateDateRanges = function () {

        // if we have times, then ensure we have dates
        EnsureDateIfTime(startDatePickerId, startTimePickerId, endDatePickerId);
        EnsureDateIfTime(endDatePickerId, endTimePickerId, startDatePickerId);

        // construct the return object
        var r = { IsValid: true, ErrorType: "" };

        // get a combined start date and time
        var startDate = $find(startDatePickerId).get_selectedDate();
        var startTime = $find(startTimePickerId).get_selectedDate();
        var startDateTime = null;
        if (startDate != null && startTime != null)
            startDateTime = new Date(startDate.getFullYear(), startDate.getMonth(), startDate.getDate(), startTime.getHours(), startTime.getMinutes(), 0, 0);

        // get a combined end date and time
        var endDate = $find(endDatePickerId).get_selectedDate();
        var endTime = $find(endTimePickerId).get_selectedDate();
        var endDateTime = null;
        if (endDate != null && endTime != null)
            endDateTime = new Date(endDate.getFullYear(), endDate.getMonth(), endDate.getDate(), endTime.getHours(), endTime.getMinutes(), 0, 0);

        // now compare them
        // if dates and times are present for both, then do a range check including the time
        if (startDateTime != null && endDateTime != null) {
            r.ErrorType = "datetime";
            r.IsValid = !(startDateTime > endDateTime);
            return r;
        }
        // if we have both dates, but not necessarily both times, then just check the dates
        if (startDate != null && endDate != null) {
            r.ErrorType = "date";
            r.IsValid = !(startDate > endDate);
            return r;
        }

        return r;

    }

    // private functions
    
    // called when start date is changed
    function OnStartDateChanged(sender, eventArgs) {
        ClearTimeIfNoDate(startDatePickerId, startTimePickerId);
        FireDateRangeValidator();
    }

    // called when start time is changed
    function OnStartTimeChanged(sender, eventArgs) {
        EnsureDateIfTime(startDatePickerId, startTimePickerId, endDatePickerId);
        FireDateRangeValidator();
    }

    // called when end date is changed
    function OnEndDateChanged(sender, eventArgs) {
        ClearTimeIfNoDate(endDatePickerId, endTimePickerId);
        FireDateRangeValidator();
    }

    // called when end time is changed
    function OnEndTimeChanged(sender, eventArgs) {
        EnsureDateIfTime(endDatePickerId, endTimePickerId, startDatePickerId);
        FireDateRangeValidator();
    }

    // called when the reg type is changed
    function OnRegTypeChanged(sender) {
        ConfigureTabs();
    }

    // checks that if there is no date there is no time
    // we can't have a time without a date
    function ClearTimeIfNoDate(datePickerId, timePickerId) {

        if (settingDate) return;

        settingTime = true;

        var date = $find(datePickerId).get_selectedDate();
        var time = $find(timePickerId).get_selectedDate();

        if (date == null && time!=null)
            $find(timePickerId).set_selectedDate(null);

        settingTime = false;

    }

    // checks that if we have a time entered, we also have a date
    // we can't have a time without a date
    function EnsureDateIfTime(datePickerId, timePickerId, defaultDatePickerId) {

        if (settingTime) return;

        settingDate = true;

        var date = $find(datePickerId).get_selectedDate();
        var time = $find(timePickerId).get_selectedDate();
        var defaultDate = $find(defaultDatePickerId).get_selectedDate();
        if (defaultDate == null) defaultDate = new Date();

        if (date == null && time != null)
            $find(datePickerId).set_selectedDate(defaultDate);

        settingDate = false;

    }

    // fire the date range validator
    function FireDateRangeValidator() {
        ValidatorValidate($(dateRangeValidator));
    }

    // configure tabs based on current values
    function ConfigureTabs() {

        // hide/show pricing tab
        var priceTab = $find(tabStripId).findTabByValue("pricing");
        var accountsTab = $find(tabStripId).findTabByValue("accounting");
        var regOthers = document.getElementById(regOthersId);
        var regLabel = document.getElementById(roLabelId);
        if (GetRegTypeValue() == "Fee") {
            priceTab.set_enabled(true);
            accountsTab.set_enabled(true);
            regLabel.removeAttribute("disabled"); 
            regOthers.disabled = false;
        } else {
            priceTab.set_enabled(false);
            accountsTab.set_enabled(false);
            regOthers.checked = false;
            regOthers.disabled = true;
            regLabel.setAttribute("disabled", "disabled"); 
        }
        ConfigureCheckBoxes();
    }
    
    // configure checkboxes based on current values
    function ConfigureCheckBoxes() {

        // enable/disable adding guests if not allowed to register someone else
        var regOthers = document.getElementById(regOthersId);
        var addGuests = document.getElementById(allowAddId);
        var addLabel = document.getElementById(agLabelId);
        if (regOthers.checked == true) {
            addGuests.disabled = false;
            addLabel.removeAttribute("disabled"); 
        } else {
            addGuests.checked = false;
            addGuests.disabled = true;
            addLabel.setAttribute("disabled", "disabled"); 
        }
    }
    // get the currently selected regtype value
    function GetRegTypeValue() {
        return jQuery("#" + regTypeRadioButtonListId + " [type=radio]").filter(":checked").val();
    }

}