SELECT
   [Title]
  ,[FirstName]
  ,[MiddleName]
  ,[LastName]
  ,[Suffix]
  ,[JobTitle]
  ,[PhoneNumber]
  ,[PhoneNumberType]
  ,[EmailAddress]
FROM [AdventureWorks2016].[HumanResources].[vEmployee]
FOR JSON AUTO
GO


DECLARE @json NVARCHAR(4000) SET @json = '{"name":"John","surname":"Doe","age":45,"skills":["SQL","C#","MVC"]}'
SELECT ISJSON(@json)
GO


DECLARE @json NVARCHAR(4000) SET @json = '{"name":"John","surname":"Doe","age":45,"skills":["SQL","C#","MVC"]}'; 
SELECT * FROM OPENJSON(@json) 
WITH (
 name nvarchar(30), 
 surname nvarchar(30), 
 age int, 
 skills nvarchar(max) as json
)

DECLARE @json NVARCHAR(4000) SET @json = '{"name":"John","surname":"Doe","age":45,"skills":["SQL","C#","MVC"]}'; 

SELECT 
  JSON_VALUE(@json,'$.name') name,
  JSON_VALUE(@json,'$.surname') surname,
  JSON_VALUE(@json,'$.age') age,
  JSON_QUERY(@json,'$.skills') skills

DECLARE @json NVARCHAR(4000) SET @json = '{"name":"John","surname":"Doe","age":45,"skills":["SQL","C#","MVC"]}'; 

SELECT 
  JSON_VALUE(@json,'$.name') name,
  JSON_VALUE(@json,'$.surname') surname,
  JSON_VALUE(@json,'$.age') age,
  JSON_VALUE(@json,'$.skills[1]') csharp


DECLARE @json NVARCHAR(4000) SET @json = '{"name":"John","surname":"Doe","age":45,"skills":["SQL","C#","MVC"]}'; 

SELECT 
  JSON_MODIFY(@json,'$.name','Mike'),
  JSON_VALUE(@json,'$.name') name