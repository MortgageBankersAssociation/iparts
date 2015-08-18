<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="EmbeddedWebPageDisplay.ascx.cs" Inherits="Asi.Web.iParts.Common.EmbeddedWebPage.EmbeddedWebPageDisplay" %>

<asp:Panel runat="server" ID="ContentPanel" BorderStyle="None">
    <iframe runat="server" id="MapContainer" frameborder="0" marginheight="0" marginwidth="0">
        <%--iFrame source/content added dynamically--%>
        No content. Your browser does not support Frames.
    </iframe>
</asp:Panel>

