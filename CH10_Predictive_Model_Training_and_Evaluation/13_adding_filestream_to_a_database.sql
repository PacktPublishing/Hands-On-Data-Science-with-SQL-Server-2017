use master
go
alter database DemoModel add filegroup FS contains filestream;
alter database DemoModel add file
(
name = 'FSData'
, filename = 'C:\temp\fs'    -- change the path to yours existing one
) to filegroup FS;