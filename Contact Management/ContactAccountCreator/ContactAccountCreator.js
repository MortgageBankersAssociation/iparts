function AccountCreatorClass() {

    //
    // Variables
    //
    this.SoaErrorLabel;
    this.SoaSuccessLabel;
    this.DivSuccessLabel;

    this.LogonEmail;
    this.EmailTextbox;
    this.ConfirmEmailTextbox;

    this.UserRequiresLogon;
    this.LabelLogon;
    this.Logon;
    this.LabelConfirmLogon;
    this.ConfirmLogon;
    this.LabelPassword;
    this.Password;
    this.LabelConfirmPassword;
    this.ConfirmPassword;
    this.ConfirmLogonCompareValidator;
    this.ConfirmPasswordCompareValidator;
    this.PasswordValidator;
    this.ConfirmPasswordValidator;
    this.LogonValidator;
    this.ConfirmLogonValidator;

    this.CreateAccountType;
    this.OrgOnlyAccountType;
    this.DivFirstName;
    this.LabelFirstName;
    this.FirstName;
    this.DivLastName;
    this.LabelLastName;
    this.LastName;
    this.DivPrefix;
    this.LabelPrefix;
    this.Prefix;
    this.DivSuffix;
    this.LabelSuffix;
    this.Suffix;
    this.FirstNameValidator;
    this.LastNameValidator;

    this.DivOrganizationName;
    this.LabelOrganizationName;
    this.OrganizationName;
    this.OrganizationNameValidator;

    this.CreateLogonPanel;
    this.NewContactKey;

    this.DivEmail;
    this.LabelEmail;
    this.DivConfirmEmail;
    this.LabelConfirmEmail;
    this.EmailValidator;
    this.ConfirmEmailValidator;
    this.ConfirmEmailCompareValidator;

    // Booleans
    this.RequireUserToCreateLogon;
    this.IsOrgOnlyByConfig;
    this.IsContentDesignMode;
    this.IsImis15;



    //
    // Functions
    //
    this.ShowErrors = function () {
        // Clear out any SOA errors so they don't display along with any (client) Validator errors.
        var soaErrLabel = $get(this.SoaErrorLabel);
        if (soaErrLabel != null) soaErrLabel.textContent ? soaErrLabel.textContent = "" : soaErrLabel.innerText = "";

        // Now clear out the success message (in case 1 account was successfully created, 
        // then an error occurs creating another account).
        var successLabel = $get(this.SoaSuccessLabel);
        if (successLabel != null) successLabel.textContent ? successLabel.textContent = "" : successLabel.innerText = "";
        var divSuccessLabel = $get(this.DivSuccessLabel);
        if (divSuccessLabel != null) {
            divSuccessLabel.textContent ? divSuccessLabel.textContent = "" : divSuccessLabel.innerText = "";
            divSuccessLabel.visible = false;
        }        
    };  // End this.ShowErrors = function ()

    // Return the selected Account Type, or an empty string if the configuration is set to Individual Only or Organization Only.
    this.GetCreateAccountTypeValue = function () {
        // We're looking for a radio button value, so we need to replace the underscores, which are used in 'id' attributes, 
        // with dollar signs, which are used in 'name' attributes.
        var accountType = document.getElementsByName(this.CreateAccountType);
        if (accountType != null) {
            var len = accountType.length;
            if (len != undefined) {
                for (var i = 0; i < len; i++) {
                    if (accountType[i].checked) {
                        return accountType[i].value;
                    }
                }
            }
        }
        return "";
    };  // End this.GetCreateAccountTypeValue = function ()

    // Email logic
    this.VerifyEmail = function () {
        this.DefaultLogonText();
        this.SetEmailValidators();
    };  // End this.VerifyEmail = function ()

    // If the Email and Confirm Email fields are equal, then set the email as the Logon value
    // (only really applies if UseEmailAsLogon is checked in configuration).
    this.DefaultLogonText = function () {
        var logonEmailLabel = $get(this.LogonEmail);
        if (logonEmailLabel == null) return;

        logonEmailLabel.textContent != null ? logonEmailLabel.textContent = "" : logonEmailLabel.innerText = ""; // Default

        var emailTextbox = $get(this.EmailTextbox);
        var confirmEmailTextbox = $get(this.ConfirmEmailTextbox);
        if (emailTextbox != null && confirmEmailTextbox != null) {
            var emailValue = emailTextbox.value;
            var confirmEmailValue = confirmEmailTextbox.value;
            if (emailValue == confirmEmailValue)
                logonEmailLabel.textContent != null ? logonEmailLabel.textContent = confirmEmailValue : logonEmailLabel.innerText = confirmEmailValue;
        }
    };  // End this.DefaultLogonText = function ()

    // Email is not required for Organizations, but if one of the email fields has a value,
    // then make both email fields required.
    this.SetEmailValidators = function () {
        var emailTextbox = $get(this.EmailTextbox);

        // This logic only applies if the email fields are not 'explicitly' required (for Organizations, in other words).
        var accountTypeValue = this.GetCreateAccountTypeValue();
        var isOrgOnly = (this.IsOrgOnlyByConfig || accountTypeValue == this.OrgOnlyAccountType);
        if (!isOrgOnly) return;

        var confirmEmailTextbox = $get(this.ConfirmEmailTextbox);

        if (emailTextbox != null && confirmEmailTextbox != null) {
            var emailValue = emailTextbox.value;
            var confirmEmailValue = confirmEmailTextbox.value;

            // If either email field isn't blank, or both aren't blank but aren't equal,
            // then, make the email fields required.
            var emailFieldsAreRequired = false;
            if (confirmEmailValue != emailValue)
                emailFieldsAreRequired = true;

            // All email validators are either required or not, but just mark the email field label w/o a value required.
            var emailValidatorFieldIds = new Array(this.EmailValidator, this.ConfirmEmailValidator, this.ConfirmEmailCompareValidator);
            if (!emailFieldsAreRequired)
                emailValidatorFieldIds.push(this.LabelEmail, this.LabelConfirmEmail)
            else {
                if (emailValue == "")
                    emailValidatorFieldIds.push(this.LabelEmail);

                if (confirmEmailValue == "")
                    emailValidatorFieldIds.push(this.LabelConfirmEmail);
            }

            var counter = 0;
            for (counter in emailValidatorFieldIds) {
                var fieldId = emailValidatorFieldIds[counter];
                var field = $get(fieldId);
                if (field == null) continue;

                if (field.tagName != null) {
                    if (field.tagName.toLowerCase() == "label")
                        emailFieldsAreRequired ? field.className = "Required" : field.className = null;  // Set the style for labels
                }
                if (field.isvalid != null || field.controltovalidate != null) { // It's a validator
                    ValidatorEnable(field, emailFieldsAreRequired); // Enable/disable the validator
                    ValidatorValidate(field); // Call the validator
                }
            }
        }
    };  // End this.SetEmailValidators = function ()

    // If the Create Logon section is not configured to be required, then let the user explicitly decide
    // if they want to create a logon by enabling/disabling the logon fields.
    this.ToggleLogon = function () {
        var userRequiresLogon = $get(this.UserRequiresLogon);
        if (userRequiresLogon == null) return;

        var createLogonFieldIds = [ // Put validators at the end
                                    this.LabelLogon,
                                    this.Logon,
                                    this.LogonEmail,
                                    this.LabelConfirmLogon,
                                    this.ConfirmLogon,
                                    this.LabelPassword,
                                    this.Password,
                                    this.LabelConfirmPassword,
                                    this.ConfirmPassword,
                                    this.ConfirmLogonCompareValidator,
                                    this.ConfirmPasswordCompareValidator,
                                    this.PasswordValidator,
                                    this.ConfirmPasswordValidator,
                                    this.LogonValidator,
                                    this.ConfirmLogonValidator
                                  ];

        var counter = 0;
        for (counter in createLogonFieldIds) {
            var fieldId = createLogonFieldIds[counter];
            var field = $get(fieldId);
            if (field == null) continue;

            if (field.type != null) {
                if (field.type == "text" || field.type == "password")
                    field.value = ""; // Blank out text fields
            }
            else if (field.tagName != null) {
                if (field.tagName.toLowerCase() == "label")
                    userRequiresLogon.checked ? field.className = "Required" : field.className = null;  // Set the style for labels
            }

            if (field.isvalid != null || field.controltovalidate != null) { // It's a validator
                ValidatorEnable(field, userRequiresLogon.checked); // Enable/disable the validator
                ValidatorValidate(field); // Since the fields are now blank, the validator will be true, so there won't be an error message that displays
                field.isvalid = true; // This is needed so the Required validators don't display an error message
                field.style.display = "none"; // This is needed so the Required validators don't display an error message
            }

            // For Firefox/Safari to work correctly (e.g. Labels do not appear disabled when they're not), the disabled attribute
            // must be explicitly set and removed; you can't just do "field.disabled = true|false".
            userRequiresLogon.checked ? field.removeAttribute("disabled") : field.setAttribute("disabled", "disabled");
        }

        // Special case for setting the style for the Logon field/display.
        var labelLogon = $get(this.LabelLogon);
        if (labelLogon != null) {
            // If the Logon label is just displaying the email as the Logon, then there is no required field.
            var logon = $get(this.Logon);
            logon == null || logon.disabled == true ? labelLogon.className = null : labelLogon.className = "Required";
        }
    };  // End this.ToggleLogon = function ()

    // Toggle the 'required' fields for Individual vs Organization account types.
    this.ToggleAccountTypeFields = function () {
        var accountTypeValue = this.GetCreateAccountTypeValue();
        var isNotOrgOnly = !(this.IsOrgOnlyByConfig || accountTypeValue == this.OrgOnlyAccountType);

        //
        // Enable/Disable fields for Individuals.
        //
        var createIndividualFieldIds = [   // Put validators at the end
                                            this.DivFirstName,
                                            this.LabelFirstName,
                                            this.FirstName,
                                            this.DivLastName,
                                            this.LabelLastName,
                                            this.LastName,
                                            this.DivPrefix,
                                            this.LabelPrefix,
                                            this.Prefix,
                                            this.DivSuffix,
                                            this.LabelSuffix,
                                            this.Suffix,
                                            this.FirstNameValidator,
                                            this.LastNameValidator
                                        ];

        var counter = 0;
        for (counter in createIndividualFieldIds) {
            var fieldId = createIndividualFieldIds[counter];
            var field = $get(fieldId);
            if (field == null) continue;

            if (field.isvalid != null || field.controltovalidate != null) { // It's a validator
                ValidatorEnable(field, isNotOrgOnly); // Enable/disable the validator
                ValidatorValidate(field); // Call the validator
                field.isvalid = true; // This is needed so the Required validators don't display an error message
                field.style.display = "none"; // This is needed so the Required validators don't display an error message
            }
            else {
                if (isNotOrgOnly) {
                    field.style.display = "inline";
                    field.removeAttribute("disabled")
                }
                else {
                    field.style.display = "none";
                    field.setAttribute("disabled", "disabled");
                }
            }
        }

        //
        // Enable/Disable fields for Organizations.
        //
        var createOrganizationFieldIds = [  // Put validators at the end
                                            this.DivOrganizationName,
                                            this.LabelOrganizationName,
                                            this.OrganizationName,
                                            this.OrganizationNameValidator
                                         ];

        var counter = 0;
        for (counter in createOrganizationFieldIds) {
            var fieldId = createOrganizationFieldIds[counter];
            var field = $get(fieldId);
            if (field == null) continue;

            if (field.isvalid != null || field.controltovalidate != null) { // It's a validator
                ValidatorEnable(field, !isNotOrgOnly); // Enable/disable the validator
                ValidatorValidate(field); // Call the validator
                field.isvalid = true; // This is needed so the Required validators don't display an error message
                field.style.display = "none"; // This is needed so the Required validators don't display an error message
            }
            else {
                if (!isNotOrgOnly) {
                    field.style.display = "inline";
                    field.removeAttribute("disabled");
                }
                else {
                    field.style.display = "none";
                    field.setAttribute("disabled", "disabled");
                }
            }
        }

        //
        // Enable/Disable the Create Logon section
        //
        var createLogonFieldIds = [  // Put validators at the end
                                    this.CreateLogonPanel,
                                    this.ConfirmLogonCompareValidator,
                                    this.ConfirmPasswordCompareValidator,
                                    this.PasswordValidator,
                                    this.ConfirmPasswordValidator,
                                    this.LogonValidator,
                                    this.ConfirmLogonValidator
                                  ];

        var counter = 0;
        for (counter in createLogonFieldIds) {
            var fieldId = createLogonFieldIds[counter];
            var field = $get(fieldId);
            if (field == null) continue;

            if (field.isvalid != null || field.controltovalidate != null) { // It's a validator
                var userRequiresLogon = $get(this.UserRequiresLogon);
                var doesUserRequiresLogon = (userRequiresLogon != null) ? userRequiresLogon.checked : false;
                ValidatorEnable(field, (isNotOrgOnly && (doesUserRequiresLogon || this.RequireUserToCreateLogon) && !this.IsContentDesignMode)); // Enable/disable the validator
                ValidatorValidate(field); // Call the validator
                field.isvalid = true; // This is needed so the Required validators don't display an error message
                field.style.display = "none"; // This is needed so the Required validators don't display an error message
            }
            else {
                if (isNotOrgOnly) {
                    field.style.display = "inline";
                    field.removeAttribute("disabled");
                }
                else {
                    field.style.display = "none";
                    field.setAttribute("disabled", "disabled");
                }
            }
        }

        //
        // Email fields are not required for Organizations, and should not even be asked in i100.
        //
        var createEmailFieldIds = [  // Put validators at the end
                                    this.DivEmail,
                                    this.LabelEmail,
                                    this.LabelConfirmEmail,
                                    this.EmailTextbox,
                                    this.DivConfirmEmail,
                                    this.ConfirmEmailTextbox,
                                    this.EmailValidator,
                                    this.ConfirmEmailValidator,
                                    this.ConfirmEmailCompareValidator
                                  ];

        var counter = 0;
        for (counter in createEmailFieldIds) {
            var fieldId = createEmailFieldIds[counter];
            var field = $get(fieldId);
            if (field == null) continue;

            if (field.isvalid != null || field.controltovalidate != null) { // It's a validator
                ValidatorEnable(field, (!this.IsContentDesignMode && isNotOrgOnly)); // Enable/disable the validator
                ValidatorValidate(field); // Call the validator
                field.isvalid = true; // This is needed so the Required validators don't display an error message
                field.style.display = "none"; // This is needed so the Required validators don't display an error message
            }
            else {
                if (isNotOrgOnly) {
                    if (field.tagName != null) {
                        if (field.tagName.toLowerCase() == "label") field.className = "Required";
                    }
                    if (!this.IsImis15) field.style.display = "inline";
                }
                else {
                    if (field.tagName != null) {
                        if (field.tagName.toLowerCase() == "label") field.className = null;
                    }
                    if (!this.IsImis15) field.style.display = "none";
                }
            }
        }
    }; // End this.ToggleAccountTypeFields = function ()
    //function used to get newly created contact key, pass value & close pop up window
    this.ReturnAccountCreated = function() {        
        //check if in PartyFinderAdder   
        var queryString = '&' + (document.location + '?').split('?')[1];
        if (queryString.match( /PartyType=/ )) {
            var oWindow = GetRadWindow();
            var hiddenKey = $get(this.NewContactKey);
            if (hiddenKey) {
                oWindow.result = hiddenKey.value;
                oWindow.Close();
            }
        }
    };
} // End function AccountCreatorClass()
