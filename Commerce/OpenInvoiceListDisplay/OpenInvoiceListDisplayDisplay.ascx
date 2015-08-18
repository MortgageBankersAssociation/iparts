<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="OpenInvoiceListDisplayDisplay.ascx.cs" Inherits="Asi.Web.iParts.Commerce.OpenInvoiceListDisplay.OpenInvoiceListDisplayDisplay" %>
<%@ Import Namespace="Asi" %>
<%@ Register TagPrefix="telerik" Namespace="Telerik.Web.UI" Assembly="Telerik.Web.UI" %>
<%@ Register TagPrefix="asiweb" Assembly="Asi.Web" Namespace="Asi.Web.UI.WebControls" %>

<asp:Panel ID="ContentPanel" runat="server" Visible="true">
    <asiweb:TitleBar ID="TitleBar" Text="<%#PageTitle%>" OptionsMenuBehavior="AlwaysDisplay" runat="server" />  
    <asiweb:BusinessDataGrid2 ID="OpenInvoicesGrid" runat="server" AllowSorting="true" AllowPaging="true" PageSize="10"
        OnNeedDataSource="OpenInvoicesGridNeedDataSource" OnItemDataBound="OpenInvoicesGridItemDataBound">
        <MasterTableView AutoGenerateColumns="false" EnableNoRecordsTemplate="true" DataKeyNames="InvoiceId"
            NoMasterRecordsText='<%# ResourceManager.GetPhrase("ThereAreNoRecords", "There are no records.") %>'>
            <Columns>                  
                <telerik:GridTemplateColumn 
                    HeaderText="Pay" 
                    ItemStyle-Width="5%"                    
                    UniqueName="PayInvoice">
                    <ItemTemplate>
                        <asp:CheckBox ID="PayInvoiceCheckBox" runat="server" OnCheckedChanged="PayInvoiceCheckBoxCheckedChanged" AutoPostBack="true" />
                    </ItemTemplate>
                </telerik:GridTemplateColumn>
                <telerik:GridHyperLinkColumn 
                    DataTextField="InvoiceNumber"
                    DataNavigateUrlFields="InvoiceId"    
                    DataType="System.Int32"
                    HeaderText="Invoice"
                    UniqueName="InvoiceNumber" />
                <telerik:GridBoundColumn 
                    DataField="InvoiceDate"
                    DataType="System.DateTime" 
                    DataFormatString="{0:d}"
                    HeaderText="Date"
                    UniqueName="InvoiceDate" />
                <telerik:GridBoundColumn 
                    DataField="Description"
                    DataType="System.String"
                    HeaderText="Description"
                    UniqueName="Description" />
                <telerik:GridBoundColumn 
                    DataField="DueDate"
                    DataType="System.DateTime"
                    DataFormatString="{0:d}"
                    HeaderText="Due Date"
                    UniqueName="DueDate" />                                 
                <telerik:GridBoundColumn 
                    DataField="InvoiceAmount"
                    DataType="System.String"
                    HeaderText="Amount"
                    HeaderStyle-HorizontalAlign="Center"
                    ItemStyle-HorizontalAlign="Right"
                    UniqueName="InvoiceAmount" />  
                <telerik:GridBoundColumn 
                    DataField="Balance"
                    DataType="System.String"
                    HeaderText="Balance Due"
                    HeaderStyle-HorizontalAlign="Center"
                    ItemStyle-HorizontalAlign="Right"
                    UniqueName="Balance" />             
            </Columns>
            <NestedViewTemplate>
                <asp:Panel runat="server" CssClass="ChildGridWrapper">
                    <asiweb:BusinessDataGrid2 ID="InvoiceLinesGrid" runat="server"  AllowSorting="true" AllowPaging="true" PageSize="10">
                        <MasterTableView AutoGenerateColumns="false" DataKeyNames="InvoiceLineId" ShowHeader="true" ShowFooter="false">
                            <Columns>
                                <telerik:GridTemplateColumn ItemStyle-Width="5%">
                                    <HeaderTemplate>
                                        <asp:Literal runat="server" Text="&nbsp;"/>
                                    </HeaderTemplate>                                
                                </telerik:GridTemplateColumn>
                                <telerik:GridBoundColumn 
                                    AllowSorting="false"
                                    DataField="Item.Name"
                                    DataType="System.String"
                                    HeaderText="Item"
                                    UniqueName="InvoiceLineDescription" />
                                <telerik:GridBoundColumn 
                                    AllowSorting="false"
                                    DataField="ExtendedAmount"
                                    DataType="System.String"
                                    HeaderText="Amount"
                                    HeaderStyle-HorizontalAlign="Center"
                                    ItemStyle-HorizontalAlign="Right"
                                    UniqueName="InvoiceLineAmount" />
                            </Columns>
                        </MasterTableView>
                    </asiweb:BusinessDataGrid2>
                </asp:Panel>
            </NestedViewTemplate>
        </MasterTableView>
    </asiweb:BusinessDataGrid2>
    <asiweb:PanelTemplateControl runat="server" CssClass="NoBorder" ShowHeader="false" BorderStyle="None">
        <asiweb:PanelTemplateColumn runat="server" Width="50%">
            <asiweb:StyledLabel ID="TotalBalanceDueLabel" runat="server" DisplayCaption="true" PositionCaption="Left" RenderPanelField="true"
                Caption='<%# ResourceManager.GetPhrase("TotalBalanceDue", "Total Balance Due") %>' /> 
        </asiweb:PanelTemplateColumn>
        <asiweb:PanelTemplateColumn runat="server" Width="50%">
            <asiweb:StyledLabel ID="TotalSelectedLabel" runat="server" DisplayCaption="true" PositionCaption="Left" RenderPanelField="true"
                Caption='<%# ResourceManager.GetPhrase("TotalSelected", "Total Selected") %>' />  
        </asiweb:PanelTemplateColumn>
        <asiweb:PanelTemplateColumn runat="server">
            <asiweb:StyledButton ID="CartButton" runat="server" OnClick="CartButtonOnClick" />
        </asiweb:PanelTemplateColumn>
    </asiweb:PanelTemplateControl>
</asp:Panel>       
