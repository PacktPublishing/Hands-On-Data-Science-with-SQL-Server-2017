-- some daily work is done
UPDATE ServiceTicket SET Status = 3 where Id = 2
INSERT ServiceTicket VALUES 
('20180602', 'SQL Server stopped suddenly', 1)

-- new version of data is loaded
EXEC procLoadServiceTicketHistory '20180602'

-- some daily work is done
UPDATE ServiceTicket SET Status = 2 where Id = 4

-- new version of data is loaded
EXEC procLoadServiceTicketHistory '20180603'

-- and so on...