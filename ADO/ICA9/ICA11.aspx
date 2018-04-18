<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeFile="ICA11.aspx.cs" Inherits="ICA10" Theme="ADO"%>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <div class="Center FullWidth">
        ica 10 - More Data Aware Controls - Nic Wasylyshyn
    </div>
    <asp:SqlDataSource ID="SqlDataSourceCustomers" runat="server" ConnectionString="<%$ ConnectionStrings:nwasylyshyn1_NorthwindNewConnectionString %>" SelectCommand="SELECT [CustomerID], [CompanyName] FROM [Customers] ORDER BY [CompanyName]"></asp:SqlDataSource>
    <div>Customer: <asp:DropDownList ID="DropDownCustomerSelect" runat="server" DataSourceID="SqlDataSourceCustomers" DataTextField="CompanyName" DataValueField="CustomerID" AutoPostBack="True" OnSelectedIndexChanged="DropDownCustomerSelect_SelectedIndexChanged"></asp:DropDownList></div>

    <asp:SqlDataSource ID="SqlDataSourceOrders" runat="server" ConnectionString="<%$ ConnectionStrings:nwasylyshyn1_NorthwindNewConnectionString %>" DeleteCommand="DELETE FROM [Orders] WHERE [OrderID] = @OrderID" InsertCommand="INSERT INTO [Orders] ([CustomerID], [OrderDate]) VALUES (@CustomerID, @OrderDate)" SelectCommand="SELECT [OrderID], [CustomerID], [OrderDate] FROM [Orders] WHERE ([CustomerID] LIKE '%' + @CustomerID + '%') ORDER BY [OrderID]" UpdateCommand="UPDATE [Orders] SET [CustomerID] = @CustomerID, [OrderDate] = @OrderDate WHERE [OrderID] = @OrderID">
        <DeleteParameters>
            <asp:Parameter Name="OrderID" Type="Int32" />
        </DeleteParameters>
        <InsertParameters>
            <asp:Parameter Name="CustomerID" Type="String" />
            <asp:Parameter Name="OrderDate" Type="DateTime" />
        </InsertParameters>
        <SelectParameters>
            <asp:ControlParameter ControlID="DropDownCustomerSelect" Name="CustomerID" PropertyName="SelectedValue" Type="String" />
        </SelectParameters>
        <UpdateParameters>
            <asp:Parameter Name="CustomerID" Type="String" />
            <asp:Parameter Name="OrderDate" Type="DateTime" />
            <asp:Parameter Name="OrderID" Type="Int32" />
        </UpdateParameters>
    </asp:SqlDataSource>

    <asp:ListView ID="ListViewOrders" runat="server" DataKeyNames="OrderID" DataSourceID="SqlDataSourceOrders" InsertItemPosition="LastItem">
        <AlternatingItemTemplate>
            <tr style="background-color:#FFF8DC;">
                <td>
                    <asp:Button ID="DeleteButton" runat="server" CommandName="Delete" Text="Delete" />
                    <asp:Button ID="EditButton" runat="server" CommandName="Edit" Text="Edit" />
                    <asp:Button ID="SelectButton" runat="server" CommandName="Select" Text="Select" />
                </td>
                <td>
                    <asp:Label ID="OrderIDLabel" runat="server" Text='<%# Eval("OrderID") %>' />
                </td>
                <td>
                    <asp:Label ID="CustomerIDLabel" runat="server" Text='<%# Eval("CustomerID") %>' />
                </td>
                <td>
                    <asp:Label ID="OrderDateLabel" runat="server" Text='<%# Eval("OrderDate") %>' />
                </td>
            </tr>
        </AlternatingItemTemplate>
        <EditItemTemplate>
            <tr style="background-color:#008A8C;color: #FFFFFF;">
                <td>
                    <asp:Button ID="UpdateButton" runat="server" CommandName="Update" Text="Update" />
                    <asp:Button ID="CancelButton" runat="server" CommandName="Cancel" Text="Cancel" />
                </td>
                <td>
                    <asp:Label ID="OrderIDLabel1" runat="server" Text='<%# Eval("OrderID") %>' />
                </td>
                <td>
                    <asp:DropDownList ID="DropDownListCustomersInsert" runat="server" DataSourceID="SqlDataSourceCustomers" DataTextField="CompanyName" DataValueField="CustomerID" SelectedValue='<%# Bind("CustomerID") %>'></asp:DropDownList>
                </td>
                <td>
                    <asp:Calendar ID="CalendarOrderDateSelect" runat="server" SelectedDate='<%# Bind("OrderDate") %>'></asp:Calendar>
                </td>
            </tr>
        </EditItemTemplate>
        <EmptyDataTemplate>
            <table runat="server" style="background-color: #FFFFFF;border-collapse: collapse;border-color: #999999;border-style:none;border-width:1px;">
                <tr>
                    <td>No data was returned.</td>
                </tr>
            </table>
        </EmptyDataTemplate>
        <InsertItemTemplate>
            <tr style="">
                <td>
                    <asp:Button ID="InsertButton" runat="server" CommandName="Insert" Text="Insert" />
                    <asp:Button ID="CancelButton" runat="server" CommandName="Cancel" Text="Clear" />
                </td>
                <td>&nbsp;</td>
                <td>
                    <asp:DropDownList ID="DropDownListCustomersInsert" runat="server" DataSourceID="SqlDataSourceCustomers" DataTextField="CompanyName" DataValueField="CustomerID" SelectedValue='<%# Bind("CustomerID") %>'></asp:DropDownList>
                </td>
                <td>
                    <asp:Calendar ID="CalendarOrderDateSelect" runat="server" SelectedDate='<%# Bind("OrderDate") %>'></asp:Calendar>
                </td>
            </tr>
        </InsertItemTemplate>
        <ItemTemplate>
            <tr style="background-color:#DCDCDC;color: #000000;">
                <td>
                    <asp:Button ID="DeleteButton" runat="server" CommandName="Delete" Text="Delete" />
                    <asp:Button ID="EditButton" runat="server" CommandName="Edit" Text="Edit" />
                    <asp:Button ID="SelectButton" runat="server" CommandName="Select" Text="Select" />
                </td>
                <td>
                    <asp:Label ID="OrderIDLabel" runat="server" Text='<%# Eval("OrderID") %>' />
                </td>
                <td>
                    <asp:Label ID="CustomerIDLabel" runat="server" Text='<%# Eval("CustomerID") %>' />
                </td>
                <td>
                    <asp:Label ID="OrderDateLabel" runat="server" Text='<%# Eval("OrderDate") %>' />
                </td>
            </tr>
        </ItemTemplate>
        <LayoutTemplate>
            <table runat="server">
                <tr runat="server">
                    <td runat="server">
                        <table id="itemPlaceholderContainer" runat="server" border="1" style="background-color: #FFFFFF;border-collapse: collapse;border-color: #999999;border-style:none;border-width:1px;font-family: Verdana, Arial, Helvetica, sans-serif;">
                            <tr runat="server" style="background-color:#DCDCDC;color: #000000;">
                                <th runat="server"></th>
                                <th runat="server">OrderID</th>
                                <th runat="server">CustomerID</th>
                                <th runat="server">OrderDate</th>
                            </tr>
                            <tr id="itemPlaceholder" runat="server">
                            </tr>
                        </table>
                    </td>
                </tr>
                <tr runat="server">
                    <td runat="server" style="text-align: center;background-color: #CCCCCC;font-family: Verdana, Arial, Helvetica, sans-serif;color: #000000;">
                        <asp:DataPager ID="DataPager1" runat="server">
                            <Fields>
                                <asp:NextPreviousPagerField ButtonType="Button" ShowFirstPageButton="True" ShowLastPageButton="True" />
                            </Fields>
                        </asp:DataPager>
                    </td>
                </tr>
            </table>
        </LayoutTemplate>
        <SelectedItemTemplate>
            <tr style="background-color:#008A8C;font-weight: bold;color: #FFFFFF;">
                <td>
                    <asp:Button ID="DeleteButton" runat="server" CommandName="Delete" Text="Delete" />
                    <asp:Button ID="EditButton" runat="server" CommandName="Edit" Text="Edit" />
                </td>
                <td>
                    <asp:Label ID="OrderIDLabel" runat="server" Text='<%# Eval("OrderID") %>' />
                </td>
                <td>
                    <asp:Label ID="CustomerIDLabel" runat="server" Text='<%# Eval("CustomerID") %>' />
                </td>
                <td>
                    <asp:Label ID="OrderDateLabel" runat="server" Text='<%# Eval("OrderDate") %>' />
                </td>
            </tr>
        </SelectedItemTemplate>
    </asp:ListView>

    <br />

    <asp:SqlDataSource ID="SqlDataSourceSummary" runat="server" ConnectionString="<%$ ConnectionStrings:nwasylyshyn1_NorthwindNewConnectionString %>" SelectCommand="SELECT 
	        od.OrderID,
	        c.CategoryID,
	        c.CategoryName,
	        SUM(od.Quantity * od.UnitPrice) as 'Category Price'
        FROM [Order Details] AS od
	        inner join Products as p
	        on od.ProductID = p.ProductID
		        inner join Categories as c
		        on p.CategoryID = c.CategoryID
        where od.OrderID = @OrderID
        group by od.OrderID, c.CategoryID, c.CategoryName">
        <SelectParameters>
            <asp:ControlParameter ControlID="ListViewOrders" Name="OrderID" PropertyName="SelectedValue" />
        </SelectParameters>
    </asp:SqlDataSource>
    <asp:DetailsView ID="DetailsViewSummary" runat="server" Height="50px" Width="125px" AllowPaging="True" AutoGenerateRows="False" DataKeyNames="CategoryID" DataSourceID="SqlDataSourceSummary">
        <EmptyDataTemplate>
            No Data
        </EmptyDataTemplate>
        <Fields>
            <asp:BoundField DataField="OrderID" HeaderText="Order ID" SortExpression="OrderID">
            <ItemStyle HorizontalAlign="Left" />
            </asp:BoundField>
            <asp:BoundField DataField="CategoryID" HeaderText="Category ID" InsertVisible="False" ReadOnly="True" SortExpression="CategoryID">
            <ItemStyle HorizontalAlign="Right" />
            </asp:BoundField>
            <asp:BoundField DataField="CategoryName" HeaderText="Category Name" SortExpression="CategoryName">
            <ItemStyle HorizontalAlign="Left" />
            </asp:BoundField>
            <asp:BoundField DataField="Category Price" DataFormatString="{0:c}" HeaderText="Category Price" ReadOnly="True" SortExpression="Category Price">
            <ItemStyle HorizontalAlign="Right" />
            </asp:BoundField>
        </Fields>
    </asp:DetailsView>
</asp:Content>

