<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="AccountingInformation.ascx.cs" Inherits="Asi.Web.iParts.Events.Common.AccountingInformation" %>
<%@ Register TagPrefix="asiEvent" TagName="GeneralLedger" Src="GeneralLedgerAccountDisplay.ascx" %>
<%@ Import Namespace="Asi" %>
   <asiweb:PanelTemplateControl ID="AccountTemplate" runat="server" ShowButtons="false"
                    ShowHeader="true" Collapsible="false" Collapsed="false" TemplateTitle="" BorderWidth="0">
                            <asiweb:BusinessLabel ID="Instructions" runat="server"></asiweb:BusinessLabel>
                            <br />
                            <asiEvent:GeneralLedger  ID="AccountsReceivable" runat="Server" AccountType="AccountsReceivable"  ></asiEvent:GeneralLedger>
                             <asiEvent:GeneralLedger ID="Income" runat="Server" AccountType="Income" ></asiEvent:GeneralLedger>
                        
   </asiweb:PanelTemplateControl>
         