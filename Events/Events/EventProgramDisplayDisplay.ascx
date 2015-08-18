<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="EventProgramDisplayDisplay.ascx.cs"
    Inherits="Asi.Web.iParts.Events.EventProgramDisplayDisplay" %>
<%@ Import Namespace="Asi" %>
<%@ Register TagPrefix="telerik" Namespace="Telerik.Web.UI" Assembly="Telerik.Web.UI" %>
<%@ Register TagPrefix="asi" Namespace="Asi.Web.UI.WebControls" Assembly="Asi.Web" %>
<asp:Panel ID="ContentPanel" runat="server" Visible="true">
    <asiweb:TitleBar ID="TitleBar" Text="<%#PageTitle%>" OptionsMenuBehavior="AlwaysDisplay"
        runat="server" />
    <asp:UpdatePanel runat="server" ID="EventRegisterUpdatePanel">
        <ContentTemplate>
            <asp:Panel ID="CaptionHeader" runat="server">
                <span runat="server" id="SpanProgramsBy">
                    <asiweb:StyledLabel ID="LabelProgramsBy" runat="server" Text="Select Programs by" AssociatedControlID="SelectProgramsBy" />
                    <asiweb:BusinessDropDownList ID="SelectProgramsBy" runat="server" OnSelectedIndexChanged="SelectProgramsBySelectedIndexChanged"
                        AutoPostBack="true" />
                    &nbsp;&nbsp;&nbsp; </span>
                <asiweb:BusinessCheckBox runat="server" ID="CheckBoxItineraryOnly" AutoPostBack="true"
                    OnCheckedChanged="CheckBoxItineraryOnlyCheckedChanged" />
                <div runat="server" id="DivSelectRegistrationOption" style="padding-top: 0.5em;">
                    <asiweb:StyledLabel runat="server" ID="LabelSelectRegistrationOption" CssClass="HelperText"></asiweb:StyledLabel>
                </div>
            </asp:Panel>
            <br />
            <div runat="server" id="DivGroupWrapper" class="ProgramGroup">
                <%-- create specific div for containing certain types of dynamically loaded controls --%>
                <%-- we do this to ensure we don't have any viewstate issues with incompatible control types --%>
                <div runat="server" id="DivPanelListerWrapper">
                    <%-- we add all listers wrapped with panels in here --%>
                </div>
                <div runat="server" id="DivListerWrapper">
                    <%-- we add all listers NOT wrapped with panels in here --%>
                </div>
            </div>
            <div style="display: none;">
                <asp:Button ID="RefreshButton" runat="server" CausesValidation="false" OnClick="RefreshButtonClick" />
                <asp:Button ID="RegisterButton" runat="server" CausesValidation="false" OnClick="RegisterButtonClick" />
                <asp:Button ID="UnregisterButton" runat="server" CausesValidation="false" OnClick="UnregisterButtonClick" />
                <asp:HiddenField ID="FunctionKeyHidden" runat="server" />
            </div>
        </ContentTemplate>
    </asp:UpdatePanel>
</asp:Panel>
