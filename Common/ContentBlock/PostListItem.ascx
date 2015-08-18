<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="PostListItem.ascx.cs" Inherits="Asi.Web.iParts.Common.ContentBlock.PostListItem" %>
<%@ Register TagName="EditLink" TagPrefix="PostManagement" Src="EditLink.ascx" %>
<%@ Register TagName="ReplyLink" TagPrefix="PostManagement" Src="ReplyLink.ascx" %>
<%@ Register TagName="AttachmentManager" TagPrefix="PostManagement" Src="AttachmentManager.ascx" %>
<%@ Register TagName="AttachmentList" TagPrefix="PostManagement" Src="AttachmentList.ascx" %>

<script type="text/javascript">
    //<![CDATA[
    function EditPost_Callback_<%= ClientID %>(dialogWindow) {

       // Trigger a postback when a child post is added.
        if (dialogWindow.IsDirty)
            InitiateControlEventWithArgument('<%= AddChildPostTrigger.ClientID %>', "");
    }
    //]]>
</script>
<div style="float:left;">	
	<asiweb:BusinessHyperLink runat="server" ID="NameLinkControl" BoundPropertyName="AtomKey" BoundDisplayPropertyName="Title" OnNeedBoundAtom="NameLink_NeedBoundAtom" NavigateType="SameWindow" />
</div>		
<div style="float:right;">	
	<asp:Label runat="server" ID="NewItemLabel" Visible="false" Text="new" CssClass="Important" />
</div>

<asiweb:PanelTemplateControl ID="PostInfoPanel" runat="server" FieldSet="true" Collapsed="false" Collapsible="false" ShowHeader="false" ShowButtons="false" BorderStyle="None" Font-Size="Smaller">  
	<asiweb:PanelTemplateColumn ID="column1" runat="server" Wrap="false">
        <asiweb:StyledLabel runat="server" ID="Posted" />
        <asiweb:BusinessLabel runat="server" DisplayValue="true" BoundPropertyName="CreatedOn" ID="PostedDateControl" />
        <asiweb:StyledLabel runat="server" ID="PostedBy" ></asiweb:StyledLabel>
        <asiweb:StyledLabel runat="server" ID="CreatedByUser"></asiweb:StyledLabel>
    </asiweb:PanelTemplateColumn>   
</asiweb:PanelTemplateControl>  

<asiweb:PanelTemplateControl ID="BodyControlPanel" runat="server" FieldSet="true" Collapsed="false" Collapsible="false" ShowHeader="false" ShowButtons="false" BorderStyle="None">        
    <asiweb:BusinessLabel runat="server" DisplayValue="true" BoundPropertyName="Body" ID="BodyControl" OnNeedBoundAtom="BodyControl_NeedBoundAtom" HtmlEncode="false" />
</asiweb:PanelTemplateControl> 

<PostManagement:AttachmentList runat="server" ID="AttachmentList1" UseParentAtomObject="true" />

<asiweb:PanelTemplateControl ID="ReplyInfoPanel" runat="server" FieldSet="true" Collapsed="false" Collapsible="false" ShowHeader="false" ShowButtons="false" BorderStyle="None" Font-Size="Smaller">  
    <asp:Literal ID="LastCommentControl" runat="server" />
</asiweb:PanelTemplateControl>      

<div style="text-align:right;padding:3px;">
    <asp:Label ID="ReplyCountLabel" runat="server" Enabled="false" />
    <asp:LinkButton ID="AddChildLink" runat="server" />
    <PostManagement:ReplyLink runat="server" ID="ReplyLink1" ReplyOptionsSessionKey='<%# ReplyOptionsSessionKey %>' />
    <PostManagement:EditLink runat="server" ID="EditLink1" />
    <asp:LinkButton ID="DeleteItem" runat="server" CssClass="NotPrinted" CausesValidation="false" OnClick="DeleteItem_Click" />
</div>

<asp:Button runat="server" id="AddChildPostTrigger" style="display:none" />
