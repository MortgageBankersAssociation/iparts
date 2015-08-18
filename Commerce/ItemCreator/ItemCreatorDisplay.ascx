<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="ItemCreatorDisplay.ascx.cs"
    Inherits="Asi.Web.iParts.Commerce.ItemCreator.ItemCreatorDisplay" %>
<%@ Import Namespace="Asi" %>
<%@ Register TagPrefix="telerik" Namespace="Telerik.Web.UI" Assembly="Telerik.Web.UI" %>
<%@ Register TagPrefix="asiweb" Assembly="Asi.Web" Namespace="Asi.Web.UI.WebControls" %>
<%@ Register TagPrefix="asiCommon" TagName="ItemCreatorPicture" Src="ItemCreatorPictureDisplay.ascx" %>
<%@ Register TagPrefix="asiCommon" TagName="GeneralLedger" Src="GeneralLedgerAccountDisplay.ascx" %>
<script type="text/javascript">
//<![CDATA[

    // Script that reenables disabled numeric text boxes that have just been edited
    try {
        Sys.WebForms.PageRequestManager.getInstance().add_endRequest(OnajaxPostbackComplete);
    }
    catch (exc) { }
    ResetBlocker();

//]]>
</script>
<asp:Label ID="ErrorLabel" runat="server" CssClass="Error"></asp:Label>
<asp:Panel ID="ContentPanel" runat="server" Visible="true">
    <asiweb:TitleBar ID="TitleBar" Text="<%#PageTitle%>" OptionsMenuBehavior="AlwaysDisplay"
        runat="server" />
    <div runat="server" id="DivData">
        <telerik:RadTabStrip ID="TabStripControl" runat="server" MultiPageID="MultiPageControl"
            SelectedIndex="0" Visible="true" AutoPostBack="true" CausesValidation="false">
            <Tabs>
                <telerik:RadTab Text='<%# ResourceManager.GetWord("Summary") %>' Value="summary" />
                <telerik:RadTab Text='<%# ResourceManager.GetWord("Accounting") %>' Value="accounting" />
            </Tabs>
        </telerik:RadTabStrip>
        <telerik:RadMultiPage ID="MultiPageControl" runat="server" SelectedIndex="0">
            <telerik:RadPageView ID="RadPageSummary" runat="server" EnableViewState="true">
                <asiweb:PanelTemplateControl ID="NewProductTable" runat="server" ShowButtons="false"
                    ShowHeader="false" Collapsible="false" Collapsed="false" TemplateTitle="" BorderWidth="0">
                    <asiweb:PanelTemplateControl ID="SimpleOrCollectionPanel" runat="server" ShowButtons="false" ShowHeader="false" Collapsible="false" Collapsed="false" TemplateTitle="" BorderWidth="0">
                        <asiweb:StyledLabel runat="server" ID="IWantToLabel" Text='<%# ResourceManager.GetPhrase("IWantTo", "I want to:")%>' />
                        <asp:Panel ID="SimpleOrCollectionPanelHelper" runat="server" CssClass="AutoWidth">    
                            <asiweb:StyledRadioButton ID="SimpleRadioButton" runat="server" DisplayCaption="true" PositionCaption="Right" OnCheckedChanged="SimpleOrCollectionRadioChanged"
                                Caption='<%# ResourceManager.GetPhrase("CreateSimpleProduct", "Create a Simple Item")%>' RenderPanelField="true"
                                AutoPostBack="true" GroupName="SimpleOrCollection" Checked="true"/>
                            <asiweb:StyledRadioButton ID="CollectionRadioButton" runat="server" DisplayCaption="true" PositionCaption="Right" OnCheckedChanged="SimpleOrCollectionRadioChanged"
                                Caption='<%# ResourceManager.GetPhrase("CreateCollection", "Create a Collection of Items")%>' RenderPanelField="true"
                                AutoPostBack="true" GroupName="SimpleOrCollection" Checked="false"/>
                        </asp:Panel> 
                        <asiweb:PanelTemplateControl ID="SelectCollectionTypePanel" runat="server" ShowButtons="false" ShowHeader="false" 
                            Collapsible="false" Collapsed="false" TemplateTitle="" BorderWidth="0" Visible="false">
                            <asp:Panel ID="PanelHelper1" runat="server" CssClass="AutoWidth SubItems">
                                <asiweb:StyledRadioButton ID="KitRadioButton" runat="server" DisplayCaption="true" PositionCaption="Right" OnCheckedChanged="CollectionTypeRadioChanged"
                                    Caption='<%# ResourceManager.GetPhrase("CreateKit", "Create a kit or bundle with a single item description and one price")%>' RenderPanelField="true"
                                    AutoPostBack="true" GroupName="CollectionType" Checked="true"/>
                                <asiweb:StyledRadioButton ID="CollectionOfSeparateItemsRadioButton" runat="server" DisplayCaption="true" PositionCaption="Right" OnCheckedChanged="CollectionTypeRadioChanged"
                                    Caption='<%# ResourceManager.GetPhrase("CreateCollectionOfSeparateItems", "Create a collection of items shown separately and individually priced")%>' RenderPanelField="true"
                                    AutoPostBack="true" GroupName="CollectionType" style="white-space: nowrap;" Checked="false" Enabled="true"/> 
                                <asiweb:StyledRadioButton ID="SeriesOfCollectionsRadioButton" runat="server" DisplayCaption="true" PositionCaption="Right" OnCheckedChanged="CollectionTypeRadioChanged"
                                    Caption='<%# ResourceManager.GetPhrase("CreateSeriesOfCollections", "Create a series of collections of items shown separately and individually priced")%>' RenderPanelField="true"
                                    AutoPostBack="true" GroupName="CollectionType" style="white-space: nowrap;" Checked="false" Enabled="true"/>
                            </asp:Panel>
                        </asiweb:PanelTemplateControl>       
                    </asiweb:PanelTemplateControl>  
                    <asiweb:PanelTemplateColumn ID="Col1" runat="server" Width="80%">
                        <div class="PanelField Left">
                            <div style="display: inline;">
                                <asiweb:StyledLabel runat="server" ID="ProductTypeLabel" CssClass="Required" Text='<%# ResourceManager.GetPhrase("ItemType", "Item Type")%>'
                                    AssociatedControlID="ProductTypeDropDown"></asiweb:StyledLabel>
                            </div>
                            <div class="PanelFieldValue">
                                    <asiweb:BusinessDropDownList runat="server" ID="ProductTypeDropDown" RenderPanelField="false" AutoPostBack="true" Required="true" OnSelectedIndexChanged="ProductTypeDropDown_SelectedIndexChanged" />
                                    <asiweb:AsiRequiredFieldValidator runat="server" ID="ProductTypeRequired" ControlToValidate="ProductTypeDropDown"
                                    CssClass="Important" Display="Dynamic"></asiweb:AsiRequiredFieldValidator>
                            </div>
                        </div>

                        <div class="PanelField Left">
                            <div>
                                <asiweb:StyledLabel runat="server" ID="ProductClassLabel" CssClass="Required" Text='<%# ResourceManager.GetPhrase("ItemClass", "Item Class")%>'
                                    AssociatedControlID="ProductClassDropDown"></asiweb:StyledLabel>
                            </div>
                            <div class="PanelFieldValue">
                                    <asiweb:BusinessDropDownList runat="server" ID="ProductClassDropDown" RenderPanelField="false" AutoPostBack="true" Required="true" OnSelectedIndexChanged="ProductClassDropDown_SelectedIndexChanged"/>
                                    <asiweb:AsiRequiredFieldValidator runat="server" ID="ProductClassRequired" ControlToValidate="ProductClassDropDown"
                                    CssClass="Important" SetFocusOnError="true"></asiweb:AsiRequiredFieldValidator>
                            </div>
                        </div>
            
                        <div class="PanelField Left">
                            <div >
                                <asiweb:StyledLabel runat="server" ID="NameLabel" CssClass="Required" Text='<%# ResourceManager.GetWord("Name")%>'
                                    AssociatedControlID="txtName"></asiweb:StyledLabel>
                            </div>
                            <div class="PanelFieldValue">
                                <asiweb:BusinessTextBox runat="server" ID="txtName"></asiweb:BusinessTextBox>
                                <asiweb:AsiRequiredFieldValidator runat="server" ID="NameRequired" ControlToValidate="txtName"
                                    CssClass="Important" SetFocusOnError="true"></asiweb:AsiRequiredFieldValidator>
                            </div>
                        </div>
                        <div style="clear: both;">
                        </div>
        
                        <div class="PanelField Left">
                            <div>
                                <asiweb:StyledLabel runat="server" ID="DescriptionLabel" Text='<%# ResourceManager.GetWord("Description")%>'
                                    AssociatedControlID="txtDescription"></asiweb:StyledLabel>
                            </div>
                            <div class="PanelFieldValue">
                                <asiweb:BusinessTextBox runat="server" ID="txtDescription" Rows="5" Columns="45"
                                    TextMode="MultiLine"></asiweb:BusinessTextBox>
                            </div>
                        </div>
                        <div style="clear: both;">
                        </div>

                        <div class="PanelField Left">
                            <div>
                                <asiweb:StyledLabel runat="server" ID="ItemCodeLabel" CssClass="Required" Text='<%# ResourceManager.GetPhrase("ItemCode", "Item Code")%>'
                                    AssociatedControlID="txtItemCode"></asiweb:StyledLabel>
                            </div>
                            <div class="PanelFieldValue">
                                <asiweb:BusinessTextBox runat="server" ID="txtItemCode" />
                                <asiweb:AsiRequiredFieldValidator runat="server" ID="ItemCodeRequired" ControlToValidate="txtItemCode"
                                    CssClass="Important" SetFocusOnError="true" Display="Dynamic"  />
                                <asp:CustomValidator ID="ItemCodeUniqueCustomValidator" runat="server" ControlToValidate="txtItemCode" 
                                    OnServerValidate="ItemCodeUniqueCustomValidator_OnServerValidate" Display="Dynamic" CssClass="Important"
                                    ErrorMessage='<%# ResourceManager.GetPhrase("ItemCodeInUse", "The Item Code is in use. Enter a unique Item Code.") %>' />
                            </div>
                        </div>

                        <div style="clear: both;">
                        </div>  
                        
                        <asp:UpdatePanel ID="PriceUpdatePanel" runat="server" UpdateMode="Always">
                            <ContentTemplate>
                                <div class="PanelField Left">
                                    
                                    <div style="display: inline;">
                                        <asiweb:StyledLabel runat="server" ID="StandardPriceLabel" CssClass="Required" Text='<%# ResourceManager.GetPhrase("StandardPrice", "Standard Price")%>'
                                            AssociatedControlID="txtStandardPrice"></asiweb:StyledLabel>
                                    </div>
                                    <div class="PanelFieldValue">
                                        <asiweb:BusinessTextBox runat="server" ID="txtStandardPrice"></asiweb:BusinessTextBox>
                                        <asiweb:AsiRequiredFieldValidator runat="server" ID="StandardPriceRequired" ControlToValidate="txtStandardPrice"
                                            CssClass="Important" SetFocusOnError="true"></asiweb:AsiRequiredFieldValidator>
                                    </div>
                                    <div class="PanelFieldValue">
                                        <asp:RangeValidator runat="server" ID="StandardPriceRange" Type="Currency" ControlToValidate="txtStandardPrice"
                                                Display="Dynamic" MinimumValue="0" MaximumValue="1000000"
                                                CssClass="Important" 
                                                ErrorMessage='<%# ResourceManager.GetPhrase("PriceOutOfRange", "Must be a currency amount between 0 and 1000000.")%>' />
                                    </div>
                                    <div class="PanelFieldValue">
                                        <div class="PanelFieldLabel">
                                            <asiweb:BusinessCheckBox ID="PriceIsTotalCheckBox" runat="server" OnCheckedChanged="PriceIsTotalCheckedChanged" Visible="false" AutoPostBack="true"/>
                                        </div>
                                        <div class="PanelFieldLabel">
                                            <asiweb:StyledLabel runat="server" ID="PriceIsTotalCheckBoxLabel" Text='<%# ResourceManager.GetPhrase("PriceIsTotal", "Price is total of components")%>' Visible="false"></asiweb:StyledLabel>
                                        </div>
                                    </div>

                                </div>
                                <div class="PanelField Left">
                                    
                                    <div style="display: inline;">
                                        <asiweb:StyledLabel runat="server" ID="DiscountPriceLabel" CssClass="Required" Text='<%# ResourceManager.GetPhrase("DiscountPrice", "Discount Price")%>'
                                            AssociatedControlID="txtDiscountPrice"></asiweb:StyledLabel>
                                    </div>
                                    <div class="PanelFieldValue">
                                        <asiweb:BusinessTextBox runat="server" ID="txtDiscountPrice"></asiweb:BusinessTextBox>
                                        <asiweb:AsiRequiredFieldValidator runat="server" ID="DiscountPriceRequired" ControlToValidate="txtDiscountPrice"
                                            CssClass="Important" SetFocusOnError="true"></asiweb:AsiRequiredFieldValidator>
                                    </div>
                                    <div class="PanelFieldValue">
                                    <asp:RangeValidator runat="server" ID="DiscountPriceRange" Type="Currency" ControlToValidate="txtDiscountPrice"
                                            Display="Dynamic" MinimumValue="0" MaximumValue="1000000"
                                            CssClass="Important" 
                                            ErrorMessage='<%# ResourceManager.GetPhrase("PriceOutOfRange", "Must be a currency amount between 0 and 1000000.")%>' />
                                    </div>
                                   </div>
                                <div style="clear: both;">
                                </div>
                            </ContentTemplate>
                        </asp:UpdatePanel>
                        <div runat="server" id="DivGroups">
                        <div class="PanelField Left">
                            <div class="PanelFieldLabel">
                                <asiweb:BusinessCheckBox runat="server" ID="GroupProperties" CssClass="" OnCheckedChanged="GroupPropertiesChanged" AutoPostBack="true" />
                            </div>
                            <div class="PanelFieldLabel">
                                <asiweb:StyledLabel runat="server" ID="GroupPropertiesLabel" CssClass="" Text='<%# ResourceManager.GetPhrase("GroupProperties", "Assign purchaser to a group")%>'></asiweb:StyledLabel>
                            </div>
                        </div>
                        <div style="clear: both;">
                        </div>
                        <asp:Panel ID="panelGroupProperties" runat="server">
                            <div class="PanelField Left">
                                <div>
                                    <asiweb:StyledLabel runat="server" ID="GroupListLabel" CssClass="Required" Text='<%# ResourceManager.GetPhrase("GroupName", "Group")%>'
                                        AssociatedControlID="GroupList"></asiweb:StyledLabel>
                                </div>
                                <div class="PanelFieldValue">
                                    <asiweb:BusinessComboBox runat="server" ID="GroupList" EmptyMessage='<%# ResourceManager.GetWord("(Select)")%>' EnableLoadOnDemand="True" ShowMoreResultsBox="True"
                                    EnableVirtualScrolling="True" OnItemsRequested="GroupListItemsRequested"  ItemsPerRequest="10" SkinID="radGroupList" OnSelectedIndexChanged="GroupListSelected"  AutoPostBack="true" CausesValidation="false"></asiweb:BusinessComboBox>
                                </div>
                            </div>
                            <div style="clear: both;"></div>  
                            <div class="PanelField Left">
                                <div>
                                    <asiweb:StyledLabel runat="server" ID="RoleLabel" CssClass="Required" Text='<%# ResourceManager.GetPhrase("GroupRole", "Group Role")%>'
                                        AssociatedControlID="GroupRoleList" ></asiweb:StyledLabel>
                                </div>
                                <div class="PanelFieldValue">
                                    <asiweb:BusinessComboBox runat="server" ID="GroupRoleList" EmptyMessage='<%# ResourceManager.GetWord("(Select)")%>' AllowCustomText="false" ></asiweb:BusinessComboBox>
                                    <asiweb:AsiRequiredFieldValidator runat="server" ID="AsiRequiredFieldValidator1" ControlToValidate="GroupRoleList"
                                        CssClass="Important" SetFocusOnError="true"></asiweb:AsiRequiredFieldValidator>
                                </div>
                            </div>
                        </asp:Panel>
                        <div style="clear: both;">
                        </div>
                        </div>
                    </asiweb:PanelTemplateColumn>
                    <asiweb:PanelTemplateColumn ID="Col2" runat="server">
                        <asiCommon:ItemCreatorPicture id="ItemCreatorPicture" runat="Server"/>
                    </asiweb:PanelTemplateColumn>

                    <asiweb:PanelTemplateControl ID="ItemSetPropertiesPanel" runat="server" ShowButtons="false" ShowHeader="true" Collapsible="false" Collapsed="false" TemplateTitle="Item Set Properties" BorderWidth="0" Visible="false">
                            <asp:Panel ID="ItemSetPropertiesPanelHelper" runat="server" CssClass="AutoWidth">  
                                <asiweb:StyledRadioButton ID="MultipleComponentsRadioButton" runat="server" DisplayCaption="true" PositionCaption="Right"
                                        Caption='<%# ResourceManager.GetPhrase("MultipleComponents", "Customer may select multiple components")%>' RenderPanelField="true"
                                        AutoPostBack="true" GroupName="ItemSetProperties" Checked="false" Enabled="true" OnCheckedChanged="ItemSetPropertiesRadioChanged" />
                                <div style="clear:both;"></div>
                                <asp:Panel ID="MultipleComponentsPanelHelper" runat="server" CssClass="AutoWidth SubItems" >
                                    <div style="display:table;">
                                    <div style="display:table-row;">
                                        <div style="display:table-cell;padding-right:1em;">
                                            <asiweb:StyledLabel runat="server" ID="MinimumComponentSelectionsLabel" CssClass="Required" Text='<%# ResourceManager.GetPhrase("MinimumComponentSelections", "Minimum component selections")%>'
                                                AssociatedControlID="txtMinimumComponentSelections"></asiweb:StyledLabel>
                                        </div>
                                        <div style="display:table-cell;">
                                            <asiweb:BusinessTextBox runat="server" ID="txtMinimumComponentSelections" RenderPanelField="false" ></asiweb:BusinessTextBox>
                                            <asp:RangeValidator ID="MinimumComponentSelectionsRangeValidator" runat="server" MinimumValue="0" MaximumValue="<%#MaxComponentCount%>" Type="Integer" Display="Dynamic"
                                                ControlToValidate="txtMinimumComponentSelections" CssClass="Important" SetFocusOnError="true" 
                                                ErrorMessage='<%# ResourceManager.GetPhrase("MinimumComponentSelectionsRange", "Must be a whole number between 0 and {0}",MaxComponentCount)  %>' />
                                            <asiweb:AsiRequiredFieldValidator runat="server" ID="MinimumComponentSelectionsRequired" ControlToValidate="txtMinimumComponentSelections" Display="Dynamic"    
                                                CssClass="Important" SetFocusOnError="true"></asiweb:AsiRequiredFieldValidator>
                                            <%-- We attach txtMinimumComponentSelections and txtMaximumComponentSelections to this custom validator using some javascript in Asi_Web_iParts_Commerce_ItemCreatorDisplay.OnLoad() --%>
                                            <%-- The validator will automatically fire when we save, but we also want it to fire when we change min or max --%>
                                            <asp:CustomValidator runat="server" ID="ComponentSelectionsCustomValidator" Display="Dynamic" CssClass="Important" />
                                        </div>
                                    </div>
                                    <div style="display:table-row;">
                                        <div style="display:table-cell;padding-right:1em;padding-top:0.18em;">
                                            <asiweb:StyledLabel runat="server" ID="MaximumComponentSelectionsLabel" CssClass="Required" Text='<%# ResourceManager.GetPhrase("MaximumComponentSelections", "Maximum component selections")%>'
                                                AssociatedControlID="txtMaximumComponentSelections"></asiweb:StyledLabel>
                                        </div>
                                        <div style="display:table-cell;padding-top:0.18em;">
                                            <asiweb:BusinessTextBox runat="server" ID="txtMaximumComponentSelections" RenderPanelField="false" ></asiweb:BusinessTextBox>
                                            <asp:RangeValidator ID="MaximumComponentSelectionsRangeValidator" runat="server" MinimumValue="0" MaximumValue="<%#MaxComponentCount%>" Type="Integer" Display="Dynamic"
                                                ControlToValidate="txtMaximumComponentSelections" CssClass="Important" SetFocusOnError="true" 
                                                ErrorMessage='<%# ResourceManager.GetPhrase("MaximumComponentSelectionsRange", "Must be a whole number between 0 and {0}", MaxComponentCount)  %>' />
                                            <asiweb:AsiRequiredFieldValidator runat="server" ID="MaximumComponentSelectionsRequired" ControlToValidate="txtMaximumComponentSelections"    
                                                CssClass="Important" SetFocusOnError="true" Display="Dynamic"></asiweb:AsiRequiredFieldValidator>
                                        </div>
                                    </div>                          
                                    </div>                          
                                </asp:Panel>

                                <asiweb:StyledRadioButton ID="OneComponentRadioButton" runat="server" DisplayCaption="true" PositionCaption="Right"
                                    Caption='<%# ResourceManager.GetPhrase("OneComponent", "Customer must select only one component")%>' RenderPanelField="true"
                                    AutoPostBack="true" GroupName="ItemSetProperties" Checked="true" Enabled="true" OnCheckedChanged="ItemSetPropertiesRadioChanged" /> 
                                <asiweb:StyledRadioButton ID="AllComponentsRadioButton" runat="server" DisplayCaption="true" PositionCaption="Right"
                                    Caption='<%# ResourceManager.GetPhrase("AllComponents", "All components are selected by default and required")%>' RenderPanelField="true"
                                    AutoPostBack="true" GroupName="ItemSetProperties" Checked="false" Enabled="true" OnCheckedChanged="ItemSetPropertiesRadioChanged" />
                            </asp:Panel>
                        </asiweb:PanelTemplateControl>

                    <asp:UpdatePanel ID="GridUpdatePanel" runat="server" UpdateMode="Always">
                        <ContentTemplate>
                            <asiweb:PanelTemplateControl ID ="GridPanel" runat="server" ShowButtons="false" ShowHeader="true" Collapsible="false" Collapsed="false" TemplateTitle='<%# ResourceManager.GetPhrase("ItemSetComponents", "Item Set Components")%>' BorderWidth="0" Visible="false">
                                    <asiweb:BusinessDataGrid2 ID="CollectionItemsGrid" runat="server" Visible="true" EnableViewstate="true" AutoPostBack="true" AllowPaging="true" PageSize="9999"
                                        OnItemDeleted="CollectionItemsGrid_OnItemDeleted" 
                                        OnNeedDataSource="CollectionItemsGrid_NeedDataSource"
                                        OnItemDataBound="CollectionItemsGrid_OnItemDataBound">
                                        <ClientSettings AllowKeyboardNavigation="True"/>
                                        <MasterTableView AutoGenerateColumns="false" CommandItemDisplay="Top" NoMasterRecordsText='<%# ResourceManager.GetPhrase("NoSetItems", "There are no set items.") %>'>
                                            <CommandItemStyle HorizontalAlign="right" />
                                            <CommandItemTemplate>
                                                <asp:LinkButton ID="AddLinkButton" runat="server" CommandName="AddComponent" CausesValidation="false" Text='<%# ResourceManager.GetPhrase("(add)", "(add)")%>'/>
                                                <div runat="server" id="SeriesOfCollectionsOptionsDiv" style="text-align:left;padding:1em 1em 1em 1em">
                                                    <asp:LinkButton runat="server" ID="AddExistingCollectionLinkButton" CausesValidation="false" Text='<%# ResourceManager.GetPhrase("AddExistingCollectionToSeries", "Add an existing collection to this series")%>' />
                                                </div>
                                            </CommandItemTemplate>
                                            <Columns>
                                                    <telerik:GridBoundColumn 
                                                    DataField="Item.ItemCode"
                                                    HeaderText="Item Code"
                                                    />
                                                    <telerik:GridBoundColumn 
                                                    DataField="Item.Name"
                                                    HeaderText="Product"
                                                    />
                                                    <telerik:GridTemplateColumn
                                                    HeaderText="Default"
                                                    UniqueName="DefaultColumn">
                                                        <ItemTemplate>
                                                            <asiweb:BusinessCheckBox ID="IsDefaultCheckBox" runat="server" OnCheckedChanged="IsDefaultChanged"  AutoPostBack="true"  />
                                                        </ItemTemplate> 
                                                    </telerik:GridTemplateColumn>                                                    
                                                    <telerik:GridTemplateColumn
                                                    HeaderText="Quantity"
                                                    UniqueName="QuantityColumn">
                                                        <ItemTemplate>
                                                            <telerik:RadNumericTextBox ID="QuantityTextBox" runat="server" 
                                                                AutoPostBack="true" ValidationText="GridErrorMessage"
                                                                EnableViewState="true" ShowSpinButtons="true" 
                                                                OnTextChanged="QuantityTextBox_OnTextChanged"
                                                                AllowOutOfRangeAutoCorrect="true"
                                                                MinValue="1"
                                                                MaxValue="<%#MaxComponentCount%>">
                                                                    <ClientEvents OnValueChanged="checksubmit" OnKeyPress="QuantityOrDisplayOrderKeyPressed"/>
                                                                    <NumberFormat DecimalDigits="0" GroupSeparator=""/>
                                                            </telerik:RadNumericTextBox> 
                                                        </ItemTemplate> 
                                                    </telerik:GridTemplateColumn>                                                    
                                                    <telerik:GridTemplateColumn
                                                    HeaderText="Max Quantity"
                                                    UniqueName="MaxQuantityColumn">
                                                        <ItemTemplate>
                                                            <telerik:RadNumericTextBox ID="MaxQuantityTextBox" runat="server" 
                                                                AutoPostBack="true" ValidationText="GridErrorMessage"
                                                                EnableViewState="true" ShowSpinButtons="true" 
                                                                OnTextChanged="MaxQuantityTextBox_OnTextChanged"
                                                                AllowOutOfRangeAutoCorrect="true"
                                                                MinValue="0"
                                                                MaxValue="<%#MaxComponentCount%>">
                                                                    <ClientEvents OnValueChanged="checksubmit" OnKeyPress="QuantityOrDisplayOrderKeyPressed"/>
                                                                    <NumberFormat DecimalDigits="0" GroupSeparator=""/>
                                                            </telerik:RadNumericTextBox> 
                                                        </ItemTemplate> 
                                                    </telerik:GridTemplateColumn>
                                                    <telerik:GridTemplateColumn 
                                                    HeaderText="Display Order"
                                                    UniqueName="DisplayOrderColumn">
                                                    <ItemTemplate>
                                                        <telerik:RadNumericTextBox ID="DisplayOrderTextBox" runat="server" ShowSpinButtons="true"
                                                            MinValue="1" AutoPostBack="true" EnableViewState="true"
                                                            OnTextChanged="DisplayOrderTextBox_OnTextChanged">
                                                                <ClientEvents OnValueChanged="checksubmit" OnKeyPress="QuantityOrDisplayOrderKeyPressed"/>
                                                                <NumberFormat DecimalDigits="0"/>
                                                                <IncrementSettings Step="-1" /> 
                                                        </telerik:RadNumericTextBox>
                                                    </ItemTemplate>   
                                                    </telerik:GridTemplateColumn>
                                                    <telerik:GridTemplateColumn UniqueName="Remove">
                                                        <ItemTemplate>
                                                            <asp:LinkButton ID="RemoveLink" runat="server" Text="remove" OnClick="RemoveLink_OnClick" CausesValidation="false"/>
                                                        </ItemTemplate>
                                                    </telerik:GridTemplateColumn>
                                            </Columns>
                                        </MasterTableView>
                                    </asiweb:BusinessDataGrid2>
                                    <div style="clear: both;">
                                    </div>
                                    <asiweb:StyledLabel runat="server" ID="GridErrorMessage" Visible="false" CssClass="Error"></asiweb:StyledLabel>
                                    <asiweb:BusinessTextBox ID="HiddenProductGuidTextBox" runat="server" Style="display: none"/>
                                    <asp:Button ID="HiddenButton" runat="server" OnClick="HiddenButton_OnClick" CausesValidation="false" Style="display: none"/>

                             </asiweb:PanelTemplateControl>
                        </ContentTemplate>
                    </asp:UpdatePanel>
                </asiweb:PanelTemplateControl>
            </telerik:RadPageView>
            <telerik:RadPageView ID="RadPageAccounting" runat="server" EnableViewState="true">
                <asiweb:PanelTemplateControl ID="PanelTemplateControl1" runat="server" ShowButtons="false"
                    ShowHeader="false" Collapsible="false" Collapsed="false" TemplateTitle="" BorderWidth="0">
                        <asiweb:PanelTemplateColumn ID="PanelTemplateColumn1" runat="server"  Width="40%">
                            <div class="PanelField Left">
                                <div>
                                    <asiweb:StyledLabel runat="server" ID="FinancialEntityLabel" Text='<%# ResourceManager.GetPhrase("FinancialEntity", "Financial Entity")%>' AssociatedControlID="SelectedFinancialEntity"></asiweb:StyledLabel>
                                </div>
                                <div class="PanelFieldValue">
                                    <asiweb:StyledLabel runat="server" ID="SelectedFinancialEntity" Text=''></asiweb:StyledLabel>
                                </div>
                            </div>
                            <div class="PanelField Left">
                                <div>
                                    <asiweb:StyledLabel runat="server" ID="AccountMethodLabel" Text='<%# ResourceManager.GetPhrase("AccountingMethod", "Accounting Method")%>'
                                        AssociatedControlID="AccountingMethodDropDown"></asiweb:StyledLabel>
                                </div>
                                <div class="PanelFieldValue">
                                        <asiweb:BusinessDropDownList runat="server" ID="AccountingMethodDropDown" RenderPanelField="false" AutoPostBack="false" Required="true" />
                                        <asiweb:AsiRequiredFieldValidator runat="server" ID="AccountingMethodRequired" ControlToValidate="AccountingMethodDropDown"
                                            CssClass="Important" SetFocusOnError="true"></asiweb:AsiRequiredFieldValidator>
                                </div>
                            </div>
                            <div class="PanelField Left">
                                <div>
                                    <asiweb:StyledLabel runat="server" ID="TaxCategoryLabel" Text='<%# ResourceManager.GetPhrase("TaxCategory", "Tax Category")%>'
                                        AssociatedControlID="TaxCategoryDropDown"></asiweb:StyledLabel>
                                </div>
                                <div class="PanelFieldValue">
                                        <asiweb:BusinessDropDownList runat="server" ID="TaxCategoryDropDown" RenderPanelField="false" AutoPostBack="false" Required="true" />
                                </div>
                            </div>
                            <div class="PanelField Left">
                                <div>
                                    <asiweb:StyledLabel runat="server" ID="TaxScheduleLabel" Text='<%# ResourceManager.GetPhrase("TaxSchedule", "Tax Schedule")%>'
                                        AssociatedControlID="TaxScheduleDropDown"></asiweb:StyledLabel>
                                </div>
                                <div class="PanelFieldValue">
                                     <asiweb:BusinessDropDownList runat="server" ID="TaxScheduleDropDown" RenderPanelField="false" AutoPostBack="false" Required="true" />
                                </div>
                            </div>
                        </asiweb:PanelTemplateColumn>
                        <asiweb:PanelTemplateColumn ID="PanelTemplateColumn2" runat="server">
                            <div class="PanelField Left">
                                <div class="PanelFieldLabel">
                                    <asp:CheckBox ID="IncursShippingCheckBox" runat="server" />
                                </div>
                                <div class="PanelFieldLabel">
                                     <asiweb:StyledLabel runat="server" ID="IncursShippingLabel" Text='<%# ResourceManager.GetPhrase("IncursShipping", "Incurs Shipping")%>'></asiweb:StyledLabel>
                                </div>
                            </div>
                            <div class="PanelField Left">
                                <div class="PanelFieldLabel">
                                    <asp:CheckBox ID="IncursHandlingCheckBox" runat="server" />
                                </div>
                                <div class="PanelFieldLabel">
                                        <asiweb:StyledLabel runat="server" ID="IncursHandlingLabel" Text='<%# ResourceManager.GetPhrase("IncursHandling", "Incurs Handling")%>'></asiweb:StyledLabel>
                                </div>
                            </div>
                        </asiweb:PanelTemplateColumn>
                </asiweb:PanelTemplateControl>
                <asiweb:PanelTemplateControl ID="AccountTemplate" runat="server" ShowButtons="false"
                    ShowHeader="true" Collapsible="false" Collapsed="false" TemplateTitle="" BorderWidth="0">
                            <asiweb:BusinessLabel ID="Instructions" runat="server"></asiweb:BusinessLabel>
                            <br />
                            <asiCommon:GeneralLedger ID="AccountsReceivable" runat="Server" AccountType="AccountsReceivable"></asiCommon:GeneralLedger>
                            <asiCommon:GeneralLedger ID="Income" runat="Server" AccountType="Income"></asiCommon:GeneralLedger>
                </asiweb:PanelTemplateControl>
            </telerik:RadPageView>
        </telerik:RadMultiPage>
    </div>
</asp:Panel>
