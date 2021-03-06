﻿<%@ Control Language="C#" AutoEventWireup="True" CodeBehind="ContentCollectionOrganizerEdit.ascx.cs"
    Inherits="Asi.Web.iParts.Common.ContentCollectionOrganizer.ContentCollectionOrganizerEdit" %>
<%@ Register Assembly="System.Web.Extensions, Version=3.5.0.0, Culture=neutral, PublicKeyToken=31bf3856ad364e35"
    Namespace="System.Web.UI" TagPrefix="asp" %>
<%@ Register Namespace="Asi.Web.UI.WebControls" TagPrefix="asiweb" Assembly="Asi.Web" %>
<%@ Register Namespace="Telerik.Web.UI" TagPrefix="telerik" Assembly="Telerik.Web.UI" %>

<script type="text/javascript">
    //<![CDATA[
    var _KeyControlClientID = ""; //ID of the hidden field that stores ID
    var _PanelControlClientlID = ""; // ID if the display element (textbox) to display selection results
    var _RefresherID = ""; // Id of the hidden button which will refresh the form

    // Main calling function that will display object browser window.
    function SelectDocumentObject(OpenParams, KeyControlID, PanelControlID, RefreshControlID) {
        // First of all we need to find Proper Client IDs so getElementById in the call back function will work

        _KeyControlClientID = FindControlbyID(KeyControlID);
        _PanelControlClientlID = FindControlbyID(PanelControlID);
        _RefresherID = FindControlbyID(RefreshControlID);

        OpenObjectBrowser(OpenParams, SetDocumentObject, true);
    }

    // Updates default Checkbox for all Default Tab Checkboxes
    function ResetCheckBoxes(ControlPrefix, CurrentTab) {
        // ControlPrefix - This is the name of the control (without index) that displays defaulttab ;
        // So in order to get proper control we need to do following:
        // ControlPrefix + Index + _DefaultTab

        var ctrlID = FindControlbyID(ControlPrefix + CurrentTab + "_DefaultTab");
        var elm = document.getElementById(ctrlID);
        if (elm != null && elm.checked) {
            // Need to uncheck all other checkboxes
            var i = 1;
            while (true) {
                var ctrlID2 = FindControlbyID(ControlPrefix + i + "_DefaultTab")
                if (ctrlID2 == "")
                    break;
                // Have control, check if it is not the same as current
                if (i != CurrentTab) {
                    var elm = document.getElementById(ctrlID2);
                    if (elm != null && elm.checked)
                        elm.checked = false;
                }
                i++;
            }

        }
    }

    // Returns client id of the form element with id ending : <ControlID>
    function FindControlbyID(ControlID) {
        var _controlID = "";
        // Loop through all controls on the form and find controls that will end with        
        var _tmp = "";
        for (i = 0; i < document.forms[0].elements.length; i++) {
            _tmp = document.forms[0].elements[i].id;
            //            alert("ID: "  + _tmp);
            if (_tmp.length >= ControlID.length && _tmp.substr(_tmp.length - ControlID.length, _tmp.length) == ControlID) {
                _controlID = document.forms[0].elements[i].id;
                break;
            }
        }
        return _controlID;
    }

    /// Returns client id of the form hyperlink control with id ending : <ControlID>
    function FindHyperlinkbyID(ControlID) {
        var _controlID = "";
        // Loop through all controls on the form and find controls that will end with  
        var _tmp = "";
        var links = document.getElementsByTagName("a");

        if (links != null) {
            for (i = 0; i < links.length; i++) {
                _tmp = links[i].id;
                if (_tmp.length >= ControlID.length && _tmp.substr(_tmp.length - ControlID.length, _tmp.length) == ControlID) {
                    _controlID = links[i].id;
                    break;
                }
            }
        }
        return _controlID;
    }

    // Call back function
    function SetDocumentObject(window, documentKey) {

        var helper = document.getElementById(_KeyControlClientID);
        var helper2 = document.getElementById(_PanelControlClientlID);

        if (window.result != null && window.result != "") {
            helper.value = window.result;
            helper2.value = window.SelectedDocumentPath;
            // Submit the form so it will be refreshed.
            if (document.getElementById(_RefresherID) != null) {
                document.getElementById(_RefresherID).click();
            }

        }
    }

    // Custom validation function to use instead of RequiredFieldValidator due to very odd errors in IE.
    function ValidateTabName(source, arguments) {
        var elm = document.getElementById(source.controltovalidate);
        if (arguments.Value != null && arguments.Value.trim() != "") {
            arguments.IsValid = true;
        }
        else {
            arguments.IsValid = false;
            if (elm != null) {
                // Use try/catch to prevent errors
                try { elm.focus(); }
                catch (exc) { }
            }
        }
    }

    //Trim function for string.
    String.prototype.trim = function() {
        return this.replace(/^\s*/, "").replace(/\s*$/, "");
    }

    //]]>            
</script>

<asp:UpdatePanel runat="server" ID="UpdatePanel1">
    <ContentTemplate>
        <asiweb:PanelTemplateControl ID="ContainerPanel" runat="server" FieldSet="true" ShowHeader="false" BorderStyle="None">
        <%-- Page Title --%>
        <asiweb:smartcontrol ID="TitleControl" runat="server" BoundPropertyName="PageTitle" DisplayCaption="true" ></asiweb:smartcontrol>
        <div class="AutoWidth">
            <%--Do not render--%>
            <asiweb:SmartControl ID="DoNotRenderInDesignModeControlControl" runat="server" BoundPropertyName="DoNotRenderInDesignMode" DisplayCaption="true" PositionCaption="Right" />
            <%--Show Border--%>
            <asiweb:SmartControl ID="ShowBorderControl" runat="server" BoundPropertyName="ShowBorder" DisplayCaption="true" PositionCaption="Right"/>            
            <%-- Wizard Mode --%>
            <asiweb:smartcontrol ID="WizardModeControl" runat="server" BoundPropertyName="WizardMode" DisplayCaption="true" PositionCaption="Right" AutoPostBack="true" OnDataChange="WizardModeControl_DataChange"></asiweb:smartcontrol>
            <%-- Sequential Steps --%>           
            <asiweb:smartcontrol ID="SequentialStepsControl" runat="server" BoundPropertyName="SequentialSteps" DisplayCaption="true" PositionCaption="Right" AutoPostBack="true" OnDataChange="SequentialStepsControl_DataChange"></asiweb:smartcontrol> 
            <%-- Display Style --%>
            <asiweb:smartcontrol ID="DisplayStyleControl" runat="server" BoundPropertyName="DisplayStyle" DisplayCaption="true"></asiweb:smartcontrol>
        </div>
        <div style="clear: both;"></div>
        <%--Tab Settings--%>
         <div id="div_TabSettings" runat="server">
            <div id="div_TabContainer" class="PanelFieldValue" runat="server">
                <asp:Panel ID="panTabs" runat="server" >
                    <div>
                        <telerik:RadTabStrip runat="server" ID="radTab" AutoPostBack="false" SelectedIndex="0" MultiPageID="radPage" CausesValidation="true" EnableViewState="true" 
                            ShowBaseLine="true" OnTabClick="Tabs_TabClick" >
                        </telerik:RadTabStrip>
                        <telerik:RadMultiPage ID="radPage" runat="server" SelectedIndex="0" EnableViewState="true" BorderWidth="0"></telerik:RadMultiPage>
                    </div>
                </asp:Panel>
            </div>
        </div>

        <asp:Label ID="debug" runat="server"></asp:Label>
        
        </asiweb:PanelTemplateControl>
    </ContentTemplate>
</asp:UpdatePanel>
