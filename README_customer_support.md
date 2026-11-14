# Customer Support Ticket Data Cleaning (SQL)

## Overview
A beginner-friendly SQL Server portfolio exercise using **synthetic customer-support ticket data**. The goal was to turn inconsistent raw records into a cleaner table suitable for basic reporting. This is a **guided practice project**, not a real company dataset.

## Tools and skills
- **Tools:** SQL Server Management Studio (SSMS), T-SQL
- **SQL:** `SELECT`, `COUNT`, `GROUP BY`, `HAVING`, `CASE`, `ROW_NUMBER`, CTEs, `DELETE`, `UPDATE`, `TRIM`, `COALESCE`, `AVG`
- **Skills:** duplicate detection, missing-value handling, text standardization, data validation, simple aggregation

## Data issues and cleaning process
1. Inspected **36 raw records** and found two duplicated ticket IDs (`T010`, `T023`).
2. Copied the raw data into a separate working table to preserve the source.
3. Removed duplicate ticket rows using `ROW_NUMBER()` partitioned by ticket ID, keeping the earliest record.
4. Trimmed extra spaces and standardized capitalization in `Channel`, `IssueType`, `Priority`, and `Status`.
5. Replaced one missing `Channel` and one missing `Priority` value with `Unknown` to retain those records without inventing information.
6. Ran validation checks to confirm **34 rows, 34 unique ticket IDs, and no NULL values in Channel or Priority**.

## Reporting queries
- Ticket count by issue type.
- Average recorded resolution hours by ticket priority (excluding NULL resolution times).

## How to reproduce
1. Open **SQL Server Management Studio** and connect to your SQL Server instance.
2. Run `customer_support_starter.sql` to create the `SupportTicketPortfolio` database and seed the synthetic raw data.
3. Run `customer_support_cleaning.sql` to create and clean the working table and produce the validation/reporting outputs.

**Note:** The starter script rebuilds the raw table and the cleaning script rebuilds the clean table. They are designed for a practice database, not a production environment. `Closed` and `Resolved` are left as distinct status labels because their business meanings have not been defined.

## Portfolio context
This small guided project demonstrates foundational T-SQL data-cleaning techniques and documentation. It is not presented as an independently sourced real-world analysis.
