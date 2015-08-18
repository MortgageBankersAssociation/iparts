<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="QueryChartViewerConfigEdit.ascx.cs" 
    Inherits="Asi.Web.iParts.Common.QueryChartViewer.QueryChartViewerConfigEdit" %>
<%@ Register TagPrefix="telerik" Namespace="Telerik.Web.UI" Assembly="Telerik.Web.UI" %>
<%@ Register TagPrefix="asiweb" Assembly="Asi.Web" Namespace="Asi.Web.UI.WebControls" %>
<%@ Register TagPrefix="telerik" Namespace="Telerik.Charting" Assembly="Telerik.Web.UI" %>

<script type="text/javascript">
    //<![CDATA[

    function TypeChanged(cName, Index) {

        // Get value of selected control and index        
        var elm = document.getElementById(cName);
        var base = cName;
        var tmp = Index + "_Type";
        base = base.substring(0, cName.length - tmp.length);
              
        if (elm != null) {
            // Get element value
            if (elm.value == "0" || elm.value == "1") {
                // First get a base for the control name
                // Dipslay text box and hide list
                tmp = base + Index + "_ValueBox";
                if (document.getElementById(tmp) != null)
                    document.getElementById(tmp).style.display = 'block';

                tmp = base + Index + "_ValueList";
                if (document.getElementById(tmp) != null)
                    document.getElementById(tmp).style.display = 'none';
                   
            }
            else {
               
                var tmp0 = base + Index + "_ValueBox";
                if (document.getElementById(tmp0) != null) {
                    document.getElementById(tmp0).style.display = 'none';
                    document.getElementById(tmp0).value = 0;            
                }

                var tmp1 = base + Index + "_ValueList";
                if (document.getElementById(tmp1) != null) {
                    document.getElementById(tmp1).style.display = 'block';
                }
                                
            }
                
        }
        else
            alert('Can not find control');
    }

    function FormatChanged(clstName, ctextName) {
        // Get value of selected control and index        
        var elm = document.getElementById(clstName);
        if (elm != null) {

            if (elm.value == "99") {
                // First get a base for the control name
                // Display text box and hide list
                if (document.getElementById(ctextName) != null)
                    document.getElementById(ctextName).style.display = 'block';
            }
            else {
                if (document.getElementById(ctextName) != null)
                    document.getElementById(ctextName).style.display = 'none';
            }
        }
        else
            alert('Can not find control');
    }
    //]]>
</script>

<asiweb:paneltemplatecontrol id="ContainerPanel" runat="server" fieldset="true" showheader="false"
    borderstyle="None">
    
    <asiweb:SmartControl ID="PageTitle" runat="server" BoundPropertyName="PageTitle" 
        DisplayCaption="true" DataSaveUponStateChange="false" />
      
    <div class="AutoWidth">
        <asiweb:SmartControl 
            ID="DoNotRenderInDesignMode" runat="server" 
            BoundPropertyName="DoNotRenderInDesignMode" DisplayCaption="true" 
            PositionCaption="Right" DataSaveUponStateChange="false" />
            
        <asiweb:SmartControl 
            ID="ShowBorderControl" runat="server" BoundPropertyName="ShowBorder" 
            DisplayCaption="true" PositionCaption="Right" DataSaveUponStateChange="false" />          
    </div>     
       
    <asiweb:SmartControl 
        ID="ChartSourceQuery" runat="server" 
        BoundPropertyName="ChartSourceQuery" DisplayCaption="true" 
        PositionCaption="Left" DataSaveUponStateChange="false" AutoPostBack="true" /> 
        
    <div class="PanelField Left" ID="DivLabelIQAError" runat="server" >
        <div class="PanelFieldLabel">
            <label id="LabelIQAErrorLabel" for="LabelIQAError"></label>
        </div>
        <div class="PanelFieldValue">
            <asp:Label ID="LabelIQAError" runat="server" />
        </div>
    </div>                          
                                        
    <div class="PanelField Left" ID="DivQueryProperty" runat="server" visible="false">
        <div class="PanelFieldLabel">
            <label id="QueryPropertyLabel" for="LabelQueryProperty"></label>
        </div>
        <div class="PanelFieldValue">
            <asp:Label ID="LabelQueryProperty" runat="server"/>
        </div>
    </div>       
                                                 
    <asiweb:SmartControl ID="ChartTitle" runat="server" BoundPropertyName="ChartTitle" 
        DisplayCaption="true" DataSaveUponStateChange="false" />
       
    <asiweb:SmartControl 
        ID="ChartSeriesLabel" runat="server" 
        BoundPropertyName="ChartSeriesLabel" DisplayCaption="true" 
        PositionCaption="Left" DataSaveUponStateChange="false" />
        
    <asiweb:SmartControl ID="ChartType" runat="server" BoundPropertyName="ChartType" 
        DisplayCaption="true" DataSaveUponStateChange="false" AutoPostBack="true" /> 
        
     <asiweb:SmartControl 
        ID="ChartLabelRotationAngle" runat="server" 
        BoundPropertyName="ChartLabelRotationAngle" DisplayCaption="true" 
        PositionCaption="Left" DataSaveUponStateChange="false" />        
                          
    <div class="PanelField Left">
        <div class="PanelFieldLabel">
            <label id="LabelSelectSkinName" for="SelectSkinName" runat="server">Chart skin</label>
        </div>
        <div class="PanelFieldValue">
            <asp:DropDownList ID="SelectSkinName" runat="server"></asp:DropDownList>
        </div>
    </div>
    <div style="clear: both;"/>        
            
    <asiweb:SmartControl 
        ID="ChartWidth" runat="server" 
        BoundPropertyName="ChartWidth" DisplayCaption="true" 
        PositionCaption="Left" DataSaveUponStateChange="false" />   

     <asiweb:SmartControl 
        ID="ChartHeight" runat="server" 
        BoundPropertyName="ChartHeight" DisplayCaption="true" 
        PositionCaption="Left" DataSaveUponStateChange="false" /> 
                     
     <div class="PanelField Left">
        <div class="PanelFieldLabel">
            <label id="LabelSelectDataColumn" for="SelectDataColumn" runat="server">Data column</label>
        </div>
        <div class="PanelFieldValue">
            <asp:DropDownList ID="SelectDataColumn" runat="server"></asp:DropDownList>
        </div>
    </div>
    <div style="clear: both;"/>            
                  
    <div class="PanelField Left">
        <div class="PanelFieldLabel">
            <label id="LabelSelectDataFormat" for="SelectDataFormat" runat="server">Data column format</label>
        </div>
        <div class="PanelFieldValue">
            <asp:DropDownList ID="SelectDataFormat" runat="server" ></asp:DropDownList><asp:TextBox ID="txtDataFormat" runat="server" />
        </div>
    </div>
    <div style="clear: both;"/>            
        
    <div class="PanelField Left">
        <div class="PanelFieldLabel">
            <label id="LabelSelectLabelColumn" for="SelectLabelColumn" runat="server">Label column</label>
        </div>
        <div class="PanelFieldValue">
            <asp:DropDownList ID="SelectLabelColumn" runat="server"></asp:DropDownList>
        </div>
    </div>
    <div style="clear: both;"/>            
 
    <div class="PanelField Left">
        <div class="PanelFieldLabel">
            <label id="LabelSelectLabelsFormat" for="SelectLabelsFormat" runat="server">Label column format</label>
        </div>
        <div class="PanelFieldValue">
            <asp:DropDownList ID="SelectLabelsFormat" runat="server"></asp:DropDownList><asp:TextBox ID="txtLabelsFormat" runat="server" ></asp:TextBox>
        </div>
    </div>
    <div style="clear: both;"/>  
    
    <div class="AutoWidth">    
        <asiweb:SmartControl 
            ID="HideEmptyChart" runat="server" 
            BoundPropertyName="HideEmptyChart" DisplayCaption="true"  
            PositionCaption="Right" DataSaveUponStateChange="false" OnClientChange="EnableDisableNoDataMessage()" /> 
    </div>
    <div style="clear: both;"/> 
    
    <asiweb:SmartControl 
        ID="NoDataMessage" runat="server" 
        BoundPropertyName="NoDataMessage" DisplayCaption="true" 
        PositionCaption="Left" DataSaveUponStateChange="false"/>                           
                       
    <asp:Panel ID="PanelSettings" runat="server" Visible="true" EnableViewState="true">
        <asiweb:PanelTemplateControl ID="LabelSettings" TemplateTitle="Query Settings" runat="server" FieldSet="true" ShowHeader="true" BorderStyle="None" >
            <asp:Table ID="TableSettings" runat="server" CellPadding="5" EnableViewState="true"></asp:Table>
        </asiweb:PanelTemplateControl>
    </asp:Panel>      
    
    <asp:HiddenField ID="HiddenParametersCount" runat="server" Value="0" />
     
 </asiweb:paneltemplatecontrol>
 
 <script type="text/javascript">
    //<![CDATA[
    EnableDisableNoDataMessage();
    function EnableDisableNoDataMessage() {
        var hideEmptyChart = $get("<%#HideEmptyChart.ClientID%>_CheckBoxSet");
        var noDataMessage = $get("<%#NoDataMessage.ClientID%>");

        if (hideEmptyChart != undefined)
            if (hideEmptyChart.checked)
                noDataMessage.disabled = true;
            else
                noDataMessage.disabled = false;
    }
 //]]>
</script>