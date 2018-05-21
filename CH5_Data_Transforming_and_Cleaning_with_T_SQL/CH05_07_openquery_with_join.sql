SELECT *
FROM OPENQUERY('REMOTESRV', 'SELECT * FROM Accounting.Enum.Accounts') AS rq
    JOIN dbo.AccountRecords AS ar ON rq.AccountID = ar.AccountID