<%@ Control Language="vb" AutoEventWireup="false" CodeBehind="RosterEditor.ascx.vb" Inherits="MBA_vbParts.RosterEditor" %>

<script language="javascript">

var zChar = new Array(' ', '(', ')', '-', '.');
var maxphonelength = 14;
var phonevalue1;
var phonevalue2;
var cursorposition;

function ParseForNumber1(object){
  phonevalue1 = ParseChar(object.value, zChar);
}

function ParseForNumber2(object){
  phonevalue2 = ParseChar(object.value, zChar);
}

function backspacerUP(object,e) { 
  if(e){ 
    e = e 
  } else {
    e = window.event 
  } 
  if(e.which){ 
    var keycode = e.which 
  } else {
    var keycode = e.keyCode 
  }

  ParseForNumber1(object)

  if(keycode >= 48){
    ValidatePhone(object)
  }
}

function backspacerDOWN(object,e) { 
  if(e){ 
    e = e 
  } else {
    e = window.event 
  } 
  if(e.which){ 
    var keycode = e.which 
  } else {
    var keycode = e.keyCode 
  }
  ParseForNumber2(object)
} 

function GetCursorPosition(){

  var t1 = phonevalue1;
  var t2 = phonevalue2;
  var bool = false
  for (i=0; i<t1.length; i++)
  {
    if (t1.substring(i,1) != t2.substring(i,1)) {
      if(!bool) {
        cursorposition=i
        window.status=cursorposition
        bool=true
      }
    }
  }
}

function ValidatePhone(object){

  var p = phonevalue1

  p = p.replace(/[^\d]*/gi,"")

  if (p.length < 3) {
    object.value=p
  } else if(p.length==3){
    pp=p;
    d4=p.indexOf('(')
    d5=p.indexOf(')')
    if(d4==-1){
      pp="("+pp;
    }
    if(d5==-1){
      pp=pp+")";
    }
    object.value = pp;
  } else if(p.length>3 && p.length < 7){
    p ="(" + p; 
    l30=p.length;
    p30=p.substring(0,4);
    p30=p30+") " 

    p31=p.substring(4,l30);
    pp=p30+p31;

    object.value = pp; 

  } else if(p.length >= 7){
    p ="(" + p; 
    l30=p.length;
    p30=p.substring(0,4);
    p30=p30+") " 

    p31=p.substring(4,l30);
    pp=p30+p31;

    l40 = pp.length;
    p40 = pp.substring(0,9);
    p40 = p40 + "-"

    p41 = pp.substring(9,l40);
    ppp = p40 + p41;

    object.value = ppp.substring(0, maxphonelength);
  }

  GetCursorPosition()

  if(cursorposition >= 0){
    if (cursorposition == 0) {
      cursorposition = 2
    } else if (cursorposition <= 2) {
      cursorposition = cursorposition + 1
    } else if (cursorposition <= 4) {
      cursorposition = cursorposition + 3
    } else if (cursorposition == 5) {
      cursorposition = cursorposition + 3
    } else if (cursorposition == 6) { 
      cursorposition = cursorposition + 3 
    } else if (cursorposition == 7) { 
      cursorposition = cursorposition + 4 
    } else if (cursorposition == 8) { 
      cursorposition = cursorposition + 4
      e1=object.value.indexOf(')')
      e2=object.value.indexOf('-')
      if (e1>-1 && e2>-1){
        if (e2-e1 == 4) {
          cursorposition = cursorposition - 1
        }
      }
    } else if (cursorposition == 9) {
      cursorposition = cursorposition + 4
    } else if (cursorposition < 11) {
      cursorposition = cursorposition + 3
    } else if (cursorposition == 11) {
      cursorposition = cursorposition + 1
    } else if (cursorposition == 12) {
      cursorposition = cursorposition + 1
    } else if (cursorposition >= 13) {
      cursorposition = cursorposition
    }

    var txtRange = object.createTextRange();
    txtRange.moveStart( "character", cursorposition);
    txtRange.moveEnd( "character", cursorposition - object.value.length);
    txtRange.select();
  }

}

function ParseChar(sStr, sChar)
{

  if (sChar.length == null) 
  {
    zChar = new Array(sChar);
  }
    else zChar = sChar;

  for (i=0; i<zChar.length; i++)
  {
    sNewStr = "";

    var iStart = 0;
    var iEnd = sStr.indexOf(sChar[i]);

    while (iEnd != -1)
    {
      sNewStr += sStr.substring(iStart, iEnd);
      iStart = iEnd + 1;
      iEnd = sStr.indexOf(sChar[i], iStart);
    }
    sNewStr += sStr.substring(sStr.lastIndexOf(sChar[i]) + 1, sStr.length);

    sStr = sNewStr;
  }

  return sNewStr;
}
</script>





<div class="iMIS-WebPart">
<asp:Panel ID="panelEditor" runat="server" CssClass="StandardPanel" style="width: 400px; margin: auto;">
	<div class="WebPartZone " >
<div  style="min-height: 20px; zoom: 1 !important; padding: 0px; margin: 0px;" class="style1">
    <div class="PanelHead Distinguish">
        <span class="PanelTitle">Add New Individual to Roster</span>
    </div>
	<div  class="PanelBody">
    <table class="Form">
       <tr>
            <td colspan="2" class="PanelTablePrompt">* Indicates required field.</td>
       </tr>
       <tr>
            <td class="PanelTablePrompt">Prefix:</td>
            <td class="PanelTableValue">
                <asp:DropDownList ID="cboPrefix" runat="server" >
                </asp:DropDownList>
            </td>
        </tr>
        <tr>
            <td class="PanelTablePrompt">First Name *:</td>
            <td class="PanelTableValue">
               
                <asp:TextBox ID="txtFirst" runat="server" width="250px"> </asp:TextBox>
                <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" 
                    ErrorMessage="*" ControlToValidate="txtFirst"></asp:RequiredFieldValidator>
            </td>
        </tr>
        <tr>
            <td class="PanelTablePrompt">Middle Name:</td>
            <td class="PanelTableValue"> <asp:TextBox ID="txtMiddle" runat="server" width="250px"> </asp:TextBox></td>
        </tr>
        <tr>
            <td class="PanelTablePrompt">Last Name *:</td>
            <td class="PanelTableValue">
                <asp:TextBox ID="txtLast" runat="server" width="250px"></asp:TextBox>
                <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" 
                    ControlToValidate="txtLast" ErrorMessage="*"></asp:RequiredFieldValidator>
            </td>
        </tr>
         <tr>
            <td class="PanelTablePrompt">Designation:</td>
            <td class="PanelTableValue">
                <asp:TextBox ID="txtDesig" runat="server" width="250px"></asp:TextBox>
             </td>
        </tr>
        <tr>
            <td class="PanelTablePrompt">Title *:</td>
            <td class="PanelTableValue">
                <asp:TextBox ID="txtTitle" runat="server" width="250px"></asp:TextBox>
                <asp:RequiredFieldValidator ID="RequiredFieldValidator3" runat="server" 
                    ControlToValidate="txtTitle" ErrorMessage="*"></asp:RequiredFieldValidator>
            </td>
        </tr>
        <tr>
            <td class="PanelTablePrompt">Email *:</td>
            <td class="PanelTableValue">
                <asp:TextBox ID="txtEmail" runat="server" width="250px"></asp:TextBox>
                <asp:RequiredFieldValidator ID="RequiredFieldValidator12" runat="server" 
                    ControlToValidate="txtEmail" ErrorMessage="*"></asp:RequiredFieldValidator>
            </td>
        </tr>
            <tr>
                 <td class="PanelTablePrompt">Company:</td>
                  <td class="PanelTableValue"><asp:TextBox ID="txtCompany" Enabled="false" runat="server" width="250px"></asp:TextBox></td>
            </tr>
         <tr>
            <td class="PanelTablePrompt">Address *:</td>
            <td class="PanelTableValue">
                
                <asp:TextBox ID="txtAddress1" runat="server" width="250px"></asp:TextBox>
                <asp:RequiredFieldValidator ID="RequiredFieldValidator4" runat="server" 
                    ControlToValidate="txtAddress1" ErrorMessage="*"></asp:RequiredFieldValidator>
             </td>
        </tr>
         <tr>
            <td class="PanelTablePrompt">Address(cont.):</td>
            <td class="PanelTableValue">
                <asp:TextBox ID="txtAddress2" runat="server" width="250px"></asp:TextBox>
             </td>
        </tr>
        <tr>
            <td class="PanelTablePrompt">City *:</td>
            <td class="PanelTableValue">
                <asp:TextBox ID="txtCity" runat="server" width="250px"></asp:TextBox>
                <asp:RequiredFieldValidator ID="RequiredFieldValidator5" runat="server" 
                    ControlToValidate="txtCity" ErrorMessage="*"></asp:RequiredFieldValidator>
            </td>
        </tr>
        <tr>
            <td class="PanelTablePrompt">State<span lang="en-us"> *</span>:</td>
            <td class="PanelTableValue">
                <asp:DropDownList ID="cboState" runat="server">
                </asp:DropDownList>
            </td>
        </tr>
        <tr>
            <td class="PanelTablePrompt">Country:</td>
            <td class="PanelTableValue">
                <asp:DropDownList ID="cboCountry" runat="server">
                </asp:DropDownList>
            </td>
        </tr>
        <tr>
            <td class="PanelTablePrompt">Postal Code *:</td>
            <td class="PanelTableValue">
                <asp:TextBox ID="txtZip" runat="server" width="250px"></asp:TextBox>
                <asp:RequiredFieldValidator ID="RequiredFieldValidator7" runat="server" 
                    ControlToValidate="txtZip" ErrorMessage="*"></asp:RequiredFieldValidator>
            </td>
        </tr>
        <tr>
            <td class="PanelTablePrompt">Work Phone *:</td>
            <td class="PanelTableValue"> <asp:TextBox ID="txtWorkPhone" runat="server" width="250px" onkeydown="javascript:backspacerDOWN(this,event);" onkeyup="javascript:backspacerUP(this,event);" > </asp:TextBox>
                <asp:RequiredFieldValidator ID="RequiredFieldValidator10" runat="server" 
                    ControlToValidate="txtWorkPhone" ErrorMessage="*"></asp:RequiredFieldValidator>
            </td>
        </tr>
        <tr>
            <td class="PanelTablePrompt">Fax:</td>
            <td class="PanelTableValue"> <asp:TextBox ID="txtFax" runat="server" width="250px"> </asp:TextBox>
            </td>
        </tr>
        <tr>
           
            <td colspan="2">
                <asp:Button ID="cmdUpdate" runat="server" Text="Add" Width="77px" />  <asp:Button ID="cmdCancelAdd" runat="server" CausesValidation="False" 
                    Text="Cancel" Width="74px" />
                <asp:HiddenField ID="txtID" runat="server" />
              
            </td>
        </tr>
        
    </table>
    </div>
  </div>
  
   
</div>
</asp:Panel>
<asp:Panel ID="panelAccessError" runat="server">
    <table>
        <tr>
            <td>Your login credentials does not have sufficient permissions to access this area.</td>
        </tr>
    </table>
</asp:Panel>
<asp:Panel ID="panelFinish" runat="server">
<table>
        <tr>
            <td><asp:Label ID="lblResult" runat="server"></asp:Label></td>
        </tr>
        <tr>
            <td>
                <asp:Button ID="cmdCancel" runat="server" Text="Return" />
                <asp:Button ID="cmdAdd" runat="server" Text="Add New" />
            </td>
        </tr>
    </table>
</asp:Panel>
</div>