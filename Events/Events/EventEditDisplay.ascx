<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="EventEditDisplay.ascx.cs"
    Inherits="Asi.Web.iParts.Events.EventEditDisplay" %>
<%@ Register TagPrefix="telerik" Namespace="Telerik.Web.UI" Assembly="Telerik.Web.UI" %>
<%@ Register TagPrefix="asi" Namespace="Asi.Web.UI.WebControls" Assembly="Asi.Web" %>
<%@ Register TagPrefix="telerik" Namespace="Telerik.Web.UI" Assembly="Telerik.Web.UI" %>
<%@ Register TagPrefix="asiCommon" TagName="FileUpload" Src="Common/BusinessFileUpload.ascx" %>
<%@ Register TagPrefix="event" TagName="Pricing" Src="EventFunctionPricing.ascx" %>
<%@ Register tagPrefix="asiCommon" tagName="AccountInfo" src="Common/AccountingInformation.ascx" %>
<%@ Register TagPrefix="asiEvent" TagName="GeneralLedger" Src="Common/GeneralLedgerAccountDisplay.ascx" %>
<%@ Import Namespace="Asi" %>

<asp:Panel ID="ContentPanel" runat="server" Visible="true">
    <div runat="server" id="DivData">
        <asp:HiddenField runat="server" ID="HiddenLastSavedEventKey" />
        <asp:HiddenField runat="server" ID="HiddenTitle" />
        <telerik:RadTabStrip ID="RadTabStrip1" runat="server" MultiPageID="RadMultiPage1"
            SelectedIndex="0" Visible="true" AutoPostBack="false">
            <Tabs>
                <telerik:RadTab Text='<%# ResourceManager.GetWord("Info") %>' Value="info" />
                <telerik:RadTab Text='<%# ResourceManager.GetWord("Pricing") %>' Value="pricing" />
                <telerik:RadTab Text='<%# ResourceManager.GetWord("Accounting") %>' Value="accounting" />
            </Tabs>
        </telerik:RadTabStrip>
        <telerik:RadMultiPage ID="RadMultipage1" runat="server" SelectedIndex="0">
            <telerik:RadPageView ID="RadPageViewInfo" runat="server" EnableViewState="true">
                <asi:PanelTemplateControl ID="PanelGeneralInfo" runat="server" TemplateTitle='<%# ResourceManager.GetPhrase("GeneralInfo", "General Information") %>'
                    Collapsible="false" FieldSet="true">

						<div class="PanelField Left">
                            <div style="display: inline;">
                                <asiweb:StyledLabel runat="server" ID="LabelName" CssClass="Required" AssociatedControlID="TextName"></asiweb:StyledLabel>
                            </div>
                            <div class="PanelFieldValue">
                                <asi:BusinessTextBox runat="server" ID="TextName" MaxLength="60" />
                                <asi:AsiRequiredFieldValidator runat="server" ID="RfvName" ControlToValidate="TextName" Display="Dynamic" SetFocusOnError="true"></asi:AsiRequiredFieldValidator>
                            </div>
                        </div>
                        
                        <div class="PanelField Left">
                            <div style="display: inline;">
                                <asiweb:StyledLabel runat="server" ID="LabelRegType" AssociatedControlID="RadioRegType"></asiweb:StyledLabel>
                            </div>
                            <div class="PanelFieldValue">
                                <asp:RadioButtonList runat="server" ID="RadioRegType" RepeatDirection="Vertical" Width="100%">
                                </asp:RadioButtonList>
                            </div>
                        </div>
                        
						<asi:BusinessTextBox runat="server" ID="TextDescription" RenderPanelField="true" DisplayCaption="true" TextMode="MultiLine" Rows="3" />
                             <div class="PanelField Left">
                            <div class="PanelFieldLabel">
                                <asiweb:BusinessCheckBox runat="server" ID="AllowRegisterOthers" />
                            </div>
                            <div class="PanelFieldLabel">
                                <asp:Label ID="AllowRegisterOthersLabel" runat="server" Text='<%# ResourceManager.GetPhrase("AllowRegisterOthers", "Allow registering others")%>'></asp:Label>                                
                            </div>
                        </div>
                         <div class="PanelField Left">
                            <div class="PanelFieldLabel">
                                <asiweb:BusinessCheckBox runat="server" ID="AllowAddGuests" />
                            </div>
                            <div class="PanelFieldLabel">
                                <asp:Label runat="server" ID="AllowAddGuestsLabel" Text='<%# ResourceManager.GetPhrase("AllowAddGuests", "Allow adding guests")%>'></asp:Label>
                            </div>
                        </div>

						<asi:BusinessTextBox runat="server" ID="TextFacility" RenderPanelField="true" DisplayCaption="true" TextMode="MultiLine" Rows="3" MaxLength="200"/>
						
						<asp:HiddenField runat="server" ID="HiddenLocationFullAddressId" />
                        <asi:StyledLabel runat="server" ID="LabelAddress" RenderPanelField="true" DisplayCaption="true" />
						<asi:StyledLabel runat="server" ID="LabelEmail" RenderPanelField="true" DisplayCaption="true" />
						<asi:StyledLabel runat="server" ID="LabelPhone" RenderPanelField="true" DisplayCaption="true" />
                        <div style="display:none;visibility:hidden;">
                            <asp:Button runat="server" ID="ButtonAddressSelected" OnClick="ButtonAddressSelectedClick" />
                            <asp:HiddenField runat="server" ID="HiddenAddressSelectedId" />
                        </div>

                        <asi:StyledHyperlink runat="server" ID="LinkSelectAddress" RenderPanelField="true" DisplayCaption="true" Caption="&nbsp;" Text="Choose Address" />

                        <div class="PanelField Left">
                            <div style="display: inline;">
                                <asiweb:StyledLabel runat="server" ID="LabelStartDate" AssociatedControlID="CalendarStartDate"></asiweb:StyledLabel>
                            </div>
                            <div class="PanelFieldValue">
                                <asi:BusinessCalendar2 runat="server" ID="CalendarStartDate" RenderPanelField="false" DisplayCaption="false" UseSqlDateTimeMinValue="true" />
                                <asp:HiddenField runat="server" ID="HiddenDateRangeValidationErrorMsg" />
                                <asp:HiddenField runat="server" ID="HiddenDatetimeRangeValidationErrorMsg" />
                                <asp:CustomValidator runat="server" ID="CustomValidatorDate" Display="Dynamic" style="margin-left:50px;" SetFocusOnError="true"/>
                            </div>
                        </div>
                        <asi:BusinessCalendar2 runat="server" ID="CalendarStartTime" ControlType="TimePicker" RenderPanelField="true" DisplayCaption="true" UseSqlDateTimeMinValue="true" />
						<asi:BusinessCalendar2 runat="server" ID="CalendarEndDate" RenderPanelField="true" DisplayCaption="true" UseSqlDateTimeMinValue="true" />
                        <asi:BusinessCalendar2 runat="server" ID="CalendarEndTime" ControlType="TimePicker" RenderPanelField="true" DisplayCaption="true" UseSqlDateTimeMinValue="true" />
                        
                        <div class="PanelField Left">
                            <div style="display: inline;">
                                 <asiweb:StyledLabel runat="server" ID="LabelCapacity" AssociatedControlID="TextCapacity"></asiweb:StyledLabel>
                            </div>
                            <div class="PanelFieldValue">
                                <asi:BusinessTextBox runat="server" ID="TextCapacity" MaxLength="6" />
                                <asp:RangeValidator ID="CapacityRangeValidator" runat="server" MinimumValue="1" MaximumValue="999999" Type="Integer" Display="Dynamic"
                                    ControlToValidate="TextCapacity" ValidationGroup='<%# UniqueID %>'
                                    ErrorMessage='<%# ResourceManager.GetPhrase("Asi.Web.iParts.Commerce.ProductDisplay.QuantityInteger", "Must be a positive number (or blank for unlimited).")  %>' />
                            </div>
                        </div>
                             
			<div class="PanelField Left">
				<div style="display: inline;">
				<label runat="server" id="LabelImageUrl"></label>
				</div>
				<div class="PanelFieldValue">
					<asp:UpdatePanel ID="uc2" runat="server">
						<ContentTemplate>
							<asiweb:BusinessDropDownList id="SelectImageUrl" runat="server" OnSelectedIndexChanged="ImageUrlDropDownListSelectedIndexChanged" AutoPostBack="true" />
							<br /><br />
							<%--Loading image may take long time, we don't want to match it with timeouts, instead we fire Fix Panel Height once image is downloaded to the client--%>
							<%--OnLoadClientScript="try{PanelTemplateControl_FixInitialHeight();}catch(exc){}"--%>
							<asiweb:StyledImage id="ImageControl" runat="server" Width="200" />
							<br /><br />
							<asiweb:StyledLabel id="LabelUploadNewImage" Text='<%# ResourceManager.GetPhrase("UploadNewImage", "Upload New Image")%>' Runat="server" />
							<br />
							<asiCommon:FileUpload id="BusinessFileUploadControl" runat="Server" UploadDirectory="~/images/UploadedImages/" OnFileUploaded="FileUploadControlFileUploaded" AllowedExtensions=".jpg,.jpeg,.gif" />
						</ContentTemplate>
						<Triggers>
							<asp:AsyncPostBackTrigger ControlID="BusinessFileUploadControl" />
						</Triggers>
					</asp:UpdatePanel>
				</div>
			</div>
                </asi:PanelTemplateControl>
                <asi:PanelTemplateControl ID="PanelAdditionalInfo" runat="server" TemplateTitle='<%# ResourceManager.GetPhrase("AdditionalInfo", "Additional Information") %>'
                    Collapsible="true">
			<%--Using inline styles is not perfect, however HTML Editor will not be displayed correctly unless it is displayed within a block--%>
			<asi:BusinessHtmlEditor runat="server" ID="HtmlAdditionalInfo" style="display:block;" />
                </asi:PanelTemplateControl>
            </telerik:RadPageView>
            <telerik:RadPageView ID="RadPageViewPricing" runat="server" EnableViewState="true">
                <asi:PanelTemplateControl ID="PanelPricing" runat="server" ShowHeader="false" FieldSet="true">
                    <event:Pricing ID="Pricing" runat="server" />
                </asi:PanelTemplateControl>
            </telerik:RadPageView>
             <telerik:RadPageView ID="RadPageViewAccounting" runat="server" EnableViewState="true">
                <asi:PanelTemplateControl ID="AccountingPanel" runat="server" ShowHeader="false" FieldSet="true">   
                   <asiCommon:AccountInfo ID="AccountInfo" runat="server" ></asiCommon:AccountInfo>
                </asi:PanelTemplateControl>
            </telerik:RadPageView>
        </telerik:RadMultiPage>
    </div>
    <div runat="server" id="DivErrors">
        <asi:BusinessLabel runat="server" ID="LabelError" CssClass="Error"></asi:BusinessLabel>
    </div>
</asp:Panel>
