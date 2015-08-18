<%@ Control Language="C#" AutoEventWireup="true" Inherits="Asi.Web.iParts.Events.EventProgramDisplayFunction"
    CodeBehind="EventProgramDisplayFunction.ascx.cs" %>
<%@ Register TagPrefix="asi" Namespace="Asi.Web.UI.WebControls" Assembly="Asi.Web" %>
<%@ Import Namespace="Asi" %>
<div class="ProgramItemSummary">
     <div class="WhenColumn">
        <asi:StyledLabel runat="server" ID="WhenData" />
    </div>
    <div class="DescriptionColumn">
        <div class="ListItemTitle">
            <asp:HyperLink ID="DisplayLink" Text="Edit" runat="server" />
            <asiweb:StyledLabel runat="server" ID="InItinerary" Text="In Itinerary" CssClass="InItinerary" />
        </div>
        <div runat="server" id="DescriptionDiv" class="Description">
            <asi:StyledLabel runat="server" ID="DescriptionData" />
        </div>
        <br />
        <div class="PanelBlock Details">
            <div class="PanelField" runat="server" id="CategoryRow">
                <div class="PanelFieldLabel">
                    <asi:StyledLabel runat="server" ID="CategoryLabel" AssociatedControlID="CategoryData" /></div>
                <div class="PanelFieldValue">
                    <asi:StyledLabel runat="server" ID="CategoryData" /></div>
            </div>
            <div class="PanelField" runat="server" id="TrackRow">
                <div class="PanelFieldLabel">
                    <asi:StyledLabel runat="server" ID="TrackLabel" AssociatedControlID="TrackData" /></div>
                <div class="PanelFieldValue">
                    <asi:StyledLabel runat="server" ID="TrackData" /></div>
            </div>
            <div class="PanelField" runat="server" id="PriceRow">
                <div class="PanelFieldLabel">
                    <asi:StyledLabel runat="server" ID="PriceLabel" AssociatedControlID="PriceData" /></div>
                <div class="PanelFieldValue">
                    <asi:StyledLabel runat="server" ID="PriceData" /></div>
            </div>
            <div class="PanelField" runat="server" id="TimeRow">
                <div class="PanelFieldLabel">
                    <asi:StyledLabel runat="server" ID="TimeLabel" AssociatedControlID="TimeData" /></div>
                <div class="PanelFieldValue">
                    <asi:StyledLabel runat="server" ID="TimeData" />
                </div>
            </div>
        </div>
    </div>
    <div class="IteneraryColumn">
        <div class="PanelField" runat="server" id="LinkRow">
            <asp:HyperLink ID="AddLinkButton" runat="server" />
            <asp:HyperLink ID="RemoveLinkButton" runat="server" />
        </div>
        <div class="PanelField" runat="server" id="MessageRow">
            <asiweb:StyledLabel ID="FunctionUnavailableMessageLabel" runat="server"/>
        </div>
    </div>  
</div>
