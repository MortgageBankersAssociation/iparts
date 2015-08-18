<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="GeneralLedgerAccountDisplay.ascx.cs" Inherits="Asi.Web.iParts.Commerce.ItemCreator.GeneralLedgerAccountDisplay" %>
<%@ Register TagPrefix="asiweb" Assembly="Asi.Web" Namespace="Asi.Web.UI.WebControls" %>
<%@ Register TagPrefix="telerik" Namespace="Telerik.Web.UI" Assembly="Telerik.Web.UI" %>

<asp:Panel ID="contentPanel" runat="server" Visible="true">
     <asp:UpdatePanel ID="AccountPanel" runat="server" UpdateMode="Always" ChildrenAsTriggers="true">
        <ContentTemplate>
            <div class="PanelField Left">
                <div>
                    <asiweb:StyledLabel runat="server" ID="AccountLabel" AssociatedControlID="AccountList">
                    </asiweb:StyledLabel>
                </div>
                <div class="PanelFieldValue">
                    <asiweb:BusinessComboBox runat="server" 
                                     ID="AccountList" 
                                     EnableLoadOnDemand="True" 
                                     ShowMoreResultsBox="True"
                                     EnableVirtualScrolling="True" 
                                     OnItemsRequested="AccountListItemsRequested"  
                                     ItemsPerRequest="10" 
                                     SkinID="radAccountList" 
                                     OnSelectedIndexChanged="AccountSelected"  
                                     AutoPostBack="true" 
                                     CausesValidation="false"
                                     ShowNullItem="false">
                    </asiweb:BusinessComboBox>
                    <asiweb:AsiRequiredFieldValidator runat="server" ID="AccountRequired" ControlToValidate="AccountList" CssClass="Important" Display="Dynamic">
                    </asiweb:AsiRequiredFieldValidator>
                    <asp:CustomValidator ID="AccountCustomValidator" runat="server" CssClass="Important" Display="Dynamic" ControlToValidate="AccountList"
                        OnServerValidate="AccountSelectedCustomValidator_OnServerValidate" />
                </div>
            </div>
            <br />
            <div style="clear: both;"></div>
        </ContentTemplate>
    </asp:UpdatePanel>
</asp:Panel>