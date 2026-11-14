# Customer Support Data Cleaning | SQL

## Project Overview

This is a beginner-friendly, guided SQL data-cleaning project I completed to strengthen my foundational SQL skills and gain more hands-on experience working with datasets.

Using a synthetic customer support ticket dataset, I practiced identifying data quality issues, cleaning inconsistent records, and preparing the data for analysis.

**Tools Used:** SQL Server Management Studio (SSMS), SQL Server (T-SQL)

**Project Type:** Guided Learning Project

## Dataset

The dataset contains 36 fictional customer support ticket records, including information about issue types, support channels, ticket priorities, statuses, and resolution times.

The raw dataset intentionally included duplicate records, missing values, and inconsistent text formatting to simulate common data-cleaning problems.

## Data Cleaning Process

### 1. Exploring the Data
- Used `SELECT`, `COUNT()`, `GROUP BY`, and `HAVING` to explore the dataset.
- Identified duplicate ticket IDs.
- Used `CASE WHEN` and `IS NULL` to locate missing values.

### 2. Removing Duplicates
- Created a separate working table to preserve the original data.
- Used `ROW_NUMBER()` with a Common Table Expression (CTE) to identify and remove duplicate tickets.
- Reduced the dataset from 36 records to 34 unique tickets.

### 3. Standardizing Data
- Used `TRIM()`, `UPPER()`, `LOWER()`, and `SUBSTRING()` to clean inconsistent text formatting.
- Standardized categorical fields to improve consistency for reporting.

### 4. Handling Missing Values
- Used `COALESCE()` to replace missing support channel and priority values with "Unknown."
- Preserved records rather than deleting useful information.

### 5. Validating and Analyzing Data
- Confirmed that all 34 remaining ticket IDs were unique.
- Verified that no NULL values remained in the cleaned Channel and Priority fields.
- Used `GROUP BY`, `COUNT()`, and `AVG()` to explore ticket categories and resolution times.

## Results

| Data Quality Metric | Result |
|---|---|
| Original records | 36 |
| Cleaned records | 34 |
| Duplicate records removed | 2 |
| Missing Channel values addressed | 1 |
| Missing Priority values addressed | 1 |
| Unique ticket IDs after cleaning | 34 |

## What I Learned

This guided project helped me better understand the data-cleaning process in SQL.

**My key takeaways included:**

- **Exploring before cleaning:** Understanding why data analysts inspect a dataset for quality issues before making changes.
- **Working with duplicates:** Learning how `ROW_NUMBER()` and CTEs can identify repeated records.
- **Handling missing data:** Understanding why missing values don't always require deleting an entire record.
- **Standardizing text:** Practicing SQL string functions to make categorical data consistent.
- **Validating results:** Learning the importance of checking whether cleaning operations produced the expected results.
- **Basic analysis:** Using aggregate functions to summarize cleaned data.

## Project Reflection

As I continue developing my data analytics skills, this project helped me become more comfortable reading, executing, and understanding SQL queries.

Although I completed this project with step-by-step guidance, I practiced each cleaning operation in SSMS and reviewed the purpose of the SQL functions used throughout the process.

This project reinforced my understanding of foundational data-cleaning techniques and gave me more experience preparing data for analysis.

## Project Files

- `customer_support_starter.sql` — Creates the synthetic dataset.
- `customer_support_cleaning.sql` — Contains the SQL cleaning, validation, and analysis queries.

*This project uses synthetic data and was completed as a guided learning exercise.*
