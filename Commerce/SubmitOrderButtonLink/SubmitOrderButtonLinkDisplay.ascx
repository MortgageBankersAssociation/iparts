<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="SubmitOrderButtonLinkDisplay.ascx.cs"
    Inherits="Asi.Web.iParts.Commerce.SubmitOrderButtonLink.SubmitOrderButtonLinkDisplay" %>
<%@ Register TagPrefix="telerik" Namespace="Telerik.Web.UI" Assembly="Telerik.Web.UI" %>
<%@ Register TagPrefix="asiweb" Assembly="Asi.Web" Namespace="Asi.Web.UI.WebControls" %>
<asp:Panel ID="ContentPanel" runat="server" Visible="true">

    <script type="text/javascript">
    //<![CDATA[
    // Call to submit the order
    // Client side validators for other iParts that affect cart submission are fired first
    function <%= this.ClientID %>_SubmitOrder() {
        
        // Run all the relevant client side validators which affect whether we can submit the order.
        // It doesn't matter if the named validation groups aren't on the page, in that instance true is returned.
        var f = true;
        // Check the Page_ClientValidate function is available.
        // If it isn't it means there are no validators on the page.
        if (typeof Page_ClientValidate == "function" )
        {
            f = f && Page_ClientValidate("Asi.Web.iParts.PaymentCreator.PaymentCreatorDisplay");

            // Reset the variable that stops the next postback being processed.
            // If the validators fail, Page_BlockSubmit is set to true to cancel the action that caused the validators to fire.
            // We are firing the validators programatically, and handling the result
            // with code so we DON'T want the next event to be ignored.
            // If we left Page_BlockSubmit==true, the next button, dropdown etc we clicked on wouldn't do anything.
            Page_BlockSubmit = false;
        }
        
        // if all the validations passed, click the hidden submit button
        if (f)
        {
            var b = $get("<%=SubmitButton.ClientID%>");
            if (b) b.click();
        }
        
    }
    //]]>
    </script>

    <asiweb:TitleBar ID="TitleBar" Text="<%#PageTitle%>" OptionsMenuBehavior="AlwaysDisplay"
        runat="server" />
    <div class="PanelField FloatRight">
        <div class="FloatRight">
            <asp:Literal runat="server" ID="ButtonLiteral" />
        </div>
        <div style="clear: both;"></div>
        <div runat="server" id="LogOnMessageDiv" visible="false" class="Right">
            <asp:Label runat="server" ID="LogOnMessageLabel" Text="You must " />
            <asp:HyperLink runat="server" ID="LogOnLink" Text="sign in" />
            <asp:Label runat="server" ID="LogOnMessageLabel2" Text=" or " />
            <asp:HyperLink runat="server" ID="CreateAccountLink" Text="create an account" NavigateUrl="javascript:void(0);" />
            <asp:Label runat="server" ID="LogOnMessageLabel3" Text=" to submit your order." />
        </div>
    </div>
    <div class="DisplayNone">
        <%-- Hidden button that gets called from javascript --%>
        <asiweb:StyledButton runat="server" ID="SubmitButton" OnClick="SubmitButton_Click" />
    </div>
    <div style="clear: both;"></div>
</asp:Panel>
