<%@ Control Language="C#" ClassName="Asi.Web.iParts.ContactManagement.ContactMiniProfile.ContactNameEdit" Inherits="Asi.Web.UI.WebControls.iPartEditBase" %>

<script runat="server">
    
    public override string AtomComponentName
    {
        get
        {
            return "Contact Name";
        }
    }

</script>

<asiweb:PanelTemplateControl ID="ContactNameFields" runat="server" FieldSet="true" ShowHeader="false" BorderStyle="None">
    <div class="AutoWidth">
        <asiweb:SmartControl ID="DisplayForAuthorizedUsersOnly" runat="server" BoundPropertyName="DisplayForAuthorizedUsersOnly" DisplayCaption="true" PositionCaption="Right" DataSaveUponStateChange="false" />
        <asiweb:SmartControl ID="EditContactName" runat="server" BoundPropertyName="EditContactName" DisplayCaption="true" PositionCaption="Right" DataSaveUponStateChange="false" />
        <asiweb:SmartControl ID="DisplayContactName" runat="server" BoundPropertyName="DisplayContactName" DisplayCaption="true" PositionCaption="Right" DataSaveUponStateChange="false" />
        <asiweb:SmartControl ID="DisplayContactTitle" runat="server" BoundPropertyName="DisplayContactTitle" DisplayCaption="true" PositionCaption="Right" DataSaveUponStateChange="false" />
        <asiweb:SmartControl ID="DisplayInstitute" runat="server" BoundPropertyName="DisplayInstitute" DisplayCaption="true" PositionCaption="Right" DataSaveUponStateChange="false" />
    </div>
</asiweb:PanelTemplateControl>
