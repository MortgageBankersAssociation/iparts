<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="PaymentCreatorDisplay.ascx.cs"
	Inherits="Asi.Web.iParts.Commerce.PaymentCreator.PaymentCreatorDisplay" %>
<%@ Import Namespace="Asi" %>
<%@ Register TagPrefix="telerik" Namespace="Telerik.Web.UI" Assembly="Telerik.Web.UI" %>
<%@ Register TagPrefix="asiweb" Assembly="Asi.Web" Namespace="Asi.Web.UI.WebControls" %>
<%@ Register TagPrefix="uc1" TagName="AddressSelector" Src="~/iParts/Commerce/AddressSelector/AddressSelectorDisplay.ascx" %>    
<asp:Panel ID="ContentPanel" runat="server" Visible="true">

  <style type="text/css">
			/* This style removes the floating attributes that would be applied to the AddressSelector iPart display control which we use within this iPart*/
			#<%=AddressSelectorDiv.ClientID%> * {clear: both;}</style>

	<script type="text/javascript">
		//<![CDATA[
		// Validate the expiry date
		function <%=this.ClientID%>_ValidateExpiryDate(source, args) {

			var currentMonth = parseInt("<%= DateTime.Today.Month.ToString() %>", 10);
			var currentYear = parseInt('<%= DateTime.Today.Year.ToString() %>', 10);

			var selectedMonth = parseInt(document.getElementById("<%= CCExpiryMonthDropDown.ClientID %>").value, 10);
			var selectedYear = parseInt(document.getElementById("<%= CCExpiryYearDropDown.ClientID %>").value, 10);

			// check we have what we need
			if (isNaN(selectedMonth) || isNaN(selectedYear) || selectedMonth == 0 || selectedYear == 0) {
				source.innerHTML = "<%= Required %>";//Grabs message from C# code
				args.IsValid = false;
				return;
			}

			// check the date is valid
			if (selectedYear == currentYear && currentMonth > selectedMonth) {
				source.innerHTML = "<%= InvalidDate %>";//Grabs message from C# code
				args.IsValid = false;
				return;
			}

			args.IsValid = true;
		}

		// Validate the issue date
		function <%=this.ClientID%>_ValidateIssueDate(source, args) {

			var currentMonth = parseInt("<%= DateTime.Today.Month.ToString() %>", 10);
			var currentYear = parseInt('<%= DateTime.Today.Year.ToString() %>', 10);

			var selectedMonth = parseInt(document.getElementById("<%= CCIssueMonthDropDown.ClientID %>").value, 10);
			var selectedYear = parseInt(document.getElementById("<%= CCIssueYearDropDown.ClientID %>").value, 10);
			// check we have what we need
			if (isNaN(selectedMonth) || isNaN(selectedYear) || selectedMonth == 0 || selectedYear == 0) {
				source.innerHTML = "<%= Required %>";//Grabs message from C# code
				args.IsValid = false;
				return;
			}

			// check the date is valid
			if (selectedYear == currentYear && currentMonth < selectedMonth) {
				source.innerHTML = "<%= InvalidDate %>";//Grabs message from C# code
				args.IsValid = false;
				return;
			}

			args.IsValid = true;
		}

		// Validate the cc number
		function <%=this.ClientID%>_ValidateCardNumber(source, args)
		{
			args.IsValid = true;
			source.innerHTML = "";
			var invalidMsg = "<%= InvalidCardNumber %>";//Grabs message: "Invalid card number" from C# code
			var cc = $get("<%= txtCCNumber.ClientID %>");
			if (!cc) return;
			var ccNum = cc.value + "";            

			// don't validate if its empty, we have already done that with a required field validator
			if (ccNum.replace(" ","").length==0) return;
			
			// does it contain anything that isn't a digit or a space
			if (ccNum.search(/[^0-9\s]/)>=0)
			{
				args.IsValid = false;
				source.innerHTML = invalidMsg;
				return;
			}
			
			// Luhn check
			var numLuhn = ccNum.replace(/\D+/g, '');
			var numLuhnArray = numLuhn.split('').reverse();
			var total = 0, i;
			for (i = 0; i < numLuhnArray.length; i++) {
				numLuhnArray[i] = parseInt(numLuhnArray[i])
				total += i % 2 ? 2 * numLuhnArray[i] - (numLuhnArray[i] > 4 ? 9 : 0) : numLuhnArray[i];
			}
			if ((total % 10) != 0)
			{
				args.IsValid = false;
				source.innerHTML = invalidMsg;	            
				return;
			}
			
			// all good
			cc.value = numLuhn;
			return;
		}

		// Fire all validators in the named ValidationGroup
		// We use this to fire validators in the PaymentCreatorDisplay when the commit button is clicked
		// There is a custom validator on the page, that has no validation group. It calls this function.
		function <%=this.ClientID%>_RunAllValidators(source, args)
		{
			//if (typeof Page_ClientValidate == "function" )
		   // {
		   //     Page_ClientValidate("<%# ValidationGroupName %>");
		   // }
		}

        function PayPalClick(source, args)
        {
            //Fire all validators except our special validation group (credit card fields)
            var isValid = true;                
            for (i = 0; i < Page_Validators.length; i++) 
            {            
                var val = Page_Validators[i];
                if(val.validationGroup != '<%# ValidationGroupName  %>')
                {
                    ValidatorValidate(val, val.validationGroup); //this fires the validator
                    if(!val.isvalid)
                        isValid = false;
                }
            }

            if(isValid)
            {
                // Set hidden control that indicates whether we've clicked the PayPal button
                document.getElementById("IsPayPalButtonPressed").value = "true";
            }

            return isValid;
        }
		//]]>
	</script>

    <input type="hidden" id="IsPayPalButtonPressed" name="IsPayPalButtonPressed"/>
    <asp:Panel ID="PanelPayPal" runat="server" >
        <div class="ShowFieldset">
		    <fieldset>
                <legend><%=ResourceManager.GetPhrase("PayWithPayPal", "Pay with PayPal") %></legend>
                <div class="PanelBlock FullWidth MiddleAlign">
                    <div class="PanelField">
                        <div class="PanelFieldLabel">
                            <img id="PayPalImage" runat="server" src="https://www.paypalobjects.com/en_US/i/logo/PayPal_mark_60x38.gif" 
                                alt='<%#ResourceManager.GetPhrase("PayPalMark", "PayPal Mark") %>' />  
                        </div>
                        <div class="PanelFieldLabel">                         
                            <asiweb:StyledLabel runat="server" ID="PayPalLabel" AssociatedControlID="PayPalButton" />
					    </div>
                        <div class="PanelFieldValue">
                            <asp:Button ID="PayPalButton" runat="server" OnClick="PayPalButton_Click" OnClientClick="return PayPalClick();" CssClass="TextButton"
                                Text='<%#ResourceManager.GetPhrase("PayWithPayPal", "Pay with PayPal") %>' CausesValidation="false" />
                        </div>                        
                    </div>
                </div>
            </fieldset>
        </div>   
    </asp:Panel>

		
	<asp:UpdatePanel ID="UpdatePanelValidation" runat="server">
	    <ContentTemplate >
        <div runat="server" id="OtherPaymentOptionsDiv">
            <fieldset id="OtherPaymentOptionsFieldset">
                <legend><%=LegendTitle%></legend>
		        <asp:Panel runat="server" ID="DataPanel"  CssClass="StandardPanel" BorderStyle="None">
			        <asp:Panel runat="server" ID="PaymentPanel" BorderStyle="None">
                       <fieldset id="PaymentRadiosFieldset"> 
                       <div class="PanelField ">
                           <div class="PanelFieldValue AutoWidth FloatNone">
                               <asp:RadioButtonList runat="server" ID="PaymentMethodRadioButtonList" RepeatDirection="Horizontal" RepeatLayout="Flow" AutoPostBack="true" />
                            </div>
                        </div>
                        </fieldset>
				        <div style="clear: both;">
				        </div>
				        <asp:Panel runat="server" ID="PurchaseOrderPanel" CssClass="" BorderStyle="None">
						        <div class="PanelFieldLabel">
							        <asiweb:StyledLabel runat="server" ID="PoNumberLabel" Text="PO number"
                                        CssClass='<%# PurchaseOrderNumberRequired ? "Required" : string.Empty %>' 
								        AssociatedControlID="txtPoNumber" />
						        </div>
						        <div class="PanelFieldValue">
							        <asiweb:BusinessTextBox runat="server" ID="txtPoNumber"></asiweb:BusinessTextBox>
							        <asiweb:AsiRequiredFieldValidator runat="server" ID="PoNumberRequired" ControlToValidate="txtPoNumber"
								        CssClass="Important" ValidationGroup="<%# ValidationGroupName %>" Enabled='<%# PurchaseOrderNumberRequired %>' />
						        </div>
					        <div style="clear: both;">
					        </div>
				        </asp:Panel>
				        <asp:Panel runat="server" ID="CreditCardPanel" CssClass="" BorderStyle="None">
                            <asiweb:BusinessDropDownList runat="server" ID="PaymentMethodDropDown" DisplayCaption="true"
					            RenderPanelField="true" Caption="Payment Method" OnSelectedIndexChanged="PaymentMethodDropDown_SelectedIndexChanged"
					            AutoPostBack="true"/>
					        <div class="PanelField Left">
						        <div class="PanelFieldLabel">
							        <asiweb:StyledLabel runat="server" ID="CCNumberLabel" CssClass="Required" Text="Card Number"
								        AssociatedControlID="txtCCNumber"></asiweb:StyledLabel>
						        </div>
						        <div class="PanelFieldValue">
							        <asiweb:BusinessTextBox runat="server" ID="txtCCNumber"></asiweb:BusinessTextBox>
							        <asiweb:AsiRequiredFieldValidator runat="server" ID="CCNumberRequired" ControlToValidate="txtCCNumber"
								        CssClass="Important" ValidationGroup="<%# ValidationGroupName %>"></asiweb:AsiRequiredFieldValidator>
							        <div style="clear: both;">
								        <asp:CustomValidator runat="server" ID="cvCCNumber" ControlToValidate="txtCCNumber"
									        ClientValidationFunction="" CssClass="Important" Display="Dynamic" ValidationGroup="<%# ValidationGroupName %>"/>
							        </div>
						        </div>
					        </div>
					        <div class="PanelField Left">
						        <div class="PanelFieldLabel">
							        <asiweb:StyledLabel runat="server" ID="CCNameLabel" CssClass="Required" Text="Name on Card"
								        AssociatedControlID="txtCCName"></asiweb:StyledLabel>
						        </div>
						        <div class="PanelFieldValue">
							        <asiweb:BusinessTextBox runat="server" ID="txtCCName"></asiweb:BusinessTextBox>
							        <asiweb:AsiRequiredFieldValidator runat="server" ID="CCNameRequired" ControlToValidate="txtCCName"
								        CssClass="Important" ValidationGroup="<%# ValidationGroupName %>"></asiweb:AsiRequiredFieldValidator>
						        </div>
					        </div>
					        <div class="PanelField Left">
						        <div class="PanelFieldLabel">
							        <asiweb:StyledLabel runat="server" ID="CCExpiryDateLabel" CssClass="Required" Text="Expiration Date"
								        AssociatedControlID="CCExpiryMonthDropDown"></asiweb:StyledLabel>
						        </div>
						        <div>
                                    <div class="PanelFieldValue">
							        <asiweb:BusinessDropDownList runat="server" ID="CCExpiryMonthDropDown">
							        </asiweb:BusinessDropDownList></div>
							        &nbsp;
							        <div class="PanelFieldValue">
							        <asiweb:BusinessDropDownList runat="server" ID="CCExpiryYearDropDown">
							        </asiweb:BusinessDropDownList></div>
							        <asp:CustomValidator runat="server" ID="cvExpirationDate" ControlToValidate="" ValidateEmptyText="true"
								        ClientValidationFunction="" CssClass="Important" Display="Dynamic" ValidationGroup="<%# ValidationGroupName %>" />
							
						        </div>
					        </div>
					        <div class="PanelField Left" runat="server" ID="divCSC">
						        <div class="PanelFieldLabel">
							        <asiweb:StyledLabel runat="server" ID="CCCSCLabel" CssClass="Required" Text="CSC" AssociatedControlID="txtCCCSC"></asiweb:StyledLabel>
						        </div>
						        <div class="PanelFieldValue">
							        <asiweb:BusinessTextBox runat="server" ID="txtCCCSC" MaxLength="4" Columns="4"></asiweb:BusinessTextBox>
							        <asiweb:AsiRequiredFieldValidator runat="server" ID="CCCSCRequired" ControlToValidate="txtCCCSC"
								        CssClass="Important" ValidationGroup="<%# ValidationGroupName %>"></asiweb:AsiRequiredFieldValidator>
							        <div style="clear: both;">
								        <asp:RegularExpressionValidator ID="revCCCSC" runat="server" CssClass="Important"
									        ControlToValidate="txtCCCSC" ErrorMessage="Invalid format" ValidationExpression="\d{3,4}"
									        ValidationGroup="<%# ValidationGroupName %>" Display="Dynamic"/>
							        </div>
						        </div>
					        </div>
					        <div class="PanelField Left" runat="server" ID="divIssueNumber">
						        <div class="PanelFieldLabel">
							        <asiweb:StyledLabel runat="server" ID="CCIssueNumberLabel" CssClass="Required" Text="Issue Number" AssociatedControlID="txtCCIssueNumber"></asiweb:StyledLabel>
						        </div>
						        <div class="PanelFieldValue">
							        <asiweb:BusinessTextBox runat="server" ID="txtCCIssueNumber" MaxLength="2" Columns="2"></asiweb:BusinessTextBox>
							        <asiweb:AsiRequiredFieldValidator runat="server" ID="CCIssueNumberRequired" ControlToValidate="txtCCIssueNumber"
								        CssClass="Important" ValidationGroup="<%# ValidationGroupName %>"></asiweb:AsiRequiredFieldValidator>
							        <div style="clear: both;">
								        <asp:RegularExpressionValidator ID="revCCIssueNumber" runat="server" CssClass="Important"
									        ControlToValidate="txtCCIssueNumber" ErrorMessage="Invalid format" ValidationExpression="\d{1,2}"
									        ValidationGroup="<%# ValidationGroupName %>" Display="Dynamic"/>
							        </div>
						        </div>
					        </div>
					        <div class="PanelField Left" runat="server" ID="divIssueDate">
						        <div class="PanelFieldLabel">
							        <asiweb:StyledLabel runat="server" ID="CCIssueDateLabel" CssClass="Required" Text="Issue Date"
								        AssociatedControlID="CCIssueMonthDropDown"></asiweb:StyledLabel>
						        </div>
						        <div>
                                    <div class="PanelFieldValue">
							        <asiweb:BusinessDropDownList runat="server" ID="CCIssueMonthDropDown">
							        </asiweb:BusinessDropDownList></div>
							        &nbsp;
							        <div class="PanelFieldValue">
							        <asiweb:BusinessDropDownList runat="server" ID="CCIssueYearDropDown">
							        </asiweb:BusinessDropDownList> </div>
							        <asp:CustomValidator runat="server" ID="cvIssueDate" ControlToValidate="" ValidateEmptyText="true" EnableClientScript="true"
								        ClientValidationFunction="" CssClass="Important" Display="Dynamic" ValidationGroup="<%# ValidationGroupName %>" />                            
						        </div>
					        </div>
				
					        <asp:Panel ID="CardAddressPanel" runat="server" CssClass="PanelField Left" >
						        <div>
							        <label>Card Address</label></div>
						        <div runat="server" id="AddressSelectorDiv" class="PanelFieldValue">
							        <uc1:AddressSelector runat="Server" id="AddressSelector" AddressPath="" OverrideFloating="true"
								        PageTitle="" ShowBorder="false">
							        </uc1:AddressSelector>
						        </div>
					        </asp:Panel>
				        </asp:Panel>
				        <div class="DisplayNone">
					        <!-- Hidden validator, used to run all the other validators in the named ValidationGroup when someone clicks next or commit in the command buttons -->
					        <!-- Normally in this instance the validators wouldn't run because they have a ValidationGroup assigned -->
					        <!-- We use this CustomValidator, which does not have a validation group, to force the other validators to run -->
					        <asp:CustomValidator runat="server" ID="cvRunAllValidators" Enabled="true" ></asp:CustomValidator>
				        </div>
			        </asp:Panel>
			        <br />
			        <div runat="server" id="DivUpdate" class="FloatRight">
				        <asiweb:StyledButton ID="SaveButton" runat="server" Text="Update" OnClick="Save_Click" ValidationGroup="<%# ValidationGroupName %>" />
			        </div>
		        </asp:Panel>
            </fieldset>
        </div>
		</ContentTemplate>
	</asp:UpdatePanel>	
    <div style="clear: both;"></div>
</asp:Panel>
