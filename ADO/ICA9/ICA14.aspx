<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeFile="ICA14.aspx.cs" Inherits="ICA14" theme="ADO"%>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    ICA14 - Modify Order Details<br /><hr />
    Part 1 - Delete Order Details<br /><hr />
    <div>
        Enter OrderID: <asp:TextBox ID="TextBoxOrderID" runat="server"></asp:TextBox><asp:Button ID="ButtonGetOrderDetails" runat="server" Text="Get Order Details" OnClick="ButtonGetOrderDetails_Click" />
    </div><br />

    <asp:SqlDataSource ID="SqlDataSourceOrderDetails" runat="server" ConnectionString="<%$ ConnectionStrings:nwasylyshyn1_NorthwindNewConnectionString %>" SelectCommand="select  od.OrderID, od.ProductID, p.ProductName, od.UnitPrice, od.Quantity, od.Discount from [Order Details] as od inner join Products as p on od.ProductID = p.ProductID where od.OrderID = @OrderID">
        <SelectParameters>
            <asp:ControlParameter ControlID="TextBoxOrderID" Name="OrderID" PropertyName="Text" />
        </SelectParameters>
    </asp:SqlDataSource>
    <asp:GridView ID="GridViewOrderDetails" runat="server" AutoGenerateColumns="False" DataSourceID="SqlDataSourceOrderDetails" DataKeyNames="OrderID,ProductID">
        <Columns>
            <asp:CommandField ShowSelectButton="True" />
            <asp:BoundField DataField="OrderID" HeaderText="OrderID" SortExpression="OrderID" ReadOnly="True" />
            <asp:BoundField DataField="ProductName" HeaderText="ProductName" SortExpression="ProductName" />
            <asp:BoundField DataField="UnitPrice" HeaderText="UnitPrice" SortExpression="UnitPrice" />
            <asp:BoundField DataField="Quantity" HeaderText="Quantity" SortExpression="Quantity" />
            <asp:BoundField DataField="Discount" HeaderText="Discount" SortExpression="Discount" />
        </Columns>
    </asp:GridView>

    <asp:Button ID="ButtonDelete" runat="server" Text="Delete Selected" OnClick="ButtonDelete_Click" /><br />
    Status: <asp:Label ID="LabelStatus" runat="server" Text="status"></asp:Label><br /><hr />

    Part 2 - Insert Order Details<br /><hr />

    Enter OrderID: <asp:TextBox ID="TextBoxOrderIDInsert" runat="server"></asp:TextBox><br />
    <asp:SqlDataSource ID="SqlDataSourceProducts" runat="server" ConnectionString="<%$ ConnectionStrings:nwasylyshyn1_NorthwindNewConnectionString %>" SelectCommand="SELECT [ProductName], [ProductID] FROM [Products]"></asp:SqlDataSource>
    Select Product: <asp:DropDownList ID="DropDownListProductList" runat="server" DataSourceID="SqlDataSourceProducts" DataTextField="ProductName" DataValueField="ProductID"></asp:DropDownList><br />
    Enter Quantity: <asp:TextBox ID="TextBoxQuantity" runat="server"></asp:TextBox><br />
    <asp:Button ID="ButtonInsertRecord" runat="server" Text="Insert Record" OnClick="ButtonInsertRecord_Click" /><br />
    Status: <asp:Label ID="LabelStatusInsert" runat="server" Text="Label"></asp:Label>
</asp:Content>

