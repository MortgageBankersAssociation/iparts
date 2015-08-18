<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="MenuOfOptionsProductDisplayDisplay.ascx.cs" Inherits="Asi.Web.iParts.Commerce.GeneralProductDisplay.MenuOfOptionsProductDisplayDisplay" %>
<%@ Register TagPrefix="telerik" Namespace="Telerik.Web.UI" Assembly="Telerik.Web.UI" %>
<%@ Register TagPrefix="asi" Assembly="Asi.Web" Namespace="Asi.Web.UI.WebControls" %>
<%@ Register Assembly="System.Web.Extensions, Version=3.5.0.0, Culture=neutral, PublicKeyToken=31bf3856ad364e35"
    Namespace="System.Web.UI.WebControls" TagPrefix="asp" %>

<asp:Panel ID="ContentPanel" runat="server" Visible="true">
    <asp:UpdatePanel runat="server" ChildrenAsTriggers="true">
        <ContentTemplate>
            <input ID="OrderLineHiddenField" runat="server" type="hidden" />
            <asi:TitleBar ID="TitleBar" Text="<%#PageTitle%>" OptionsMenuBehavior="AlwaysDisplay" runat="server" ></asi:TitleBar>
            <asi:StyledLabel runat="server" ID="TopMessage" Visible="false" ></asi:StyledLabel>
            <asi:PanelTemplateControl runat="server" ID="ProductSetDetailsPanel" Collapsible="false" >
                <asp:Panel ID="DataPanel" runat="server" style=" display: inline-table; max-width: 95%; width:auto;">   
                    <asp:Label ID="ParentProductDescriptionLabel" runat="server"></asp:Label>
                    <asp:Repeater ID="MooRepeater" runat="server" OnItemDataBound="MooRepeaterItemDataBound" >
                        <ItemTemplate >
                            <h4><asp:Label ID="MooProductNameLabel" runat="server"></asp:Label></h4>
                            <asp:Label ID="MooProductDescriptionLabel" runat="server" ></asp:Label>
                            <asp:Label ID="OrderLineKeyLabel" runat="server" Visible="false" ></asp:Label>
                            <asp:ListView ID="ChildMooListView" runat="server"
                                OnItemDataBound="ChildMooListViewItemDataBound" OnLayoutCreated="ChildMooListViewLayoutCreated">
                                <LayoutTemplate>            
                                    <table runat="server" id="MooListTable" class="Grid"  cellpadding="2" cellspacing="2" width="100%" style="Width:100%!Important;" >
                                        <tr>
                                            <th width="0%" style="display: none" ></th>
                                            <th  style="width: 1%; " ></th>
                                            <th style=" white-space: nowrap; width:80%;" class="TextStyle"><asi:StyledLabel ID="lblDescription" runat="server" Text="" RenderPanelField="false"></asi:StyledLabel></th>
                                            <th style=" white-space: nowrap; width: 5%;" class="PriceStyles"><asi:StyledLabel ID="lblUnitPrice" runat="server" Text="" RenderPanelField="false"></asi:StyledLabel></th>
                                            <th style="white-space: nowrap; width: 7%; " class="NumberStyle"><asi:StyledLabel ID="lblQuantity" runat="server" Text="" RenderPanelField="false"></asi:StyledLabel></th>
                                            <th style="white-space: nowrap; width: 7%; " class="PriceStyles"><asi:StyledLabel ID="lblAmount" runat="server" Text="" RenderPanelField="false"></asi:StyledLabel></th>
                                        </tr> 
                                        <tr runat="server" id="itemPlaceholder" ></tr>
                                    </table> 
                            
                                </LayoutTemplate>
                                <ItemTemplate>
                                    <tr id="Tr1"  runat="server">
                                        <td id="OrderLineKeyCell" style="display: none;">
                                            <asi:StyledLabel runat="server" ID="OrderLineKeyLabel" Text='<%# Eval("OrderLineId") %>' style="display:none" ></asi:StyledLabel>
                                            <asi:StyledLabel runat="server" ID="ParentOrderLineKeyLabel" style="display:none" ></asi:StyledLabel>
                                        </td>

                                        <td id="SelectCell" style="width: 1%; " >
                                            <asp:CheckBox runat="server" ID="SelectCheckBox" OnCheckedChanged="SelectControlCheckedChanged" 
                                                AutoPostBack="true" ValidationGroup='<%# UniqueID %>'></asp:CheckBox>
                                            <asi:StyledRadioButton runat="server" ID="SelectRadioButton" OnCheckedChanged="SelectControlCheckedChanged"
                                                AutoPostBack="true" ValidationGroup='<%# UniqueID %>'></asi:StyledRadioButton>
                                        </td>
                                        <td id="ProductNameCell" style="width:80%; ">
                                            <asi:StyledLabel ID="ProductNameLabel" runat="server" ></asi:StyledLabel>
                                        </td>
                                                            
                                        <td id="UnitPriceCell" align="right" style="width: 5%;" class="PriceStyles">
                                            <asi:StyledLabel ID="UnitPriceLabel" runat="server" ></asi:StyledLabel>
                                        </td>
                                
                                        <td id="QuantityCell" align="right" style="width: 7%; " class="PriceStyles">
                                            <asi:StyledLabel ID="QuantityLabel" runat="server" ></asi:StyledLabel>
                                            <asp:TextBox ID="QuantityTextBox" runat="server" Width="1.5em" 
                                                Style="text-align:right" OnTextChanged="QuantityTextBoxTextChanged" 
                                                AutoPostBack="true" ValidationGroup='<%# UniqueID %>'></asp:TextBox>
                                            <asp:RangeValidator ID="QuantityRangeValidator" runat="server" ControlToValidate="QuantityTextBox" 
                                                CssClass="Error" Display="None" Type="Double" ValidationGroup='<%# UniqueID %>'></asp:RangeValidator>
                                        </td>
                                
                                        <td id="AmountCell" align="right" style="width: 7%;" class="PriceStyles">
                                            <asi:StyledLabel ID="AmountLabel" runat="server" Text='<%# Eval("ExtendedAmount", "{0:N}") %>' ></asi:StyledLabel>
                                            <asp:TextBox ID="AmountTextBox" runat="server" Width="3em" style="text-align:right" 
                                                Text='<%# Eval("ExtendedAmount", "{0:N}") %>' OnTextChanged="AmountTextBoxTextChanged"
                                                AutoPostBack="true" ValidationGroup='<%# UniqueID %>' ></asp:TextBox>
                                            <asp:CompareValidator ID="MinAmountCompareValidator" runat="server" ControlToValidate="AmountTextBox" 
                                                CssClass="Error" Display="None" Type="Currency" Operator="GreaterThanEqual" Enabled="false" 
                                                ValueToCompare="0" ValidationGroup='<%# UniqueID %>' ></asp:CompareValidator>
                                            <asp:CompareValidator ID="MaxAmountCompareValidator" runat="server" ControlToValidate="AmountTextBox" 
                                                CssClass="Error" Display="None" Type="Currency" Operator="LessThanEqual" Enabled="false" 
                                                ValueToCompare="0" ValidationGroup='<%# UniqueID %>'></asp:CompareValidator>
                                        </td>
                                    </tr>                      
                                </ItemTemplate>
                            </asp:ListView>
                            <asp:Label ID="MinInProductSetLabel" runat="server" style="display:none" ></asp:Label>
                            <asp:Label ID="MaxInProductSetLabel" runat="server" style="display:none" ></asp:Label>
                            <asp:CustomValidator ID="ProductSetItemsSelectedCustomValidator" runat="server" CssClass="Error" Display="None"
                                OnServerValidate="ProductSetItemsSelectedCustomValidator_OnServerValidate"
                                ValidationGroup='<%# UniqueID %>' ></asp:CustomValidator>
                        </ItemTemplate>
                    </asp:Repeater>    
                    <div style="width:100%; display: inline-table;">
                        <div style="float:right; ">
                            <b><asp:Label runat="server" ID="SubtotalLabel" Text='<%# Asi.ResourceManager.GetWord("Subtotal") %>'></asp:Label>&nbsp;&nbsp;
                            <asp:Label runat="server" ID="SubtotalValueLabel" ></asp:Label></b>        
                        </div>
                    </div>
                </asp:Panel>    
                <asp:ValidationSummary runat="server" ValidationGroup='<%# UniqueID %>' />
            </asi:PanelTemplateControl>            
        </ContentTemplate>
        <Triggers>
            <asp:PostBackTrigger ControlID="AddToCartButton" />
        </Triggers>
    </asp:UpdatePanel>
    <asp:Button ID="AddToCartButton" runat="server" ValidationGroup='<%# UniqueID %>' OnClick="AddToCartOnClick" />
    <asp:Label ID="AddToCartMessage" runat="server" ></asp:Label>&nbsp;
    <asi:BusinessHyperLink ID="CartLink" runat="server" ></asi:BusinessHyperLink>
    <asp:Button ID="RefreshButton" runat="server" CausesValidation="false" Style="display: none" OnClick="RefreshButtonClick" />
</asp:Panel>       
