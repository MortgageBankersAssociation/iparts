<%@ Page Language="C#" AutoEventWireup="True" CodeBehind="AddressSelectorChooseAddress.aspx.cs"
    Inherits="Asi.Web.iParts.Commerce.AddressSelector.AddressSelectorChooseAddress" %>

<asp:content id="Content" runat="server" contentplaceholderid="TemplateBody">
    
    <script type="text/javascript">
        //<![CDATA[

        var ChooseAddressMode = "<%=Mode%>";

        // called to manage addresses
        function ManageAddresses() {
            CloseDialog("ManageAddresses", "");
        }

        // close the dialog
        function CloseDialog(action, addressId) {
            var w = GetRadWindow();
            if (w == null) return;
            var r = ConstructResultsObject();
            r.Action = action;
            r.AddressId = addressId;
            w.AsiResults = r;
            w.Close();
        }

        // called when an address is selected and ChooseAddressMode==Path
        function UseAddress_Path(addressId) {
            $('<%=UseAddressIdText.ClientID%>').value = addressId;
            $('<%=UseAddressButton.ClientID%>').click();
        }

        // called when an address is selected and ChooseAddressMode==Party
        function UseAddress_Party(addressId) {
            CloseDialog("AddressSelected",addressId);
        }

        // called after an address has been inserted
        function InsertAddress_Callback(results) {
            if (results != null && typeof (results) == "object") {
                if (results.Saved == true)
                    $('<%=ButtonRefresh.ClientID%>').click();
            }
        }

        // construct the return object
        function ConstructResultsObject() {
            return { AddressId: "", Action: "" };
        }

        //]]>
    </script>

    <asiweb:PanelTemplateControl ID="EditPanel" runat="server" ShowHeader="false" Collapsible="false" ScrollBars="None" BorderStyle="None">
        
        <!--Hidden controls-->
        <div style="display:none;visibility:hidden;">
            <asp:Button runat="server" ID="UseAddressButton" OnClick="UseAddress_Click"/>
            <asp:TextBox runat="server" ID="UseAddressIdText" Text="" />
            <asp:Button runat="server" ID="ButtonRefresh" />
        </div>
         
         
         <div runat="server" class="Details PanelBlock" id="DivRegistrantInfo"> 
            <div runat="server" id="DivDisplayedName" class="PanelField">
                <div class="PanelFieldLabel">
                    <asiweb:StyledLabel runat="server" ID="DisplayedNameCaption" AssociatedControlID="DisplayedNameData" />
                </div>
                <div class="PanelFieldValue">
                    <asiweb:StyledLabel runat="server" ID="DisplayedNameData" />
                </div>
            </div>
           
            <div runat="server" id="DivOrganizationName" class="PanelField">
                <div class="PanelFieldLabel">
                    <asiweb:StyledLabel runat="server" ID="OrganizationNameCaption" AssociatedControlID="OrganizationNameData" />
                </div>
                <div class="PanelFieldValue">
                    <asiweb:StyledLabel runat="server" ID="OrganizationNameData" />
                </div>
            </div>
            
             <div runat="server" id="DivOrganizationTitle" class="PanelField">
                <div class="PanelFieldLabel">
                    <asiweb:StyledLabel runat="server" ID="TitleCaption" AssociatedControlID="TitleData" />
                </div>
                <div class="PanelFieldValue">
                    <asiweb:StyledLabel runat="server" ID="TitleData" />
                </div>  
            </div>
        </div>     
        
        <br />
                           
        <div runat="server" id="DivNoAddresses">
            <asp:Label runat="server" id="LabelNoAddresses"></asp:Label>
        </div>
        <asp:Table runat="server" id="AddressTable" width="100%" >
        </asp:Table>
        
        <br />

        <div runat="server" id="DivAddAddress">
            <asiweb:Hyperlink runat="server" ID="LinkAddAddress" ></asiweb:Hyperlink>
        </div>

        <div runat="server" id="DivManageAddresses">
            <asiweb:Hyperlink runat="server" ID="LinkManageAddresses" NavigateUrl="javascript:ManageAddresses();"></asiweb:Hyperlink>
        </div>

        <div runat="server" ID="DivTempAddress" visible="false">

            <br />
            <span style="font-weight:bold;">Not one of these?  Enter an address.</span>

            <br />
            <br />

            <fieldset>

                <div class="PanelField Left">
                    <div style="display: inline;">
                        <asiweb:StyledLabel runat="server" ID="AddressLabel" Text="Address" AssociatedControlID="Address1Text"></asiweb:StyledLabel>
                    </div>
                    <div class="PanelFieldValue">
                        <asiweb:BusinessTextBox runat="server" ID="Address1Text" style="margin-bottom:3px;"></asiweb:BusinessTextBox>
                        <div style="clear:both;"></div>
                        <asiweb:BusinessTextBox runat="server" ID="Address2Text" style="margin-bottom:3px;"></asiweb:BusinessTextBox>
                        <div style="clear:both;"></div>
                        <asiweb:BusinessTextBox runat="server" ID="Address3Text"></asiweb:BusinessTextBox>
                    </div>
                </div>
              
                <div class="PanelField Left">
                    <div style="display: inline;">
                        <asiweb:StyledLabel runat="server" ID="CityLabel" Text="City" AssociatedControlID="CityText"></asiweb:StyledLabel>
                    </div>
                    <div class="PanelFieldValue">
                        <asiweb:BusinessTextBox runat="server" ID="CityText"></asiweb:BusinessTextBox>
                    </div>
                </div>
                <div class="PanelField Left">
                    <div style="display: inline;">
                        <asiweb:StyledLabel runat="server" ID="StateLabel" Text="State" AssociatedControlID="StateText"></asiweb:StyledLabel>
                    </div>
                    <div class="PanelFieldValue">
                        <asiweb:BusinessTextBox runat="server" ID="StateText"></asiweb:BusinessTextBox>
                    </div>
                </div>
                <div class="PanelField Left">
                    <div style="display: inline;">
                        <asiweb:StyledLabel runat="server" ID="PostcodeLabel" Text="Postal code" AssociatedControlID="PostcodeText"></asiweb:StyledLabel>
                    </div>
                    <div class="PanelFieldValue">
                        <asiweb:BusinessTextBox runat="server" ID="PostcodeText"></asiweb:BusinessTextBox>
                    </div>
                </div>

            </fieldset>

        </div>
           
    </asiweb:PanelTemplateControl> 
     
</asp:content>
