<%@ Control Language="C#" AutoEventWireup="True" CodeBehind="SearchConfigEdit.ascx.cs"  Inherits="Asi.Web.iParts.Common.Search.SearchConfigEdit" %>
<%@ Register Assembly="System.Web.Extensions, Version=3.5.0.0, Culture=neutral, PublicKeyToken=31bf3856ad364e35"    Namespace="System.Web.UI" TagPrefix="asp" %>
<%@ Register namespace="Asi.Web.UI.WebControls" tagPrefix="asiweb" Assembly="Asi.Web" %>
<%@ Register namespace="Telerik.Web.UI" tagPrefix="telerik" Assembly="Telerik.Web.UI" %>
<%@ Register TagPrefix="asi" TagName="TagSelector" Src="~/AsiCommon/Controls/ContentManagement/TagSelector.ascx" %>

<%--
This is your iPart Configuration Page
Place any controls and JS that you want to use in the iPart Configuration Page
--%>
<script id="SelectDocument" type="text/javascript">
	function SelectDocumentObject()
	{
		OpenObjectBrowser('TypeFilter=CON&DocumentPath=@', SetDocumentObject, true);
	}
	function SetDocumentObject(window) 
	{
		if (!window.result)
			return;
		var documentKey = window.result;
		if (documentKey != null && documentKey != "")
		{
			document.getElementById(HiddenDocumentKey_ClientID).value = documentKey;
			document.getElementById(ResetButton_ClientID).style.display = "inline";
		}

		var documentName = window.SelectedDocumentName;
		if (documentName != null && documentName != "")
			document.getElementById(DocumentNameLabel_ClientID).firstChild.nodeValue = documentName;
	}
	function ResetDocumentObject()
	{
		document.getElementById(HiddenDocumentKey_ClientID).value = "";
		document.getElementById(ResetButton_ClientID).style.display = "none";
		document.getElementById(DocumentNameLabel_ClientID).firstChild.nodeValue = NotSelectedText;
	}
</script>

<asp:UpdatePanel ID="UpdatePanel1" runat="server" ChildrenAsTriggers="true">
	<ContentTemplate>
	
		<asiweb:PanelTemplateControl id="panProperties" runat="server" TemplateTitle="" FieldSet="true"  Collapsible="false" ShowHeader="false" BorderWidth="0px" >
			<%--Page Title --%> 
			<asiweb:smartcontrol ID="sc_Title" runat="server" BoundPropertyName="PageTitle" DisplayCaption="true" />
			<div class="AutoWidth">
            <%--Do not render--%>
			<asiweb:SmartControl ID="DoNotRenderInDesignModeControl" runat="server" BoundPropertyName="DoNotRenderInDesignMode" DisplayCaption="true" PositionCaption="Right"/>
			<%--Show Border--%>
			<asiweb:SmartControl ID="ShowBorderControl" runat="server" BoundPropertyName="ShowBorder" DisplayCaption="true" PositionCaption="Right"/>            
			</div>
			<%--Search Area Parameters--%>
			<asiweb:PanelTemplateControl ID="panSearchArea" runat="server" Collapsed="false">
				<asiweb:smartcontrol ID="stSearchLabel" runat="server" BoundPropertyName="SearchLabel" DisplayCaption="true"  /> 				         
				<div class="AutoWidth">
                <asiweb:smartcontrol ID="ShowList" runat="server" BoundPropertyName="DisplayAreaOptions" DisplayCaption="true" PositionCaption="Right" AutoPostBack="true" OnDataChange="ShowList_Changed" />
				</div><div class="SubItems"> 
                <asiweb:smartcontrol ID="chkSearchAreas" runat="server" BoundPropertyName="Options" DisplayCaption="true" PositionCaption="Top" />
				</div><div class="AutoWidth"> 
				<asiweb:smartcontrol ID="ShowBox" runat="server" BoundPropertyName="DisplayTextBox" DisplayCaption="true" PositionCaption="Right"/>
                </div>                
			</asiweb:PanelTemplateControl>

			<%--Search Criteria Parameters--%> 
			<asiweb:PanelTemplateControl ID="panSearchTerms" runat="server" Collapsed="false">
                <div class="AutoWidth">
				<asiweb:smartcontrol ID="AutoRun" runat="server" BoundPropertyName="InitialDisplay" DisplayCaption="true" PositionCaption="Right"/>
				</div>
                <asiweb:smartcontrol ID="lstSearchArea" runat="server" BoundPropertyName="InitialArea" DisplayCaption="true" AutoPostBack="true"  OnDataChange="InitialArea_Changed" />                
				<asiweb:smartcontrol ID="SearchValue" runat="server" BoundPropertyName="InitialText" DisplayCaption="true" />
				<asiweb:smartcontrol ID="SearchOperator" runat="server" BoundPropertyName="InitialLogic" DisplayCaption="true" PositionCaption="Top"/>
			</asiweb:PanelTemplateControl>
			
			<%--'Add' Link Pramaters--%>
			<asiweb:PanelTemplateControl ID="panAddLink" runat="server" Collapsed="false">
				<asp:panel ID="panAddLink_edit"  runat="server" CssClass="PanelField">              
					<asp:label id="DocumentNameCaption" runat="server" Text="" AssociatedControlID="BrowseButton" />					
                    <div class="PanelFieldValue FloatNone">
						<asp:label id="DocumentNameLabel" runat="server" />                        
						<asiweb:StyledButton id="BrowseButton" runat="server" AutoPostBack="false" onclientclick="SelectDocumentObject()" />
						<asiweb:StyledButton id="ResetButton" runat="server" AutoPostBack="false" onclientclick="ResetDocumentObject()" />
						<input id="HiddenDocumentKey" type="hidden" runat="server" enableviewstate="true" />
				   </div>
				</asp:panel>        
			</asiweb:PanelTemplateControl>

			
			<%--Search Results Parameters--%>
			<asiweb:PanelTemplateControl ID="panSearchResults" runat="server" Collapsed="false">
				<asiweb:smartcontrol ID="NoRecordsMSG" runat="server" BoundPropertyName="NoResultMsg" DisplayCaption="true" />
				<asiweb:smartcontrol ID="SearchError" runat="server" BoundPropertyName="ErrorMsg" DisplayCaption="true" />
				<asiweb:smartcontrol ID="PageSize" runat="server" BoundPropertyName="PageSize" DisplayCaption="true" />                
				<asiweb:smartcontrol ID="MaxRecords" runat="server" BoundPropertyName="MaxResults" DisplayCaption="true" />
				<asiweb:smartcontrol ID="MaxRecordsMSG" runat="server" BoundPropertyName="ExceedResultsMsg" DisplayCaption="true" />
				<asiweb:smartcontrol ID="sort" runat="server" BoundPropertyName="Sort" DisplayCaption="true" />
			<%--Tag Selector--%> <div class="PanelField Left">
					<div class="PanelFieldLabel">
						<label id="lblTag" runat="server"></label>            
					</div>
					<div class="PanelFieldValue">
						<asi:TagSelector ID="ctrlTagSelector" runat="server" />
					</div>
				</div>

			</asiweb:PanelTemplateControl>
			<asp:Label ID="debug" runat="server"></asp:Label>
			</asiweb:PanelTemplateControl>
			
	</ContentTemplate>
</asp:UpdatePanel>