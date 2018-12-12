declare @i int = 1
while @i <= 200000
 begin
  insert Landing.Products (ProductKey, ProductName, ListPrice)
  values (@i, 'Product ' + cast(@i as nvarchar), RAND() * 1000)
  
  set @i += 1
 end