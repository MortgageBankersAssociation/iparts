<%@ Control Language="C#" AutoEventWireup="True" CodeBehind="EventDisplayDisplay.ascx.cs"
    Inherits="Asi.Web.iParts.Events.EventDisplayDisplay" %>
<%@ Register TagPrefix="telerik" Namespace="Telerik.Web.UI" Assembly="Telerik.Web.UI" %>
<%@ Register TagPrefix="asi" Namespace="Asi.Web.UI.WebControls" Assembly="Asi.Web" %>
<%@ Register TagPrefix="uc1" TagName="AddressSelector" Src="~/iParts/Commerce/AddressSelector/AddressSelectorDisplay.ascx" %>    
<input type="hidden" id="FinderAdderSelectedKey" runat="server" />
<asp:Panel ID="ContentPanel" runat="server" Visible="true" class="">
    <asiweb:TitleBar ID="TitleBar" OptionsMenuBehavior="AlwaysDisplay" runat="server" />
    <div runat="server" id="DataDiv" class="EventDisplay">
        <div class="EventSummary">
            <div runat="server" id="ImageDiv" class="PhotoArea">
                <asp:Image ID="EventImage" runat="server" ImageUrl="" CssClass="MainPhoto" />
                <div>
                    &nbsp;</div>
            </div>
            <div runat="server" id="DesignTimeImageDiv" class="DesignTimePhotoArea" visible="false">
                <asi:StyledLabel runat="server" ID="DesignTypeImageLabel" />
                <div>
                    &nbsp;</div>
            </div>
            <div class="Description">
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
                <div class="DetailsBlock">
                    <div class="Details PanelBlock">
                        <div runat="server" id="WhereDiv" class="PanelField">
                            <div class="PanelFieldLabel">
                                <asi:StyledLabel runat="server" ID="WhereCaption" Text="Where:" AssociatedControlID="LocationData" />
                            </div>
                            <div class="PanelFieldValue">
                                <div runat="server" id="LocationDiv">
                                    <asi:StyledLabel runat="server" ID="LocationData" />
                                </div>
                                <div runat="server" id="AddressDiv">
                                    <asi:StyledLabel runat="server" ID="AddressData" />
                                </div>
                            </div>
                        </div>
                        <div runat="server" id="EmailDiv" class="PanelField">
                            <div class="PanelFieldLabel">
                                <asi:StyledLabel runat="server" ID="EmailCaption" Text="Email:" AssociatedControlID="EmailData" />
                            </div>
                            <div class="PanelFieldValue">
                                <asi:StyledLabel runat="server" ID="EmailData" />
                            </div>
                        </div>
                        <div runat="server" id="PhoneDiv" class="PanelField">
                            <div class="PanelFieldLabel">
                                <asi:StyledLabel runat="server" ID="PhoneCaption" Text="Phone:" AssociatedControlID="PhoneData" />
                            </div>
                            <div class="PanelFieldValue">
                                <asi:StyledLabel runat="server" ID="PhoneData" />
                            </div>
                        </div>
                        <div runat="server" id="WhenDiv" class="PanelField">
                            <div class="PanelFieldLabel">
                                <asi:StyledLabel runat="server" ID="WhenCaption" Text="When:" AssociatedControlID="WhenData" />
                            </div>
                            <div class="PanelFieldValue">
                                <asi:StyledLabel runat="server" ID="WhenData" />
                            </div>
                        </div>
                        <%-- This pricing data only appears when there is only one price cofigured; otherwise pricing matrix appears --%>
                        <div runat="server" id="SinglePriceDiv" class="PanelField">
                            <div class="PanelFieldLabel">
                                <asi:StyledLabel runat="server" ID="SinglePriceCaption" Text="Price:&nbsp;" AssociatedControlID="SinglePriceData" />
                            </div>
                            <div class="PanelFieldValue">
                                <asi:StyledLabel runat="server" ID="SinglePriceData" />
                            </div>
                        </div>
                    </div>
                    <div runat="server" id="RegistrationInfoDiv" visible="false" class="RegistrationArea">
                        
                        <asi:StyledLabel ID="RegistrationStatusCaption" runat="server" AssociatedControlID="RegistrationStatusData" />&nbsp;&nbsp;
                        <asi:StyledLabel ID="RegistrationStatusData" runat="server" />&nbsp;&nbsp;
                        <uc1:AddressSelector runat="Server" id="RegistrantAddressSelector" OverrideFloating="true"
                            PageTitle="" ShowBorder="false" AddressMode="Path" AddressPath="RegistrantInfo">
                        </uc1:AddressSelector>
                        
                        <div runat="server" id="DivRegisterButtons" style="padding-top: 0.5em;">
                            <div runat="server" id="DivRegisterMyselfButton" style="padding-top: 0.5em;">
                                <asi:StyledButton ID="RegisterButton" runat="server" OnClick="RegisterButtonOnClick" />
                            </div>
                            <asi:StyledButton ID="CancelRegistrationButton" runat="server" OnClick="CancelRegistrationButtonOnClick" />
                        </div>
                        <div runat="server" id="DivRegisterSomeoneElseButton" style="padding-top: 0.5em;">
                            <asiweb:StyledButton ID="RegisterSomeoneElseButton" runat="server" Text="Register Someone Else"
                                AutoPostBack="false" CssClass="PrimaryButton" />
                            <div runat="server" id="DivCancelOtherRegistrations" style="padding-top: 0.5em;">
                                <asiweb:StyledLabel runat="server" ID="LabelCancelOtherRegistrations"></asiweb:StyledLabel>
                            </div>
                        </div>
                        <div runat="server" id="DivRegisterButtonError">
                            <asiweb:StyledLabel runat="server" ID="LabelRegisterButtonError"></asiweb:StyledLabel>
                        </div>               
                    </div>
                </div>
            </div>
        </div>
        <div runat="server" id="RegisteredAttendeesDiv" style="text-align: left;">
            <h3 id="RegisteredAttendeesLabel" runat="server">
                Currently Registering</h3>
            <telerik:RadListView ID="RegisteredAttendeesList" runat="server" AllowNodeEditing="False"
                CausesValidation="False" EnableAjaxSkinRendering="False" ItemPlaceholderID="AttendeeItemContainer"
                DataKeyNames="Id" OnSelectedIndexChanged="RegisteredAttendeesListSelectedIndexChanged">
                <LayoutTemplate>
                    <div>
                        <asp:Panel ID="attendeePanel" runat="server">
                            <div>
                                <asp:PlaceHolder ID="AttendeeItemContainer" runat="server"></asp:PlaceHolder>
                            </div>
                        </asp:Panel>
                    </div>
                </LayoutTemplate>
                <ItemTemplate>
                    <div class="PersonDisplay">
                        <asp:LinkButton ID="LinkButton" runat="server" CommandName="Select">
                            <asp:ImageButton ID="RadListViewImage1" runat="server" AlternateText='<%# Eval("Text") %>'
                                CommandName="Select" ImageUrl='<%# Eval("ImageUrl") %>' />
                            <span>
                                <%#Eval("Text") %>
                            </span>
                        </asp:LinkButton>
                    </div>
                </ItemTemplate>
                <SelectedItemTemplate>
                    <div class="PersonDisplay SelectedItem">
                        <asp:Image ID="RadListViewImage2" runat="server" AlternateText='<%# Eval("Text") %>'
                            ImageUrl='<%# Eval("ImageUrl") %>' />
                        <span>
                            <%#Eval("Text") %>
                        </span>
                    </div>
                </SelectedItemTemplate>
            </telerik:RadListView>
        </div>
        <div runat="server" id="PricingDiv" class="PricingData">
            <div runat="server" id="RegistrationOptionsDiv">
                <div runat="server" id="DivSelectRegistrationOption" style="padding-bottom: 0.5em;">
                    <asi:StyledLabel runat="server" ID="LabelSelectRegistrationOption" CssClass="HelperText" />
                </div>
                <telerik:RadGrid runat="server" ID="RegistrationOptionsGrid" CssClass="RegistrationOptionsGrid">
                    <MasterTableView>
                        <Columns>
                            <telerik:GridTemplateColumn HeaderText="RegistrationOptions">
                                <ItemTemplate>
                                    <div style="vertical-align: middle;">
                                        <asiweb:StyledRadioButton runat="server" ID="RadioRegistrationOption" Text='<%# Eval("Function.Name") %>'/>
                                    </div>
                                </ItemTemplate>
                            </telerik:GridTemplateColumn>
                            <telerik:GridNumericColumn DataField="Price" HeaderText="Price" HeaderStyle-HorizontalAlign="Right"
                                ItemStyle-HorizontalAlign="Right" DecimalDigits="2">
                            </telerik:GridNumericColumn>
                            <telerik:GridTemplateColumn Visible="False">
                            </telerik:GridTemplateColumn>
                        </Columns>
                    </MasterTableView>
                </telerik:RadGrid>
            </div>
            <div style="display: none; visibility: hidden;">
                <asp:TextBox runat="server" ID="TextSelectedRegistrationOptionFunctionId" />
                <asp:Button runat="server" ID="ButtonUpdateRegistrationOption" OnClick="ButtonUpdateRegistrationOptionOnClick" />
            </div>
        </div>
        <div runat="server" id="RegistrationActionDiv" style="text-align: right;">
            <%--            <strong>--%>
            <%--                <asi:StyledLabel runat="server" ID="TallyLabel" Style="display: inline" Text='<%#ResourceManager.GetPhrase("RegEventSubtotal", "Subtotal:") %>' />--%>
            <%--                &nbsp;--%>
            <%--                <asi:StyledLabel runat="server" ID="TotalEventPrice" Style="display: inline" />--%>
            <%--            </strong>--%>
            <%--            <br />--%>
            <%--            <br />--%>
            <%--            <asi:StyledButton runat="server" ID="ContinueButton" Text='<%# ResourceManager.GetWord("Continue") %>'--%>
            <%--                OnClick="ContinueButtonOnClick" ToolTip='<%# ResourceManager.GetPhrase("EventRegistrationContinueButtonTooltip", --%>
            <%--                    "Proceed to checkout") %>' />--%>
        </div>
    </div>
    <div style="clear: both;">
    </div>
    <asp:Button ID="RefreshButton" runat="server" CausesValidation="false" Style="display: none"
        OnClick="RefreshButtonClick" />
    <asp:Button ID="DeleteButton" runat="server" CausesValidation="false" Style="display: none"
        OnClick="DeleteButtonClick" />
    <p>
        &nbsp;</p>
</asp:Panel>
