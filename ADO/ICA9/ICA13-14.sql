use nwasylyshyn1_NorthwindNew
go

if exists(select * from sysobjects where [name] = 'GetCustomers')
	drop procedure GetCustomers
go

create procedure GetCustomers
	@filter varchar(25)
as
	select CompanyName as 'CustomerName', CustomerID
	from Customers
	where CompanyName like '%' + @filter + '%'
go

if exists(select * from sysobjects where [name] = 'CustCatSummary')
	drop procedure CustCatSummary
go

create procedure CustCatSummary
	@CustomerID nchar(5)
as
	select 
		cat.CategoryName,
		SUM(od.Quantity) as 'Quantity',
		SUM(od.Quantity * od.UnitPrice) as 'Cost'
	from Customers as c
		inner join Orders as o
		on c.CustomerID = o.CustomerID
			inner join [Order Details] as od
			on o.OrderID = od.OrderID
				inner join Products as p
				on od.ProductID = p.ProductID
					inner join Categories as cat
					on p.CategoryID = cat.CategoryID
	where c.CustomerID = @CustomerID
	group by cat.CategoryName
	order by [Quantity] desc
go

if exists(select * from sysobjects where [name] = 'DeleteOrderDetails')
	drop procedure DeleteOrderDetails
go

create procedure DeleteOrderDetails
	@OrderID as int,
	@ProductID as int,
	@Message as varchar(80) output
as
	DELETE [Order Details]
	WHERE [Order Details].OrderID = @OrderID and
		  [Order Details].ProductID = @ProductID
	if @@ROWCOUNT > 0
		set @Message = 'Record deleted'
	else
		set @Message = 'No records deleted, possible error'
go

if exists(select * from sysobjects where [name] = 'InsertOrderDetails')
	drop procedure InsertOrderDetails
go

create procedure InsertOrderDetails
	@OrderID as int,
	@ProductID as int,
	@Quantity as smallint
as
	if not exists(select OrderID from Orders where OrderID = @OrderID)
		return 0
	if not exists(select ProductID from Products where ProductID = @ProductID)
		return 0

	declare @Price as money
	set @Price = (select UnitPrice from Products where ProductID = @ProductID)
		

	insert into [Order Details] (OrderID, ProductID, UnitPrice, Quantity, Discount)
	values (@OrderID, @ProductID, @Price, @Quantity, 0)
go
