﻿<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="AddressSelectorAddress.ascx.cs" Inherits="Asi.Web.iParts.Commerce.AddressSelector.AddressSelectorAddress" %>

    <asp:HyperLink runat="server" ID="LinkChoose" Text="Use this address" NavigateUrl="javascript:void(0);"></asp:HyperLink>
    <asp:Label runat="server" ID="LabelSelectedAddress" Text="Selected Address" Font-Bold="True"></asp:Label>
    <br />
    <asp:Label runat="server" ID="LabelAddress" Text=""></asp:Label>
    <div runat="server" id="DivTelephone"><asp:Label runat="server" ID="LabelTelephone"></asp:Label></div>
    <div runat="server" id="DivEmail"><asp:Label runat="server" ID="LabelEmail"></asp:Label></div>
    <br />&nbsp;