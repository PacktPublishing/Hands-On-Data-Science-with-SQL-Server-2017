CREATE TABLE TestResults
(
Id int NOT NULL IDENTITY CONSTRAINT pk_TestResults PRIMARY KEY
, StudentName nvarchar(10) NOT NULL
, Score tinyint NOT NULL
)

INSERT TestResults (StudentName, Score) VALUES
('Adam', 4), ('Bob', 4), ('Chris', 3), ('John', 8)
, ('Eve', 10), ('Adam II', 4), ('George', 5)
, ('Li', 8), ('Alexandro', 8), ('Jane', 5)