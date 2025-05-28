# SQL User Login Analysis 📊

This project contains SQL scripts to analyze user login behavior from a simulated dataset, useful for Power BI dashboards or backend insights. 

## 🚀 Use Case

These scripts help answer:
- Which users are inactive?
- How user engagement changes across quarters
- Users with daily activity
- Days with no user activity
- Session score analysis and more

## 📂 Structure

- `schema/` – Table definitions
- `data/` – Sample data inserts
- `queries/` – Analytical queries answering key business questions

## 🧠 Sample Questions Answered

1. Users who didn’t log in over the past 5 months
2. Quarterly session and user analysis
3. Users who logged in January but not November
4. Quarterly session % change
5. Max scoring user per day
6. Users who logged in every single day since first login
7. Dates when no user logged in

## 🛠️ Usage

```sql
-- Run schema
\i schema/create_tables.sql

-- Load sample data
\i data/insert_data.sql

-- Execute any query from the `queries` folder
