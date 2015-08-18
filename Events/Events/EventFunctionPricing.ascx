<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="EventFunctionPricing.ascx.cs"
    Inherits="Asi.Web.iParts.Events.EventFunctionPricing" %>
<%@ Import Namespace="Asi" %>
<%@ Register TagPrefix="asi" Namespace="Asi.Web.UI.WebControls" Assembly="Asi.Web" %>
<%-- IMPORTANT: The field id's set here are also used in the EventFunctionPricing.js. --%>
<%-- So be careful about changing them or the js file will stop working. --%>
<style type="text/css">
    #<%=DivPriceGrid.ClientID%> .EventFunctionPricingLabel
    {
        font-weight: bold;
        vertical-align: middle;
    }
    
    #<%=DivPriceGrid.ClientID%> DIV.EventFunctionPricingInputColumn
    {
        padding-right: 1em;
    }
    
    #<%=DivPriceGrid.ClientID%> input[type=text][name*=TextPrice]
    {
        width: 9em;
    }
</style>
<div runat="server" id="DivPriceGrid" style="display: table;">
    <div style="display: table-row;">
        <div style="display: table-cell; width: 11em;">
            &nbsp;
        </div>
        <div style="display: table-cell; text-align: center;" class="EventFunctionPricingInputColumn">
            <asiweb:StyledLabel runat="server" ID="LabelEarly" class="EventFunctionPricingLabel" />
        </div>
        <div style="display: table-cell; text-align: center;" class="EventFunctionPricingInputColumn">
            <asiweb:StyledLabel runat="server" ID="LabelRegular" class="EventFunctionPricingLabel"
                Style="text-align: center;" />
        </div>
        <div style="display: table-cell; text-align: center;" class="EventFunctionPricingInputColumn">
            <asiweb:StyledLabel runat="server" ID="LabelLate" class="EventFunctionPricingLabel"
                Style="text-align: center;" />
        </div>
    </div>
    <div runat="server" id="DivCutoffDates" style="display: table-row;">
        <div style="display: table-cell;">
            <asiweb:StyledLabel runat="server" ID="LabelCutoffDate" class="EventFunctionPricingLabel" />
        </div>
        <div style="display: table-cell;" class="EventFunctionPricingInputColumn">
            <asi:BusinessCalendar2 runat="server" ID="CalendarEarlyCutoff" UseSqlDateTimeMinValue="true"
                Width="9em" />
        </div>
        <div style="display: table-cell;" class="EventFunctionPricingInputColumn">
            <asi:BusinessCalendar2 runat="server" ID="CalendarRegularCutoff" UseSqlDateTimeMinValue="true"
                Width="9em" />
        </div>
        <div style="display: table-cell;" class="EventFunctionPricingInputColumn">
            &nbsp;
        </div>
    </div>
    <div style="display: table-row;">
        <div style="display: table-cell;">
            <asiweb:StyledLabel runat="server" ID="LabelStandardPrice" class="EventFunctionPricingLabel" />
        </div>
        <div style="display: table-cell;" class="EventFunctionPricingInputColumn">
            <asi:BusinessTextBox runat="server" ID="TextPriceStandardEarly" MaxLength="13" />
        </div>
        <div style="display: table-cell;" class="EventFunctionPricingInputColumn">
            <asi:BusinessTextBox runat="server" ID="TextPriceStandardRegular" MaxLength="13" />
        </div>
        <div style="display: table-cell;" class="EventFunctionPricingInputColumn">
            <asi:BusinessTextBox runat="server" ID="TextPriceStandardLate" MaxLength="13" />
        </div>
    </div>
    <div style="display: table-row;">
        <div style="display: table-cell;">
            <asiweb:StyledLabel runat="server" ID="LabelDiscountPrice" class="EventFunctionPricingLabel" />
        </div>
        <div style="display: table-cell;" class="EventFunctionPricingInputColumn">
            <asi:BusinessTextBox runat="server" ID="TextPriceDiscountEarly" MaxLength="13" />
        </div>
        <div style="display: table-cell;" class="EventFunctionPricingInputColumn">
            <asi:BusinessTextBox runat="server" ID="TextPriceDiscountRegular" MaxLength="13" />
        </div>
        <div style="display: table-cell;" class="EventFunctionPricingInputColumn">
            <asi:BusinessTextBox runat="server" ID="TextPriceDiscountLate" MaxLength="13" />
        </div>
    </div>
</div>
<div style="padding-left: 11em; padding-top:1em;">
    <asp:HiddenField runat="server" ID="HiddenCutoffDateValidationErrMsg" />
    <asp:CustomValidator runat="server" ID="CustomValidatorCutoff" Display="Dynamic"
        SetFocusOnError="true" />
</div>
