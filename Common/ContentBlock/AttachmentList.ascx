<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="AttachmentList.ascx.cs" Inherits="Asi.Web.iParts.Common.ContentBlock.AttachmentList" %>
<asp:Repeater ID="ImagesRepeater" runat="server" OnItemDataBound="ImagesRepeater_ItemDataBound">
    <ItemTemplate>
        <div class="CommunityAttachmentImage">
            <%--Hide Image File Name.--%>
            <div style="display:none"><asp:Label ID="ImageLabel" runat="server" Text='<%# Eval("Name") %>' ></asp:Label><br /></div>
            <asp:HyperLink ID="ImageLink" runat="server" NavigateUrl='<%# string.Format("~/iMIS/BSA/DocumentSystemImage.aspx?iUniformKey={0}", Eval("DocumentVersionKey")) %>'><asp:Image ID="Image" runat="server" ImageUrl='<%# string.Format("~/iMIS/BSA/DocumentSystemImage.aspx?iUniformKey={0}", Eval("DocumentVersionKey")) %>' /></asp:HyperLink>
            <asp:Panel ID="EmbedControl" runat="server">
            <object classid='<%# GetClassId((Asi.Business.Common.Document)Container.DataItem) %>' 
              codebase='<%# GetCodebase((Asi.Business.Common.Document)Container.DataItem) %>'>
              <param name='<%# GetSourceParamName((Asi.Business.Common.Document)Container.DataItem) %>' value='<%# string.Format("{0}/iMIS/BSA/DocumentSystemImage.aspx?iUniformKey={1}", Asi.Web.Utilities.GetTildeExpansion(), Eval("DocumentVersionKey")) %>'>
              <param name='autoStart' value="false">
              <param name='showControls' value="true">
              <param name='controller' value="true">
              <param name='controls' value='imagewindow'>
              <param name='loop' value="false">
              <embed type='GetFileType((Asi.Business.Common.Document)Container.DataItem)'
                id='mediaPlayer' name='mediaPlayer'
                src="<%# string.Format("{0}/iMIS/BSA/DocumentSystemImage.aspx?iUniformKey={1}", Asi.Web.Utilities.GetTildeExpansion(), Eval("DocumentVersionKey")) %>"
                pluginspage='<%# GetPluginsPage((Asi.Business.Common.Document)Container.DataItem) %>' 
                autostart="false" loop="false">
                <noembed>
                    Your browser requires a plugin to view this content (content-type: <%# GetFileType((Asi.Business.Common.Document)Container.DataItem) %>), but you do not have the plugin installed.
                </noembed>
              </embed>
              </object>
            </asp:Panel>
        </div>
    </ItemTemplate>
</asp:Repeater>
<asp:Repeater ID="AttachmentsRepeater" runat="server">
    <HeaderTemplate>
        <h3>Attachments:</h3>
    </HeaderTemplate>
    <ItemTemplate>
        <div class="CommunityAttachmentFile">
            <asp:HyperLink ID="AttachmentLink" runat="server" NavigateUrl='<%# string.Format("~/AsiCommon/Controls/BSA/downloader.aspx?iUniformKey={0}&iFileTypeCode={1}", Eval("DocumentVersionKey"), Eval("DocumentTypeCode")) %>' Text='<%# Eval("Name") %>'></asp:HyperLink> <asp:Label ID="DescriptionLabel" runat="server" Text='<%# Eval("Description") %>'></asp:Label>
        </div>
    </ItemTemplate>
</asp:Repeater>