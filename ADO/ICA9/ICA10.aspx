<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeFile="ICA10.aspx.cs" Inherits="ICA9" Theme="ADO"%>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server"> 
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <div class="Center FullWidth">
        ica 9 - Data Aware Controls - Nic Wasylyshyn
    </div>
    <div class="embeddedCont">
        <asp:Button ID="ButtonProducts" runat="server" Text="Show Products" OnClick="ButtonProducts_Click" />
        <asp:Button ID="ButtonEmployees" runat="server" Text="Manage Employees" OnClick="ButtonEmployees_Click" />
    </div>
    <asp:MultiView ID="MVInfoSelector" runat="server" Visible="False">
        <asp:View ID="ViewProducts" runat="server">
            <asp:SqlDataSource ID="DataProducts" runat="server" ConnectionString="<%$ ConnectionStrings:nwasylyshyn1_NorthwindNewConnectionString %>" SelectCommand="SELECT [ProductName], [QuantityPerUnit], [UnitPrice], [UnitsInStock], [UnitsOnOrder], [ReorderLevel], [Discontinued], [CategoryName], [ProductID] FROM [Alphabetical list of products] ORDER BY [ProductName]"></asp:SqlDataSource>
            <asp:GridView ID="GridViewProducts" runat="server" DataSourceID="DataProducts" AutoGenerateColumns="False" DataKeyNames="ProductID" AllowPaging="True" AllowSorting="True" OnRowDataBound="GridViewProducts_RowDataBound">
                <Columns>
                    <asp:BoundField DataField="ProductName" HeaderText="Product Name" SortExpression="ProductName" >
                    <HeaderStyle Font-Bold="True" />
                    <ItemStyle HorizontalAlign="Center" />
                    </asp:BoundField>
                    <asp:BoundField DataField="QuantityPerUnit" HeaderText="Quantity Per Unit" SortExpression="QuantityPerUnit" >
                    <ItemStyle HorizontalAlign="Center" />
                    </asp:BoundField>
                    <asp:BoundField DataField="UnitPrice" HeaderText="Unit Price" SortExpression="UnitPrice" DataFormatString="{0:c}" >
                    <ItemStyle HorizontalAlign="Left" />
                    </asp:BoundField>
                    <asp:BoundField DataField="UnitsInStock" HeaderText="Units In Stock" SortExpression="UnitsInStock" >
                    <ItemStyle HorizontalAlign="Right" />
                    </asp:BoundField>
                    <asp:BoundField DataField="UnitsOnOrder" HeaderText="Units On Order" SortExpression="UnitsOnOrder" >
                    <ItemStyle HorizontalAlign="Right" />
                    </asp:BoundField>
                    <asp:BoundField DataField="ReorderLevel" HeaderText="Reorder Level" SortExpression="ReorderLevel" >
                    <ItemStyle HorizontalAlign="Right" />
                    </asp:BoundField>
                    <asp:CheckBoxField DataField="Discontinued" HeaderText="Discontinued" SortExpression="Discontinued" >
                    <ItemStyle HorizontalAlign="Center" />
                    </asp:CheckBoxField>
                    <asp:BoundField DataField="CategoryName" HeaderText="Category Name" SortExpression="CategoryName" >
                    <ItemStyle HorizontalAlign="Center" />
                    </asp:BoundField>
                </Columns>
            </asp:GridView>
        </asp:View>

        <asp:View ID="ViewEmployees" runat="server">
            <asp:SqlDataSource ID="DataEmployees" runat="server" ConnectionString="<%$ ConnectionStrings:nwasylyshyn1_NorthwindNewConnectionString %>" DeleteCommand="DELETE FROM [Employees] WHERE [EmployeeID] = @EmployeeID" InsertCommand="INSERT INTO [Employees] ([LastName], [FirstName], [Title], [HireDate], [Address], [City], [Country]) VALUES (@LastName, @FirstName, @Title, @HireDate, @Address, @City, @Country)" SelectCommand="SELECT [EmployeeID], [LastName], [FirstName], [Title], [HireDate], [Address], [City], [Country] FROM [Employees] ORDER BY [EmployeeID]" UpdateCommand="UPDATE [Employees] SET [LastName] = @LastName, [FirstName] = @FirstName, [Title] = @Title, [HireDate] = @HireDate, [Address] = @Address, [City] = @City, [Country] = @Country WHERE [EmployeeID] = @EmployeeID">
                <DeleteParameters>
                    <asp:Parameter Name="EmployeeID" Type="Int32" />
                </DeleteParameters>
                <InsertParameters>
                    <asp:Parameter Name="LastName" Type="String" />
                    <asp:Parameter Name="FirstName" Type="String" />
                    <asp:Parameter Name="Title" Type="String" />
                    <asp:Parameter Name="HireDate" Type="DateTime" />
                    <asp:Parameter Name="Address" Type="String" />
                    <asp:Parameter Name="City" Type="String" />
                    <asp:Parameter Name="Country" Type="String" />
                </InsertParameters>
                <UpdateParameters>
                    <asp:Parameter Name="LastName" Type="String" />
                    <asp:Parameter Name="FirstName" Type="String" />
                    <asp:Parameter Name="Title" Type="String" />
                    <asp:Parameter Name="HireDate" Type="DateTime" />
                    <asp:Parameter Name="Address" Type="String" />
                    <asp:Parameter Name="City" Type="String" />
                    <asp:Parameter Name="Country" Type="String" />
                    <asp:Parameter Name="EmployeeID" Type="Int32" />
                </UpdateParameters>
            </asp:SqlDataSource>
            <asp:GridView ID="GridViewEmployees" runat="server" DataSourceID="DataEmployees" AllowPaging="True" AllowSorting="True" AutoGenerateColumns="False" DataKeyNames="EmployeeID" OnRowDataBound="GridViewEmployees_RowDataBound">
                <Columns>
                    <asp:CommandField ButtonType="Button" ShowDeleteButton="True" ShowEditButton="True" ShowSelectButton="True" />
                    <asp:BoundField DataField="EmployeeID" HeaderText="Employee ID" InsertVisible="False" ReadOnly="True" SortExpression="EmployeeID">
                    <HeaderStyle Font-Bold="True" />
                    </asp:BoundField>
                    <asp:BoundField DataField="LastName" HeaderText="Last Name" SortExpression="LastName">
                    <HeaderStyle Font-Bold="True" />
                    </asp:BoundField>
                    <asp:BoundField DataField="FirstName" HeaderText="First Name" SortExpression="FirstName">
                    <HeaderStyle Font-Bold="True" />
                    </asp:BoundField>
                    <asp:BoundField DataField="Title" HeaderText="Title" SortExpression="Title">
                    <HeaderStyle Font-Bold="True" />
                    </asp:BoundField>
                    <asp:BoundField DataField="HireDate" HeaderText="Hire Date" SortExpression="HireDate" DataFormatString="{0:dd MMMM yyyy}">
                    <HeaderStyle Font-Bold="True" />
                    </asp:BoundField>
                    <asp:BoundField DataField="Address" HeaderText="Address" SortExpression="Address">
                    <HeaderStyle Font-Bold="True" />
                    </asp:BoundField>
                    <asp:BoundField DataField="City" HeaderText="City" SortExpression="City">
                    <HeaderStyle Font-Bold="True" />
                    </asp:BoundField>
                    <asp:BoundField DataField="Country" HeaderText="Country" SortExpression="Country">
                    <HeaderStyle Font-Bold="True" />
                    </asp:BoundField>
                </Columns>
            </asp:GridView>
        </asp:View>
    </asp:MultiView>
</asp:Content>

