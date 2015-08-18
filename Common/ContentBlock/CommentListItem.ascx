<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="CommentListItem.ascx.cs" Inherits="Asi.Web.iParts.Common.ContentBlock.CommentListItem" %>
<%@ Import Namespace="Asi" %>
<%@ Register TagName="EditLink" TagPrefix="PostManagement" Src="EditLink.ascx" %>
<%@ Register TagName="AttachmentList" TagPrefix="PostManagement" Src="AttachmentList.ascx" %>
<%@ Register TagName="AttachmentManager" TagPrefix="PostManagement" Src="AttachmentManager.ascx" %>

<asp:literal id="Anchor" Runat="server"/> 
 
<div style="float:left; width:100%">				
	<asiweb:SmartControl runat="server" BoundPropertyName="Title" ID="NameLinkControl" DisplayType="ReadOnlyField" DisplayCaption="false" HtmlEncode="true" Font-Bold="true" />
</div>		
<div style="float:right;">	
	<asp:Label runat="server" ID="NewItemLabel" Visible="false" Text="new" CssClass="Important" />
</div>

<asp:Label runat="server" ID="PendingItemLabel" Visible="false" Text="awaiting approval" />

<asiweb:PanelTemplateControl ID="CommentInfoPanel" runat="server" FieldSet="true" Collapsed="false" Collapsible="false" ShowHeader="false" ShowButtons="false" BorderStyle="None" Font-Size="Smaller">  
	<asiweb:PanelTemplateColumn ID="column1" runat="server" Wrap="false">
        <asiweb:StyledLabel runat="server" ID="Posted" />
        <asiweb:BusinessLabel runat="server" DisplayValue="true" BoundPropertyName="CreatedOn" ID="PostedDateControl" />
        <asiweb:StyledLabel runat="server" ID="PostedBy" />
        <asiweb:StyledLabel runat="server" ID="CreatedByUser" /> 
    </asiweb:PanelTemplateColumn>   
</asiweb:PanelTemplateControl>

<asiweb:PanelTemplateControl ID="BodyControlPanel" runat="server" FieldSet="true" Collapsed="false" Collapsible="false" ShowHeader="false" ShowButtons="false" BorderStyle="None">           
    <asiweb:BusinessLabel runat="server" DisplayValue="true" BoundPropertyName="Body" ID="BodyControl" OnNeedBoundAtom="BodyControl_NeedBoundAtom" HtmlEncode="<%# !ReplyOptions.AllowHtml %>" />
</asiweb:PanelTemplateControl>

<PostManagement:AttachmentList runat="server" ID="AttachmentList1" UseParentAtomObject="true" />

<div style="text-align:right;padding:3px;">
    <PostManagement:EditLink runat="server" ID="EditLink1" ReplyOptionsSessionKey='<%# ReplyOptionsSessionKey %>'
        PanelTemplateTitle='<%# ResourceManager.GetPhrase("Edit", "Edit") %>' />
    <asp:LinkButton ID="DeleteItem" runat="server" CssClass="NotPrinted" CausesValidation="false" />
</div>
