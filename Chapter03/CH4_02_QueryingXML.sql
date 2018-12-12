SELECT c.[CustomerID],soh.SalesOrderID FROM Sales.Customer c
JOIN [Sales].[SalesOrderHeader] soh ON c.customerID = soh.CustomerID

SELECT c.[CustomerID],soh.SalesOrderID FROM Sales.Customer c
JOIN [Sales].[SalesOrderHeader] soh ON c.customerID = soh.CustomerID
FOR XML RAW

SELECT c.[CustomerID],soh.SalesOrderID FROM Sales.Customer c
JOIN [Sales].[SalesOrderHeader] soh ON c.customerID = soh.CustomerID
FOR XML AUTO -- AUTO mode instead of the RAW mode 

SELECT c.[CustomerID],soh.SalesOrderID FROM Sales.Customer c
JOIN [Sales].[SalesOrderHeader] soh ON c.customerID = soh.CustomerID
FOR XML RAW('customer'), ROOT('CustomerList')