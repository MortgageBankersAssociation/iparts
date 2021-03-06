<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="EventCalendarDisplay.ascx.cs" Inherits="Asi.Web.iParts.Events.EventCalendar.EventCalendarDisplay" %>
<%@ Register TagPrefix="telerik" Namespace="Telerik.Web.UI" Assembly="Telerik.Web.UI" %>
<%@ Register TagPrefix="asiweb" Assembly="Asi.Web" Namespace="Asi.Web.UI.WebControls" %>
    <%--Get around a z-index bug where event calendar header is drawn over top of fold down menus 'rsHeader' class only appears in this telerik calendar widget.--%>
    <style type="text/css">
		div.rsHeader{ z-index:999 !important; }
    </style>
<telerik:RadScheduler runat="server" ID="Calendar" Height="600px" 
                        DayStartTime="08:00:00" DayEndTime="21:00:00"                        
                        FirstDayOfWeek="Sunday" LastDayOfWeek="Saturday"
                        SelectedView="MonthView"
                        EnableDescriptionField="true"
                        AppointmentStyleMode="Default"
                        OnNavigationComplete="SchedulerNavigationComplete"
                        OnAppointmentDataBound="SchedulerAppointmentDataBound"
                        OnAppointmentClick="SchedulerAppointmentClick"
                        DataKeyField="Id" DataSubjectField="Subject" DataDescriptionField="Description"
                        AllowDelete="false"
                        ReadOnly="true"
                        DataStartField="Start" DataEndField="End"
                        DataRecurrenceField="RecurrenceRule" DataRecurrenceParentKeyField="RecurrenceParentId" 
                        DataReminderField="Reminder"
                        CustomAttributeNames="StartText,EndText">
                        <AdvancedForm Modal="true" />
                        <AdvancedEditTemplate>
				            <%--Certain set of CSS classes should be set when the Form is modal.--%>
				            <div class="rsAdvancedEdit rsAdvancedModal" style="position: relative">
					            <div class="rsModalBgTopLeft">
					            </div>
					            <div class="rsModalBgTopRight">
					            </div>
					            <div class="rsModalBgBottomLeft">
					            </div>
					            <div class="rsModalBgBottomRight">
					            </div>
					            <div class="rsAdvTitle">
						            <h1 class="rsAdvInnerTitle">
							            <%# Container.Appointment.Subject %>
                                    </h1>
            						<asp:LinkButton runat="server" ID="LinkButton1" CssClass="rsAdvEditClose" CommandName="Cancel"
			            				CausesValidation="false" ToolTip='<%# Container.Appointment.Owner.Localization.AdvancedClose %>'>
                                        <%# Container.Appointment.Owner.Localization.AdvancedClose%>
						            </asp:LinkButton>
					            </div>
                                <div class="rsAdvContentWrapper">
                                    <div class="PanelFieldLeft">
                                        <asp:Label ID="Label1" runat="server" Text='<%# Bind("Description") %>'></asp:Label>
                                    </div>
                                    <div  class="PanelFieldLeft">
                                        <asp:Label ID="StartInput" Text='<%# Bind("StartText") %>' runat="server"  >
                                        </asp:Label><br />
                                    </div>
                                    <div  class="PanelFieldLeft">
                                        <asp:Label ID="EndInput" Text='<%# Bind("EndText") %>' runat="server"  >
                                        </asp:Label><br />
                                    </div>
					            </div>
				            </div>
				        </div>
			        </AdvancedEditTemplate>
</telerik:RadScheduler> 
<telerik:RadAjaxLoadingPanel runat="server" ID="LoadingPanel" Transparency="50" IsSticky="false" 
        BackColor="LightGray" BackgroundPosition="Center" >
</telerik:RadAjaxLoadingPanel>
<telerik:RadAjaxManager ID="AjaxManager1" runat="server" UpdatePanelsRenderMode="Inline" EnableAJAX="true"> 
    <AjaxSettings> 
        <telerik:AjaxSetting AjaxControlID="save"> 
            <UpdatedControls> 
                <telerik:AjaxUpdatedControl ControlID="AjaxPanel1" />                         
            </UpdatedControls>           
        </telerik:AjaxSetting> 
    </AjaxSettings> 
</telerik:RadAjaxManager> 

