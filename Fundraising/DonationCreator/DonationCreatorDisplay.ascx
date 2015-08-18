<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="DonationCreatorDisplay.ascx.cs" Inherits="Asi.Web.iParts.Fundraising.DonationCreator.DonationCreatorDisplay" %>
<%@ Import Namespace="Asi.Web.iParts.Fundraising.DonationCreator" %>
<%@ Import Namespace="System.Globalization" %>
<%@ Register TagPrefix="telerik" Namespace="Telerik.Web.UI" Assembly="Telerik.Web.UI" %>
<%@ Register TagPrefix="asiweb" Assembly="Asi.Web" Namespace="Asi.Web.UI.WebControls" %>
<%@ Register TagPrefix="ajaxToolkit" Namespace="AjaxControlToolkit" Assembly="AjaxControlToolkit, Version=4.1.50508.0, Culture=neutral, PublicKeyToken=28f01b0e84b6d53e" %>
<asp:Panel ID="ContentPanel" runat="server" Visible="true">

    <div>
        <asp:UpdatePanel ID="UpdatePanelValidation" runat="server">
            <ContentTemplate>
                <asp:Label ID="ErrorLabel" runat="server" Text="" CssClass="Error"></asp:Label>                        
            </ContentTemplate>
        </asp:UpdatePanel>
    </div>
      
    <asiweb:PanelTemplateControl ID="DonationCreatorControl" runat="server" FieldSet="true" BorderWidth="0" ShowHeader="false"  Collapsible="false"  Text=""  >
       
            <h4><asp:Literal ID="GiftItemName" runat="server"></asp:Literal></h4>
            <div class="PanelField Left">
                <asiweb:StyledLabel runat="server" ID="ItemDescriptionLabel" />
            </div>
                 
            <div class="PanelField Left" id="SingleEntry" runat="server">
                <div style="display: inline">
                    <asiweb:StyledLabel runat="server" ID="GiftAmountLabel" AssociatedControlID="GiftAmount" CssClass="Required" ></asiweb:StyledLabel>
                </div>
                <div class="PanelFieldValue AutoWidth FloatNone">
                    <asiweb:BusinessTextBox runat="server" ID="GiftAmount" DisplayCaption="false"  />
                    <ajaxToolkit:FilteredTextBoxExtender ID="GiftAmountFilter" runat="server"
                        TargetControlID="GiftAmount"         
                        FilterType="Custom, Numbers"
                        ValidChars="." />

					<asiweb:AsiRequiredFieldValidator  ID="GiftAmountRequiredFieldValidator" ControlToValidate="GiftAmount" runat="server" CssClass="Important"  />
					<asp:PlaceHolder ID="Placeholder1" runat="server"></asp:PlaceHolder>
                    <asp:RangeValidator Display="Dynamic" runat="server" ID="GiftAmountRangeValidator1" ControlToValidate="GiftAmount" 
                            Type="Double" MinimumValue="0.01" MaximumValue="100000000" CssClass="Important" />
                </div>
            </div>
            
           <div class="PanelField" id="RadioButtonEntry" runat="server" visible="false">
                    <div class="PanelField Left">
                    <asiweb:StyledLabel id="GiftAmountLabel2" runat="server" AssociatedControlID="GiftAmountSelection" CssClass="Required"></asiweb:StyledLabel>
                    </div>
                       
                    <div class="PanelField Left AutoWidth FloatNone">
                        <asp:radiobuttonlist id="GiftAmountSelection" runat="server" RepeatDirection="Horizontal" RepeatLayout="Flow" />
                    
                    <asiweb:BusinessTextBox runat="server" ID="GiftAmount2" DisplayCaption="false" />
                    <ajaxToolkit:FilteredTextBoxExtender ID="GiftAmount2Filter" runat="server"
                        TargetControlID="GiftAmount2"         
                        FilterType="Custom, Numbers"
                        ValidChars="." />
					<asp:CustomValidator ID="RadioEntryCustomValidator" runat="server" ErrorMessage="CustomValidator"   class="Important"></asp:CustomValidator>
                    <asiweb:AsiRequiredFieldValidator  ID="GiftAmountRequiredFieldValidator2" ControlToValidate="GiftAmount2" runat="server" CssClass="Important"  />
					<asp:PlaceHolder ID="Placeholder2" runat="server"></asp:PlaceHolder>
                    <asp:RangeValidator Display="Dynamic" runat="server" ID="GiftAmountRangeValidator2" ControlToValidate="GiftAmount2" 
                            Type="Double" MinimumValue="0.01" MaximumValue="100000000" CssClass="Important" />
                    </div>
            </div>

			<div class="PanelField" >
				<asp:PlaceHolder ID="AddToCartPlaceholder" runat="server">
					<asiweb:StyledLabel ID="ItemAddedMessageLabel" Visible="false" runat="server" ></asiweb:StyledLabel>&nbsp;
					<asiweb:BusinessHyperLink ID="CartLink" runat="server" ></asiweb:BusinessHyperLink>
				</asp:PlaceHolder>
			</div>

       </asiweb:PanelTemplateColumn>
    </asiweb:PanelTemplateControl>

</asp:Panel>       
