CREATE TABLE ServiceTicket
(
Id int not null IDENTITY CONSTRAINT pk_ServiceTicket PRIMARY KEY
, IssueDate date NOT NULL
, Description nvarchar(200) NOT NULL
, Status tinyint NOT NULL CONSTRAINT chk_Status CHECK(Status BETWEEN 1 AND 3)
)
GO

INSERT ServiceTicket VALUES 
('20180511', 'New problem occured', 1)
, ('20180511', 'Second problem occured', 1)
, ('20180512', 'Network issue', 1)
GO