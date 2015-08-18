function Asi_Web_iParts_Events_EventProgramDisplayDisplay(refreshButtonId, registerButtonId, unregisterButtonId, functionKeyHiddenId, registerFunctionHyperlinkMarkerClass) {

    // public functions

    // display a function
    this.DisplayFunction = function (eventKey, functionKey, registrantId, url) {
        if (url == null || url == "") return;
        if (url.indexOf("?") >= 0)
            url += "&EventKey=" + eventKey + "&FunctionKey=" + functionKey + "&RegistrantId=" + registrantId;
        else
            url += "?EventKey=" + eventKey + "&FunctionKey=" + functionKey + "&RegistrantId=" + registrantId;
        var dialog = ShowDialog(url, null, 800, 800, "Display Program Item", null, "E", null, null, false, false, DisplayFunctionOnClose, null);

        // dialog.set_destroyOnClose(true);
    };

    // add a function
    this.AddFunction = function (eventKey, url, refreshButtonId) {
        if (url == null || url == "") return;
        if (url.indexOf("?") >= 0)
            url += "&EventKey=" + eventKey;
        else
            url += "?EventKey=" + eventKey;
        var dialog = ShowDialog(url, null, 800, 800, "Add Function", null, "E", null, null, false, false, AddFunctionOnClose, null);
    };

    // register for a function or add to itinerary
    this.RegisterFunction = function (eventKey, functionKey) {
        if (functionKeyHiddenId != null)
            $(functionKeyHiddenId).value = functionKey;
        if (registerButtonId != null) {
            DisableRegisterFunctionHyperLinks();
            $(registerButtonId).click();
        }
    }

    // unregister for a function or remove from itinerary
    this.UnregisterFunction = function (eventKey, functionKey) {
        if (functionKeyHiddenId != null)
            $(functionKeyHiddenId).value = functionKey;
        if (unregisterButtonId != null) {
            DisableRegisterFunctionHyperLinks();
            $(unregisterButtonId).click();
        }
    }

    // private functions

    // called when closing the function edit popup
    function AddFunctionOnClose(radWin) {
        var refresh = false;
        if (radWin != null && typeof (radWin.IsDirty) == 'boolean') {
            refresh = radWin.IsDirty;
        }
        else {
            // if for some reason we dont get a rad window then assume we should refresh
            refresh = true;
        }
        if (refresh && refreshButtonId != null)
            $(refreshButtonId).click();
    };

    // called when closing the function display popup
    function DisplayFunctionOnClose(radWin) {
        var refresh = false;
        if (radWin != null && typeof (radWin.IsDirty) == 'boolean') {
            refresh = radWin.IsDirty;
        }
        else {
            // if for some reason we dont get a rad window then assume we should refresh
            refresh = true;
        }
        if (refresh && refreshButtonId != null)
            $(refreshButtonId).click();
    };

    // disable the add/remove registration/itinerary hyperlinks in the program listing
    // permanently disables them, the page must postback in order for them to be restored
    function DisableRegisterFunctionHyperLinks() {
        jQuery("." + registerFunctionHyperlinkMarkerClass).removeAttr("href").css("color", "#bebebe");
    }

}

