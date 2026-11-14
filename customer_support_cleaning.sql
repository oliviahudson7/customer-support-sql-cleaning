/*
Customer Support Ticket Data Cleaning | SQL Server (T-SQL)
Synthetic practice data. Run customer_support_starter.sql first.
This script recreates the CLEAN table; the RAW table is not modified.
*/
USE SupportTicketPortfolio;
GO

-- 1. Explore issues in the raw data.
SELECT COUNT(*) AS RawRows, COUNT(DISTINCT TicketID) AS UniqueTicketIDs
FROM dbo.SupportTickets_Raw;

SELECT TicketID, COUNT(*) AS Copies
FROM dbo.SupportTickets_Raw
GROUP BY TicketID
HAVING COUNT(*) > 1;

SELECT
    SUM(CASE WHEN Channel IS NULL OR TRIM(Channel) = '' THEN 1 ELSE 0 END) AS MissingChannel,
    SUM(CASE WHEN Priority IS NULL OR TRIM(Priority) = '' THEN 1 ELSE 0 END) AS MissingPriority
FROM dbo.SupportTickets_Raw;

-- 2. Create a working copy; preserve raw records.
-- WARNING: Re-running this script replaces only the existing clean table.
DROP TABLE IF EXISTS dbo.SupportTickets_Clean;
SELECT * INTO dbo.SupportTickets_Clean FROM dbo.SupportTickets_Raw;

-- 3. Deduplicate by TicketID; keep the earliest imported RecordID.
WITH RankedTickets AS (
    SELECT RecordID, TicketID,
           ROW_NUMBER() OVER (PARTITION BY TicketID ORDER BY RecordID) AS RowNum
    FROM dbo.SupportTickets_Clean
)
DELETE FROM RankedTickets WHERE RowNum > 1;

-- 4. Trim and standardize capitalization across all category fields.
-- NULLIF handles empty strings and whitespace-only values after trimming.
UPDATE dbo.SupportTickets_Clean
SET
    Channel = NULLIF(UPPER(LEFT(TRIM(Channel), 1)) + LOWER(SUBSTRING(TRIM(Channel), 2, 100)), ''),
    IssueType = NULLIF(UPPER(LEFT(TRIM(IssueType), 1)) + LOWER(SUBSTRING(TRIM(IssueType), 2, 100)), ''),
    Priority = NULLIF(UPPER(LEFT(TRIM(Priority), 1)) + LOWER(SUBSTRING(TRIM(Priority), 2, 100)), ''),
    Status = NULLIF(UPPER(LEFT(TRIM(Status), 1)) + LOWER(SUBSTRING(TRIM(Status), 2, 100)), '');

-- 5. Label missing values without making up channel/priority information.
UPDATE dbo.SupportTickets_Clean
SET Channel = COALESCE(Channel, 'Unknown'),
    Priority = COALESCE(Priority, 'Unknown');

-- 6. Validate final results.
SELECT
    COUNT(*) AS CleanRows,
    COUNT(DISTINCT TicketID) AS UniqueTicketIDs,
    SUM(CASE WHEN Channel IS NULL THEN 1 ELSE 0 END) AS MissingChannels,
    SUM(CASE WHEN Priority IS NULL THEN 1 ELSE 0 END) AS MissingPriorities
FROM dbo.SupportTickets_Clean;
-- Expected: 34 | 34 | 0 | 0

-- 7. Basic reporting queries.
SELECT IssueType, COUNT(*) AS TotalTickets
FROM dbo.SupportTickets_Clean
GROUP BY IssueType
ORDER BY TotalTickets DESC;

-- Non-NULL resolution times only; not every ticket has been resolved.
SELECT Priority,
       COUNT(ResolutionHours) AS TicketsWithResolutionTime,
       ROUND(AVG(ResolutionHours), 2) AS AvgResolutionHours
FROM dbo.SupportTickets_Clean
WHERE ResolutionHours IS NOT NULL
GROUP BY Priority
ORDER BY AvgResolutionHours DESC;
