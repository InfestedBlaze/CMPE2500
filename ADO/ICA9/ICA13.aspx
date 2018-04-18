<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeFile="ICA13.aspx.cs" Inherits="ICA13" Theme="ADO"%>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    ICA 13 - ADO part 2 - Stored Procedures
    <div>
        Pick a supplier: <asp:DropDownList ID="DropDownListCustomers" runat="server" AutoPostBack="True" OnSelectedIndexChanged="DropDownListCustomers_SelectedIndexChanged"></asp:DropDownList>
        <asp:TextBox ID="TextBoxFilter" runat="server"></asp:TextBox>
        <asp:Button ID="ButtonFilter" runat="server" Text="Filter" OnClick="ButtonFilter_Click" />
    </div>
    <asp:GridView ID="GridViewCustomerCategory" runat="server"></asp:GridView>
</asp:Content>

