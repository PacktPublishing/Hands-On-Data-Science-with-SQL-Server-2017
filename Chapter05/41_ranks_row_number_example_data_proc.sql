CREATE OR ALTER PROC procLoadServiceTicketHistory
  @sampleLoadDate date = getdate
as
INSERT ServiceTicketHistory (Id, LoadDate, IssueDate, Description, Status)
SELECT Id
, @sampleLoadDate
, IssueDate
, Description, Status FROM ServiceTicket
GO