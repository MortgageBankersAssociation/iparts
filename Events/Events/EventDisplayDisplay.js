function Asi_Web_iParts_Events_EventDisplayDisplay(registrationOptionsGridId,selectedRegistrationOptionHiddenId,updateRegistrationOptionButtonId) {

    var RefreshButtonId = null;
    var FinderAdderSelectedKeyId = null;

    // public functions

    // edit an event
    this.EditEvent = function (eventKey, url, refreshButtonId) {
        if (url == null || url == "") return;
        if (url.indexOf("?") >= 0)
            url += "&EventKey=" + eventKey;
        else
            url += "?EventKey=" + eventKey;
        RefreshButtonId = refreshButtonId;
        var dialog = ShowDialog(url, null, 800, 800, "Edit Event", null, "E", null, null, false, false, EventEditOnClose, null);

        // dialog.set_destroyOnClose(true);
    };

    // delete an event
    this.DeleteEvent = function (deleteButtonId, confirmMessage) {
        if (confirm(confirmMessage)) {
            $(deleteButtonId).click();
        }
    };

    // register someone else
    this.RegisterSomeoneElse = function (queryPath,finderAdderSelectedKeyId, addguests) {
        FinderAdderSelectedKeyId = finderAdderSelectedKeyId;
        OpenPartyFinderAdderWithQueryFilter(FinderAdderCallback, true, null, queryPath, null, null, null, "", null, null, addguests, "1");
    }

    // a registration option radio button has been clicked
    this.RegistrationOptionOnClick = function (sender, functionId) {
        // ensure only the sender radio button is checked
        jQuery("#" + registrationOptionsGridId + " [type=radio]").removeAttr("checked");
        sender.checked = true;
        // if the selected function hasn't changed then there is nothing to do
        if ($(selectedRegistrationOptionHiddenId).value == functionId) return;
        // save the selected function
        $(selectedRegistrationOptionHiddenId).value = functionId;
        $(updateRegistrationOptionButtonId).click();
    }

    // private functions

    // called when closing the event edit popup
    function EventEditOnClose(radWin) {
        var refresh = false;
        if (radWin != null && typeof(radWin.IsDirty) == 'boolean') {
            refresh = radWin.IsDirty;
        }
        else {
            // if for some reason we dont get a rad window then assume we should refresh
            refresh = true;
        }
        if (refresh && RefreshButtonId != null)
            $(RefreshButtonId).click();
    };

    // called when selecting a contact in the finder adder
    function FinderAdderCallback(radwindow) {
        if (radwindow.result && FinderAdderSelectedKeyId!=null) {
            $(FinderAdderSelectedKeyId).value = radwindow.result;
            document.forms[0].submit();
        }
    }
    
}

