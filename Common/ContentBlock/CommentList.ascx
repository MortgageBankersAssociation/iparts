<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="CommentList.ascx.cs" Inherits="Asi.Web.iParts.Common.ContentBlock.CommentList" %>
<%@ Register Src="CommentListItem.ascx" TagPrefix="Post" TagName="CommentListItem" %>

<asp:Panel ID="ScriptPanel" runat="server">
    <script type="text/javascript">
        //<![CDATA[
        function EditComment_Callback(dialogWindow)
        {
            // Trigger a postback when a Topic is added.
            if (dialogWindow.IsDirty)
                InitiateControlEventWithArgument('<%= editCommentTrigger.ClientID %>', "");
        }
        //]]>
    </script>
</asp:Panel>
<div style="margin:8px;">
<asiweb:PanelTemplateControl ID="CommentListPanel" runat="server" Collapsed="false" Collapsible="false" ShowHeader="false" Width="100%">
    <asp:Repeater runat="server" ID="CommentListItemRepeater" DataSource="<%#GetCommentList()%>">
        <HeaderTemplate>
            <table id='<%= string.Format("{0}_CommentListTable", CommentListItemRepeater.ClientID) %>' width="100%" style="width:100%">
        </HeaderTemplate>
        <ItemTemplate>
            <tr>
               <td><Post:CommentListItem ID="CommentListItem1" runat="server" UseParentAtomObject="false" ReplyOptionsSessionKey='<%# ReplyOptionsSessionKey %>' /></td>
            </tr>
        </ItemTemplate>
        <FooterTemplate>
            </table>
       </FooterTemplate>
    </asp:Repeater>
    
    <asp:Panel ID="PagingPanel" runat="server" Visible="false"> 
        <table><tr>
            <td><asp:HyperLink ID="Previous" runat="server" CssClass="NotPrinted"></asp:HyperLink></td>
            <td><asp:Panel ID="PagesPanel" runat="server" cssclass="NotPrinted"></asp:Panel></td>
            <td><asp:HyperLink ID="Next" runat="server" CssClass="NotPrinted"></asp:HyperLink></td>
            <td><asp:HyperLink ID="ViewAll" runat="server" CssClass="NotPrinted"></asp:HyperLink></td>
        </tr></table>      
    </asp:Panel>     
    
    <asp:Button runat="server" id="editCommentTrigger" style="display:none" Text=""></asp:Button>
</asiweb:PanelTemplateControl>
</div>