CREATE TABLE ServiceTicketHistory
(
Id int not null
, LoadDate date NOT NULL
, IssueDate date NOT NULL
, Description nvarchar(200) NOT NULL
, Status tinyint NOT NULL CONSTRAINT chk_StatusHistory CHECK(Status BETWEEN 1 AND 3)
, CONSTRAINT pk_ServiceTicketHistory PRIMARY KEY (Id, LoadDate)
)
GO