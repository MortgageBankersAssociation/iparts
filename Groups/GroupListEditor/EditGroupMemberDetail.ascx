<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="EditGroupMemberDetail.ascx.cs" Inherits="Asi.Web.iParts.Groups.GroupListEditor.EditGroupMemberDetail" %>

<div runat="server" visible="false" id="DivLabelErrorMessage">
    <asp:Label id="LabelErrorMessage" runat="server" cssclass="Error" />
</div>
<asiweb:PanelTemplateControl ID="GroupMemberEdit" runat="server" FieldSet="true" ShowHeader="false" BorderStyle="None">
    
    <div class="PanelField" ID="DivRole" runat="server">
        <asiweb:StyledLabel runat="server" ID="LabelRole" CssClass="Required" Text='<%#Asi.ResourceManager.GetWord("Role") %>' 
            AssociatedControlID="Role" />
        <div class="PanelFieldValue">
            <asiweb:BusinessDropDownList ID="Role" runat="server" Required="true" AutoPostBack="true" 
                OnSelectedIndexChanged="Role_SelectedIndexChanged" />
            <asiweb:AsiRequiredFieldValidator Text="Required" ID="RoleRequiredFieldValidator" ControlToValidate="Role" runat="server" Enabled="true"  />
        </div>
    </div>

    <asiweb:BusinessTextBox ID="ContactTitle" runat="server" Caption='<%#Asi.ResourceManager.GetWord("Title") %>' DisplayCaption="true" RenderPanelField="true" />    
    <asiweb:BusinessCalendar2 ID="EffectiveDate" runat="server" Caption='<%#Asi.ResourceManager.GetWord("Begin") %>' DisplayCaption="true" RenderPanelField="true" />
    <asiweb:BusinessCalendar2 ID="ExpirationDate" runat="server" Caption='<%#Asi.ResourceManager.GetWord("End") %>' DisplayCaption="true" RenderPanelField="true" />
</asiweb:PanelTemplateControl>

<div id="buttonDiv" runat="server">
    <asp:Button ID="SaveButton" Text='<%#Asi.ResourceManager.GetPhrase("SaveAndClose","Save & Close") %>' runat="server" CommandName="Save" OnClick="SaveButton_Click" />
    <asp:Button ID="CancelButton" Text='<%#Asi.ResourceManager.GetWord("Cancel") %>' runat="server" CommandName="Cancel" CausesValidation="false" OnClientClick="btnCancel_Click();return false;" />
</div>