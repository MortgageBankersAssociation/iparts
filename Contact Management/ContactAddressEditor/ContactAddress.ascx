<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="ContactAddress.ascx.cs"
    Inherits="Asi.Web.iParts.ContactManagement.ContactAddressEditor.ContactAddress" %>
<%@ Register TagPrefix="telerik" Namespace="Telerik.Web.UI" Assembly="Telerik.Web.UI" %>
<%@ Register TagPrefix="asiweb" Namespace="Asi.Web.UI.WebControls" Assembly="Asi.Web" %>

<asiweb:PanelTemplateControl ID="ContentPanelDisplay" runat="server" ShowHeader="false" BorderStyle="None">  
    <div id="DivAllowEdit" runat="server">
        <asp:Button runat="server" id="RefreshTrigger" OnClick="RefreshTriggerClick" />
    </div>    
    <div>
        <div class="PanelField AutoWidth">
            <asiweb:BusinessLabel ID="LabelFullAddress" runat="server" />
            <asiweb:BusinessLabel ID="LabelPhoneNumber" runat="server" />
            <asiweb:BusinessLabel ID="LabelFaxNumber" runat="server" />
            <asiweb:HyperLink ID="LinkEmail" runat="server" /> 
        </div>
        <div class="PanelColumn TwoColumns FloatRight"> 
            <div class="PanelField">           
                <div id="DivMail" visible="false" runat="server" class="unitText">
                    <asiweb:BusinessLabel ID="LabelCommunicationPreferenceMail" runat="server" />
                </div>
                <div id="DivBill" visible="false" runat="server" class="unitText">
                    <asiweb:BusinessLabel ID="LabelCommunicationPreferenceBill" runat="server" />
                </div>
                <div id="DivShip" visible="false" runat="server" class="unitText">
                    <asiweb:BusinessLabel ID="LabelCommunicationPreferenceShip" runat="server" />
                </div> 
            </div> 
            <div class="PanelField" style="clear: both;"></div>
            <div class="PanelField">       
                <div id="DivStatus" visible="false" runat="server">
                    <asiweb:StyledLabel ID="LabelStatusPrompt" runat="server" RenderPanelField="true" DisplayCaption="true" PositionCaption="Top" />                     
                    <asiweb:StyledLabel ID="LabelStatusName" runat="server" RenderPanelField="true" DisplayCaption="false" /> 
                </div>       
                <div id="DivNote" visible="false" runat="server"> 
                    <asiweb:StyledLabel ID="LabelNotePrompt" runat="server" RenderPanelField="true" DisplayCaption="true" PositionCaption="top" />          
                    <asiweb:StyledLabel ID="LabelNote" runat="server" RenderPanelField="true" DisplayCaption="false" /> 
                </div>  
            </div>          
        </div>  
        <div style="clear:both"></div>                
    </div>
</asiweb:PanelTemplateControl>