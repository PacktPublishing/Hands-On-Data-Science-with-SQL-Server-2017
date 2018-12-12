SELECT SERVERPROPERTY ('IsPolybaseInstalled') AS IsPolybaseInstalled; 

sp_configure @configname = 'hadoop connectivity', @configvalue = 1; 
GO 
RECONFIGURE 
GO 