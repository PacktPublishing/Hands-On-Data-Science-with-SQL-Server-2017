if (object_id('Customers') is null)
  create table Customers
  (
  Id int not null identity constraint pk_Customers primary key
  , FirstName nvarchar(30) not null
  , LastName nvarchar(30) not null
  , Age int null
  , YearlyIncome int null
  )