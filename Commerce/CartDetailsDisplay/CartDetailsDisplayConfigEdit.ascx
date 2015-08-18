<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="CartDetailsDisplayConfigEdit.ascx.cs" Inherits="Asi.Web.iParts.Commerce.CartDetailsDisplay.CartDetailsDisplayConfigEdit" %>
<%@ Register TagPrefix="asiweb" Namespace="Asi.Web.UI.WebControls" %>


<script id="SelectDocument" type="text/javascript">
    //<![CDATA[
    function SelectDocumentObjectProduct() {
        OpenObjectBrowser('TypeFilter=CON&DocumentPath=@', SetDocumentObjectProduct, true);
    }
    function SetDocumentObjectProduct(window) {
        if (!window.result)
            return;
        var documentKey = window.result;
        if (documentKey != null && documentKey != "") {
            document.getElementById(HiddenDocumentKeyProduct_ClientID).value = documentKey;
            document.getElementById(ResetButtonProduct_ClientID).style.display = "inline";
        }

        var documentName = window.SelectedDocumentName;
        if (documentName != null && documentName != "")
            document.getElementById(DocumentNameLabelProduct_ClientID).firstChild.nodeValue = documentName;
    }
    function ResetDocumentObjectProduct() {
        document.getElementById(HiddenDocumentKeyProduct_ClientID).value = "";
        document.getElementById(ResetButtonProduct_ClientID).style.display = "none";
        document.getElementById(DocumentNameLabelProduct_ClientID).firstChild.nodeValue = NotSelectedText;
    }

    function SelectDocumentObjectEvent() {
        OpenObjectBrowser('TypeFilter=CON&DocumentPath=@', SetDocumentObjectEvent, true);
    }
    function SetDocumentObjectEvent(window) {
        if (!window.result)
            return;
        var documentKey = window.result;
        if (documentKey != null && documentKey != "") {
            document.getElementById(HiddenDocumentKeyEvent_ClientID).value = documentKey;
            document.getElementById(ResetButtonEvent_ClientID).style.display = "inline";
        }

        var documentName = window.SelectedDocumentName;
        if (documentName != null && documentName != "")
            document.getElementById(DocumentNameLabelEvent_ClientID).firstChild.nodeValue = documentName;
    }
    function ResetDocumentObjectEvent() {
        document.getElementById(HiddenDocumentKeyEvent_ClientID).value = "";
        document.getElementById(ResetButtonEvent_ClientID).style.display = "none";
        document.getElementById(DocumentNameLabelEvent_ClientID).firstChild.nodeValue = NotSelectedText;
    }


    //]]>
</script>

<asiweb:paneltemplatecontrol ID="ContainerPanel" runat="server" FieldSet="true" ShowHeader="false" BorderStyle="None">
    <asp:panel ID="panProductContentEdit"  runat="server" CssClass="PanelField">
            <asp:label id="CaptionProduct" runat="server" Text="" AssociatedControlID="BrowseButtonProduct" />
            <div class="PanelFieldValue FloatLeft">
                <asiweb:StyledButton id="BrowseButtonProduct" runat="server" AutoPostBack="false" onclientclick="SelectDocumentObjectProduct()" />
                <asiweb:StyledButton id="ResetButtonProduct" runat="server" AutoPostBack="false" onclientclick="ResetDocumentObjectProduct()" />
                <asp:label id="DocumentNameLabelProduct" runat="server"/>
            </div>
            <input id="HiddenDocumentKeyProduct" type="hidden" runat="server" enableviewstate="true" />
    </asp:panel>
    <asp:panel ID="panEventContentEdit"  runat="server" CssClass="PanelField">
            <div style="clear:both"></div>
            <asp:label id="CaptionEvent" runat="server" Text="" AssociatedControlID="BrowseButtonEvent" />
            <div class="PanelFieldValue FloatLeft">
                <asiweb:StyledButton id="BrowseButtonEvent" runat="server" AutoPostBack="false" onclientclick="SelectDocumentObjectEvent()" />
                <asiweb:StyledButton id="ResetButtonEvent" runat="server" AutoPostBack="false" onclientclick="ResetDocumentObjectEvent()" />
                <asp:label id="DocumentNameLabelEvent" runat="server"/>
            </div>
            <input id="HiddenDocumentKeyEvent" type="hidden" runat="server" enableviewstate="true" />
    </asp:panel>

 </asiweb:paneltemplatecontrol>