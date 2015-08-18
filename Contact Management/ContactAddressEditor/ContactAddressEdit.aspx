<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="ContactAddressEdit.aspx.cs" Inherits="Asi.Web.iParts.ContactManagement.ContactAddressEditor.ContactAddressEdit" %>
<%@ Register TagPrefix="asiweb" Assembly="Asi.Web" Namespace="Asi.Web.UI.WebControls" %>

<asp:Content id="ContentPanel" runat="server" contentplaceholderid="TemplateBody">
    <asiweb:PanelTemplateControl ID="EditPanel" runat="server" ShowHeader="false" Collapsible="false" ScrollBars="None" BorderStyle="None">
                           
        <div style="padding:5px;">
            <asp:HiddenField ID="AddressIsDirtyControl" runat="server" />
            <asp:Label id="LabelErrorMessage" runat="server" visible="false" cssclass="Error" />
                  
            <asiweb:TitleBar id="LabelPurposeCaption" runat="server" Text="Address" />

            <div runat="server" id="DivValidateAddress">
                <asiweb:AddressValidationControl ID="AddressValidator" runat="server" />
            </div>
                              
            <table class="Form" width="100%">
                <tbody>
                    <tr>
                        <td>
                        <asp:Table runat="server">
                            <asp:TableRow runat="server" id="RowPurpose">
                                <asp:TableCell runat="server" >
                                    <asiweb:StyledLabel id="LabelPurposePrompt" runat="server" RenderPanelField="true" DisplayCaption="true" PositionCaption="Left" />
                                </asp:TableCell>
                                <asp:TableCell runat="server">
                                    <asiweb:BusinessComboBox ID="SelectPurpose" runat="server" Required="true" TabIndex="1" AutoPostBack="true" AllowCustomText="false" />
                                </asp:TableCell>
                            </asp:TableRow>
                            <asp:TableRow runat="server">
                                <asp:TableCell runat="server" >
                                    <asiweb:StyledLabel id="LabelCountryPrompt" runat="server" RenderPanelField="true" DisplayCaption="true" PositionCaption="Left" />
                                </asp:TableCell>
                                <asp:TableCell runat="server">
                                    <asiweb:BusinessComboBox runat="server" id="SelectCountry" Style="float: none;" TabIndex="2" AutoPostBack="true" AllowCustomText="false" CausesValidation="False" />
                                </asp:TableCell>
                            </asp:TableRow>
                            <asp:TableRow runat="server">
                                <asp:TableCell runat="server">
                                    <asiweb:StyledLabel id="LabelAddressPrompt" runat="server" RenderPanelField="true" DisplayCaption="true" PositionCaption="Left" />
                                </asp:TableCell>
                                <asp:TableCell runat="server" VerticalAlign="Top">
                                    <asiweb:BusinessTextBox id="TextAddress1" runat="server" TextMode="SingleLine" TabIndex="3"  class="PanelFieldValue"/>
                                    <br /><asiweb:AsiRegularExpressionValidator id="RegExpTextAddress1" runat="server"     
                                                    ControlToValidate="TextAddress1"     
                                                    ValidationExpression="^[\s\S]{0,40}$"
                                                    Display="None" />                     
                                </asp:TableCell>
                            </asp:TableRow>
                            <asp:TableRow runat="server" id="RowAddress2">
                                <asp:TableCell runat="server">
                                    &nbsp;
                                </asp:TableCell>
                                <asp:TableCell runat="server">
                                    <asiweb:BusinessTextBox id="TextAddress2" runat="server" TextMode="SingleLine" TabIndex="4" />
                                    <br /><asiweb:AsiRegularExpressionValidator id="RegExpTextAddress2" runat="server"     
                                                    ControlToValidate="TextAddress2"     
                                                    ValidationExpression="^[\s\S]{0,40}$"
                                                    Display="None" />       
                                </asp:TableCell>
                            </asp:TableRow>
                            <asp:TableRow runat="server" id="RowAddress3">
                                <asp:TableCell runat="server">
                                    &nbsp;
                                </asp:TableCell>
                                <asp:TableCell runat="server">
                                    <asiweb:BusinessTextBox id="TextAddress3" runat="server" TextMode="SingleLine" TabIndex="5"  class="PanelFieldValue"/>
                                    <br /><asiweb:AsiRegularExpressionValidator id="RegExpTextAddress3" runat="server"     
                                                    ControlToValidate="TextAddress3"     
                                                    ValidationExpression="^[\s\S]{0,40}$"
                                                    Display="None" />                      
                                </asp:TableCell>
                            </asp:TableRow>
                            <asp:TableRow runat="server" id="RowCity">
                                <asp:TableCell runat="server">
                                    <asiweb:StyledLabel id="LabelCityPrompt" runat="server" RenderPanelField="true" DisplayCaption="true" PositionCaption="Left" />
                                </asp:TableCell>
                                <asp:TableCell runat="server">
                                    <asiweb:BusinessTextBox id="TextCity" runat="server" TextMode="SingleLine" TabIndex="6" />
                                    <br /><asiweb:AsiRegularExpressionValidator id="RegExpTextCity" runat="server"     
                                            ControlToValidate="TextCity"     
                                            ValidationExpression="^[\s\S]{0,40}$"
                                            Display="None" />       
                                </asp:TableCell>
                            </asp:TableRow>
                            <asp:TableRow runat="server" id="rowSubEntity">
                                <asp:TableCell runat="server">
                                    <asiweb:StyledLabel id="LabelSubEntityCodePrompt" runat="server" RenderPanelField="true" DisplayCaption="true" PositionCaption="Left" />
                                </asp:TableCell>
                                <asp:TableCell runat="server">
                                    <asiweb:BusinessComboBox id="SelectSubEntityCode" runat="server" Style="float: none;" TabIndex="7" Visible="false" AllowCustomText="false" />
                                    <asiweb:BusinessTextBox id="TextSubEntity" runat="server" TextMode="SingleLine" TabIndex="7" Visible="false"  />
                                    <br /><asiweb:AsiRegularExpressionValidator id="RegExpTextSubEntity" runat="server"     
                                                    ControlToValidate="TextSubEntity"     
                                                    ValidationExpression="^[\s\S]{0,15}$"
                                                    Display="None" />                                  
                                </asp:TableCell>
                            </asp:TableRow>
                            <asp:TableRow runat="server" id="RowPostcode">
                                <asp:TableCell runat="server">
                                    <asiweb:StyledLabel id="LabelPostalCodePrompt" runat="server" RenderPanelField="true" DisplayCaption="true" PositionCaption="Left" />
                                </asp:TableCell>
                                <asp:TableCell runat="server">
                                    <asiweb:BusinessTextBox id="TextPostalCode" runat="server" TextMode="SingleLine" TabIndex="8" />
                                    <br /><asiweb:AsiRegularExpressionValidator id="RegExpTextPostalCode" runat="server" EnableClientScript="true"      
                                            ControlToValidate="TextPostalCode"     
                                            ValidationExpression="^[\s\S]{0,10}$"
                                            Display="None" />  
                                </asp:TableCell>
                            </asp:TableRow>
                            <asp:TableRow runat="server">
                                <asp:TableCell runat="server">
                                    <asiweb:StyledLabel id="LabelPhonePrompt" runat="server" RenderPanelField="true" DisplayCaption="true" PositionCaption="Left" />
                                </asp:TableCell>
                                <asp:TableCell runat="server">
                                    <asiweb:BusinessTextBox id="TextPhone" runat="server" TextMode="SingleLine" TabIndex="9" />
                                    <br /><asiweb:AsiRegularExpressionValidator id="RegExpTextPhone" runat="server"     
                                            ControlToValidate="TextPhone"     
                                            ValidationExpression="^[\s\S]{0,25}$"
                                            Display="None" />  
                                </asp:TableCell>
                            </asp:TableRow>
                            <asp:TableRow runat="server">
                                <asp:TableCell runat="server">
                                    <asiweb:StyledLabel id="LabelFaxPrompt" runat="server" RenderPanelField="true" DisplayCaption="true" PositionCaption="Left" />
                                </asp:TableCell>
                                <asp:TableCell runat="server">
                                    <asiweb:BusinessTextBox id="TextFax" runat="server" TextMode="SingleLine" TabIndex="10" />
                                    <br /><asiweb:AsiRegularExpressionValidator id="RegExpTextFax" runat="server"     
                                                    ControlToValidate="TextFax"     
                                                    ValidationExpression="^[\s\S]{0,25}$"
                                                    Display="None" /> 

                                </asp:TableCell>
                            </asp:TableRow>
                            <asp:TableRow runat="server" id="RowFaxNumber">
                                <asp:TableCell runat="server">
                                    <asiweb:StyledLabel id="LabelEmailPrompt" runat="server" RenderPanelField="true" DisplayCaption="true" PositionCaption="Left" />
                                </asp:TableCell>
                                <asp:TableCell runat="server">
                                    <asiweb:BusinessTextBox id="TextEmail" runat="server" TextMode="SingleLine" TabIndex="11" />        
                                    <!-- br tags are incorporated into the validator message to avoid an extra line appearing on the page  -->
 			                        <asiweb:AsiRegularExpressionValidator id="RegExpTextEmailFormat" runat="server" 
 			                                        ControlToValidate="TextEmail"
 			                                        ValidationExpression="^[\w\.-]+@[\w-]+\.[\w\.-]{0,100}$"
 			                                        Display="None" /> 
 			                        <asiweb:AsiRegularExpressionValidator id="RegExpTextEmailLength" runat="server" 
 			                                        ControlToValidate="TextEmail"
 			                                        ValidationExpression="^[\s\S]{0,100}$"
 			                                        Display="None" />                
                                </asp:TableCell>
                            </asp:TableRow>
                        </asp:Table>

                        </td>
                        <td valign="top">
                            <asp:CheckBox id="CheckBoxPreferredMailing" runat="server" textalign="Right" tabindex="12" visible="false" /><br />
                            <asp:CheckBox id="CheckBoxPreferredShipping" runat="server" tabindex="13" visible="false" /><br />
                            <asp:CheckBox id="CheckBoxPreferredBilling" runat="server" textalign="Right" tabindex="14" visible="false" /><br />


                            <br />
                            <div style="display: none;">
                            <asiweb:StyledLabel id="LabelAddressStatus" runat="server" Caption="Status" RenderPanelField="true" DisplayCaption="true" PositionCaption="top" visible="false"/>
                            <asiweb:BusinessComboBox id="SelectAddressStatus" runat="server" Style="float: none;" AllowCustomText="false" visible="false" /> 

                            <div id="FieldBreak" runat="server" visible="false"></div>

                            <asiweb:StyledLabel id="LabelNotePrompt" runat="server" RenderPanelField="true" DisplayCaption="true" PositionCaption="top" />
                            <asiweb:BusinessTextBox id="TextNote" runat="server" TextMode="MultiLine" Rows="5" TabIndex="15" />  
                            </div>
                        </td>
                    </tr>          
                </tbody> 
            </table>
            
        </div>

    </asiweb:PanelTemplateControl> 
     
</asp:Content>
