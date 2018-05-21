SELECT * FROM OPENROWSET('SQLOLEDB'
    , 'SQLREMOTE;user;password'
    , 'SELECT * FROM Accounting.dbo.Accounts');