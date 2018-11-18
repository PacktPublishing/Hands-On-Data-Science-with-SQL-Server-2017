create schema Helpers
authorization dbo
go

create table Helpers.CitySizes
(
Id int not null identity
, MinAmount int not null
, MaxAmount int not null
, Size nvarchar(10)
, constraint pk_CitySizes primary key (Id)
)

insert Helpers.CitySizes (MinAmount, MaxAmount, Size)
values (0, 100000, 'Small')
, (100001, 1000000, 'Middle')
, (1000001, 2000000000, 'Big')