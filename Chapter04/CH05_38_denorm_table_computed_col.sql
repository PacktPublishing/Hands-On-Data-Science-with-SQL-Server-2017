ALTER TABLE Src.OrderLines
DROP COLUMN TotalPrice

ALTER TABLE Src.OrderLines
ADD TOtalPrice AS (UnitPrice * Quantity) PERSISTED