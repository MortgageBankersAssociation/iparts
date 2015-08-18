<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="LogListDisplay.ascx.cs" Inherits="Asi.Web.iParts.Common.LogViewerForWebServices.LogListDisplay" %>
<%@ Import Namespace="Asi.Web" %>
<%@ Register Assembly="Telerik.Web.UI" Namespace="Telerik.Web.UI" TagPrefix="telerik" %>
<%@ Register Assembly="Asi.Web" Namespace="Asi.Web.UI.WebControls" TagPrefix="asiweb" %>


<asp:Label ID="ErrorLabel" runat="server"  CssClass="Error"></asp:Label>

<div style="padding: 0em 0em 0em 0.4em">
<telerik:RadGrid ID="LogGrid" runat="server" GridLines="None" Width="99.5%" OnItemCreated="LogGrid_ItemCreated"
    OnNeedDataSource="LogGrid_NeedDataSource" AllowSorting="true"  AllowFilteringByColumn="false"  >
    <GroupPanel ID="GroupPanel3" Style="width: 100%;">
    </GroupPanel>
    <ExportSettings  
        ExportOnlyData="true"
        IgnorePaging="true"
        OpenInNewWindow="true">
        <Pdf PaperSize="Letter" FontType="Subset" />
        <Excel Format="Html"></Excel>

    </ExportSettings>
    <MasterTableView CurrentResetPageIndexAction="SetPageIndexToFirst" Dir="LTR" Frame="Border" NoMasterRecordsText="There are no records."
        TableLayout="Auto" CommandItemDisplay="Top" AutoGenerateColumns="False" 
        DataKeyNames="Name" HierarchyLoadMode="Client">
        
        <CommandItemTemplate>
            <p align="right">
            <asp:ImageButton ID="wordImage" Visible="false" src="../../../../../../AsiCommon/Images/icon_word_shortcut.gif" runat="server" OnClick="OnExportWordClick"  />

            &nbsp;&nbsp;
            </p>
        </CommandItemTemplate>

        <RowIndicatorColumn CurrentFilterFunction="NoFilter" FilterListOptions="VaryByDataType"
            Visible="False">
            <HeaderStyle Width="20px"></HeaderStyle>
        </RowIndicatorColumn>
        <EditFormSettings>
            <EditColumn CurrentFilterFunction="NoFilter" FilterListOptions="VaryByDataType">
            </EditColumn>
        </EditFormSettings>
        <DetailTables >
            <telerik:GridTableView runat="server" AutoGenerateColumns="False" AllowFilteringByColumn="false">
                <Columns>
                    <telerik:GridBoundColumn DataField="Log" HeaderText="Log Text" UniqueName="Log">
                    </telerik:GridBoundColumn>
                </Columns>
                <ParentTableRelation>
                <telerik:GridRelationFields MasterKeyField="Name" DetailKeyField="Name" />
                </ParentTableRelation>
            </telerik:GridTableView>
        </DetailTables>
        <ExpandCollapseColumn Visible="True">
        </ExpandCollapseColumn>
        <Columns>
            <telerik:GridBoundColumn CurrentFilterFunction="NoFilter" DataField="Name" FilterListOptions="VaryByDataType"
                ForceExtractValue="None" HeaderText="Log Name" UniqueName="Name">
            </telerik:GridBoundColumn>
            <telerik:GridBoundColumn CurrentFilterFunction="NoFilter" DataField="DateCreated"
                FilterListOptions="VaryByDataType" ForceExtractValue="None" HeaderText="Date Created"
                UniqueName="DateCreated">
            </telerik:GridBoundColumn>
        </Columns>
    </MasterTableView>
</telerik:RadGrid>
</div>