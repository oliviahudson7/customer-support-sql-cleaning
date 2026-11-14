/*
Customer Support Ticket Data Cleaning — Starter Dataset
Portfolio practice dataset: SYNTHETIC, created for educational use.
Run this entire script in SQL Server Management Studio (SSMS).
No Excel import or drivers needed.
*/
IF DB_ID(N'SupportTicketPortfolio') IS NULL
    CREATE DATABASE SupportTicketPortfolio;
GO
USE SupportTicketPortfolio;
GO
IF OBJECT_ID(N'dbo.SupportTickets_Raw', N'U') IS NOT NULL
    DROP TABLE dbo.SupportTickets_Raw;
GO
CREATE TABLE dbo.SupportTickets_Raw (
    RecordID INT IDENTITY(1,1) PRIMARY KEY,
    TicketID VARCHAR(12) NULL,
    Channel VARCHAR(30) NULL,
    IssueType VARCHAR(40) NULL,
    Priority VARCHAR(20) NULL,
    Status VARCHAR(25) NULL,
    ResolutionHours DECIMAL(6,1) NULL,
    SatisfactionScore INT NULL
);
INSERT INTO dbo.SupportTickets_Raw
(TicketID, Channel, IssueType, Priority, Status, ResolutionHours, SatisfactionScore)
VALUES
('T001','Email','Login','High','Resolved',4.5,5),
('T002',' chat ','billing','medium','closed',12.0,4),
('T003','PHONE','Technical','HIGH','Resolved',2.0,5),
('T004','email','Account','low','Open',NULL,NULL),
('T005','Chat','Login','Medium','resolved',7.0,3),
('T006',' phone','Billing','High','Closed',6.0,4),
('T007','Email','technical ','Medium','Open',NULL,NULL),
('T008','CHAT','Account','Low','Resolved',18.0,4),
('T009','Phone','Login','high','Resolved',1.5,5),
('T010','Email','Billing','MEDIUM','closed',9.5,4),
('T011','Chat','Technical','High','Resolved',3.0,5),
('T012','phone ',' account','Low','open',NULL,NULL),
('T013','Email','Login','Medium','Resolved',8.0,4),
('T014',' chat','Billing','High','Closed',5.0,2),
('T015','Phone','Technical','medium','Resolved',11.0,4),
('T016','EMAIL','Account','Low','Resolved',20.0,3),
('T017','Chat','login ','High','Open',NULL,NULL),
('T018','Phone','Billing','Medium','Closed',13.0,3),
('T019','Email','Technical','High','Resolved',2.5,5),
('T020','Chat','Account','low','Resolved',22.0,4),
('T021','Phone',' Login','HIGH','Closed',4.0,5),
('T022','Email','Billing','Medium','Open',NULL,NULL),
('T023','Chat','Technical','high','resolved',6.5,4),
('T024',' phone ','Account','Low','Closed',16.0,3),
('T025','Email','Login','Medium','Resolved',10.0,4),
('T026','Chat','Billing','High','Resolved',3.5,5),
('T027','Phone','Technical','Medium','Closed',8.5,4),
('T028','Email','Account','low','Open',NULL,NULL),
('T029','Chat','Login','High','Resolved',2.0,5),
('T030','Phone','Billing','Medium','Closed',14.0,3),
('T010','Email','Billing','MEDIUM','closed',9.5,4), -- duplicate ticket
('T023','Chat','Technical','high','resolved',6.5,4), -- duplicate ticket
('T031','  email  ','Technical','high','Resolved',7.5,NULL),
('T032','PHONE','Billing',NULL,'closed',15.0,3),
('T033',NULL,'Login','Medium','Open',NULL,NULL),
('T034','chat',' Account ','Low','Resolved',19.0,4);
SELECT * FROM dbo.SupportTickets_Raw ORDER BY RecordID;
