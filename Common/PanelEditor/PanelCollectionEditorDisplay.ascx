<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="PanelCollectionEditorDisplay.ascx.cs" Inherits="Asi.Web.iParts.Common.PanelEditor.PanelCollectionEditorDisplay" %>
<%@ Register TagPrefix="telerik" Namespace="Telerik.Web.UI" Assembly="Telerik.Web.UI" %>
<%@ Register TagPrefix="asiweb" Assembly="Asi.Web" Namespace="Asi.Web.UI.WebControls" %>
<%@ Register TagName="PanelEditorDisplay" TagPrefix="PanelEditorDisplay" Src="PanelEditorDisplay.ascx" %>

<asp:Label ID="designMode" runat="server" Visible="false" CssClass="Information" />
           
<telerik:RadAjaxPanel ID="ajaxPanel1" runat="server">
    <telerik:RadTabStrip ID="tabStrip" SelectedIndex="0" ScrollChildren="false"   
        runat="server" MultiPageID="multiplePage" Orientation="HorizontalTop" ScrollPosition="0" ScrollButtonsPosition="Middle" 
        PerTabScrolling="true" CausesValidation="false" OnTabClick="TabStripTabClick" ShowBaseLine="true" style="position: relative;" >
    </telerik:RadTabStrip>   
        
    <telerik:RadMultiPage ID="multiplePage" runat="server" SelectedIndex="0" ScrollBars="Auto" Style="margin-top:-1px" />      
</telerik:RadAjaxPanel>

