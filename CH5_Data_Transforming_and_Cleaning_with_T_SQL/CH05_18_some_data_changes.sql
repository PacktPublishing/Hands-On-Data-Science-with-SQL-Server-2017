delete Landing.Products where ProductKey between 20000 and 30000
update Landing.Products set ListPrice = 100000 where ProductKey between 50000 and 55000
insert Landing.Products (ProductKey, ProductName, ListPrice)
values (500000, 'Product half-of-million', 4.25)