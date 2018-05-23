--create a full text catalog 
CREATE FULLTEXT CATALOG jsonFullText
GO

--create a full text index on the column storing json data
CREATE FULLTEXT INDEX ON Person.Person_json(PhoneNumber)
KEY INDEX PK_Person_json_PersonID
ON jsonFullText