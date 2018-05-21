use master
go

exec sp_configure 'show advanced options', 1
go
reconfigure
go

exec sp_configure 'ad hoc distributed queries', 0    -- only change is here
go
reconfigure
go

exec sp_configure 'show advanced options', 0
go
reconfigure
go