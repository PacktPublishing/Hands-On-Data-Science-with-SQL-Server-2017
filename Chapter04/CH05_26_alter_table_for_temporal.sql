ALTER TABLE Src.Products ADD
ValidFrom datetime2 generated always as row start
, ValidTo datetime2 generated always as row end
, PERIOD FOR SYSTEM_TIME (ValidFrom, ValidTo)