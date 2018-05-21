BEGIN TRY
    BEGIN TRAN
    DELETE Analytics.Orders
    INSERT Analytics.Orders 
      (OrderLineId, ProductKey, ProductName, UnitPrice, Quantity, TotalPrice)
    SELECT ol.Id as OrderLineId
      , ProductKey
      , ProductName
      , UnitPrice
      , Quantity
      , TotalPrice
    FROM Src.OrderLines as ol
      JOIN Src.Products as p on ol.ProductId = p.ProductKey
    COMMIT
END TRY
BEGIN CATCH
    IF @@TRANCOUNT > 1
        ROLLBACK;
    THROW;
END CATCH