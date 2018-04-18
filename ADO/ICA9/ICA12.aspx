<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeFile="ICA12.aspx.cs" Inherits="ICA12" Theme="ADO" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    ICA 12 - ADO part 1 - Basic Queries
    <div>
        Pick a supplier: <asp:DropDownList ID="DropDownListSuppliers" runat="server" AutoPostBack="True" OnSelectedIndexChanged="DropDownListSuppliers_SelectedIndexChanged"></asp:DropDownList>
        <asp:TextBox ID="TextBoxFilter" runat="server"></asp:TextBox>
        <asp:Button ID="ButtonFilter" runat="server" Text="Filter" OnClick="ButtonFilter_Click" />
    </div>
    <asp:Table ID="TableOutput" runat="server"></asp:Table>
</asp:Content>
