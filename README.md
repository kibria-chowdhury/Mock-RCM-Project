# Mock-RCM-Project

<img src="https://www.healthrise.com/wp-content/uploads/2024/06/data-silos.jpeg.webp" alt="Thumbnail" style="width: 60%;"/>

## Overview
This repository contains a mock dataset and SQL scripts simulating key components of a Revenue Cycle Management (RCM) system. It’s designed for learning, testing, and demonstrating SQL-based data validation, quality checks, and performance analysis for healthcare claims data.

## What this project includes:
- Mock claim data (`claims_data.csv`)
- QA rules (`payer_rules.csv`)
- SQL scripts for rule checks (`rule_checks.sql`)
- Excel report output (`qa_summary.xlsx`)

## How to Run

### Option: Using SQL
1. Create a PostgreSQL (or SQLite) database and load:
   - `claims_data.csv` into a table `claims`
   - `payer_rules.csv` into a table `rules` 
2. Run the SQL rules in `rule_checks.sql`
3. Export the query results for analysis

## Output
- `qa_summary.xlsx`:
  - Sheet 1: All violated claims
  - Sheet 2: Summary count by rule and severity

## Notes
- SQL mode demonstrates how logic can be enforced directly in the data warehouse

