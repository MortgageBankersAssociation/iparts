<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="FunctionDisplayDisplay.ascx.cs" Inherits="Asi.Web.iParts.Events.FunctionDisplayDisplay" %>
<%@ Register TagPrefix="telerik" Namespace="Telerik.Web.UI" Assembly="Telerik.Web.UI" %>
<%@ Register TagPrefix="asi" Namespace="Asi.Web.UI.WebControls" Assembly="Asi.Web" %>
<asp:Panel ID="ContentPanel" runat="server" Visible="true" class="">
    <asiweb:TitleBar ID="TitleBar" OptionsMenuBehavior="AlwaysDisplay" runat="server" />
    <div runat="server" id="TitleDiv">
        <asi:StyledLabel runat="server" ID="TitleText" />
    </div>
    <div runat="server" id="DataDiv">
        <div runat="server" id="ImageDiv" class="PanelField">
            <asp:Image ID="FunctionImage" runat="server" ImageUrl="" />
            <div>
                &nbsp;</div>
        </div>
        <div runat="server" id="DesignTimeImageDiv" class="PanelField" visible="false">
            <asi:StyledLabel runat="server" ID="DesignTypeImageLabel" />
            <div>
                &nbsp;</div>
        </div>
        <div runat="server" id="DescriptionDiv" class="PanelField">
            <asi:StyledLabel runat="server" ID="DescriptionData" />
            <div>
                &nbsp;</div>
        </div>
        <div runat="server" id="AdditionalInfoDiv" class="PanelField">
            <asi:StyledLabel runat="server" ID="AdditionalInfoHtmlData" />
            <div>
                &nbsp;</div>
        </div>
        <div runat="server" id="DesignTimeDescriptionDiv" class="PanelField" visible="false">
            <asi:StyledLabel runat="server" ID="DesignTimeDescriptionLabel" />
            <div>
                &nbsp;</div>
        </div>
        <div runat="server" id="WhereDiv" class="PanelField">
            <div style="display: inline; float: left;">
                <strong>
                    <asi:StyledLabel runat="server" ID="WhereCaption" Text="Where:&nbsp;" /></strong>
            </div>
            <div style="display: inline; float: left;">
                <div runat="server" id="LocationDiv">
                    <asi:StyledLabel runat="server" ID="LocationData" />
                </div>
                <div runat="server" id="AddressDiv">
                    <asi:StyledLabel runat="server" ID="AddressData" Text="" />
                </div>
            </div>
        </div>
        <div style="clear: both;">
        </div>
        <div runat="server" id="EmailDiv" class="PanelField">
        <strong>
                <asi:StyledLabel runat="server" ID="EmailCaption" Text="Email:" /></strong>
            <asi:StyledLabel runat="server" ID="EmailData" Text="" />
        </div>
        <div runat="server" id="PhoneDiv" class="PanelField">
        <strong>
                <asi:StyledLabel runat="server" ID="PhoneCaption" Text="Phone:" /></strong>
            <asi:StyledLabel runat="server" ID="PhoneData" Text="" />
        </div>
        <div runat="server" id="WhenDiv" class="PanelField">
            <strong>
                <asi:StyledLabel runat="server" ID="WhenCaption" Text="When:" /></strong>
            <asi:StyledLabel runat="server" ID="WhenData" />
        </div>
        <div runat="server" id="PriceDiv" class="PanelField">
            <strong>
                <asi:StyledLabel runat="server" ID="PriceCaption" Text="Price:" /></strong>
            <asi:StyledLabel runat="server" ID="PriceData" />
        </div>
        <div runat="server" id="RegistrationInfoDiv" visible="false" class="PanelField">
            <div>
                <asp:LinkButton ID="AddLinkButton" runat="server" OnClick="AddButtonOnClick" />
                <asp:LinkButton ID="RemoveLinkButton" runat="server" OnClick="RemoveButtonOnClick" />            
            </div>  
        </div>
        <div runat="server" id="FunctionUnavailableMessageDiv" visible="false" class="PanelField">
            <asi:StyledLabel runat="server" ID="FunctionUnavailableMessageLabel" />
        </div>  
    </div>
    <div style="clear: both" />
    <div style="display:none;visibility:hidden;">
        <asp:Button ID="RefreshButton" runat="server" CausesValidation="false" OnClick="RefreshButtonClick" />
        <asp:Button ID="RefreshDirtyButton" runat="server" CausesValidation="false" OnClick="RefreshDirtyButtonClick" />
        <asp:Button ID="DeleteButton" runat="server" CausesValidation="false" OnClick="DeleteButtonClick" />
    </div>
</asp:Panel>    
