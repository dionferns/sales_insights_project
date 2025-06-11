# Sales Analytics & Reporting

This Project utilises SQL Queries and two Tableau Dashboards for analysis full‐stack sales analytics problem that demonstrates data ingestion, transformation, and visualization and dives into customer, transaction, market and date tables to compute rich KPIs and build interactive dashboards.

---
## Two Tableau Dashboard workbook: https://public.tableau.com/views/SalesInsightsProjectPhase2/Dashboard1_1?:language=en-GB&:sid=&:redirect=auth&:display_count=n&:origin=viz_share_link

## Project Overview

This repository contains:

- **Relational schema** for customers, markets, products, transactions and a date dimension  
- **Advanced SQL queries** (CTEs, window functions, pivots) to compute revenue trends, profitability, rolling averages and market-share  
- **Two Tableau workbooks** showcasing interactive dashboards with KPIs, time-series, bar charts, drill-downs and filter controls  

---

## Key SQL Queries (Descriptions)

- **Monthly Revenue & Avg. Profit Margin by Market (2020)**  
  Calculate each market’s total sales and average profit margin for every month in 2020.

- **Year-over-Year Revenue Growth by Market**  
  Compare each market’s annual revenue with the previous year and compute the percentage growth.

- **Top 10 Customers by Lifetime Value & Profitability**  
  Identify the ten highest-revenue customers, along with their order counts and average profit margins.

- **Zone-Level Market Share in 2020**  
  Aggregate 2020 sales by geographical zone and express each zone’s share as a percentage of the total.

- **3-Month Rolling Average of Sales Quantity for Delhi NCR**  
  Compute a moving three-month average of units sold in the Delhi NCR market, ordered by month.

## Tableau Dashboards
- **Dashboard 1: Revenue & Sales Quantity by Market, Time-Series Trends, Top Customers & Products.**

- **Dashboard 2: Total Revenue, Profit, Profit‐Margin %, Customer Table & Channel Mix Pie.**

**Both workbooks include:**

- **Year & Month filters**

- **Click-to-drill market-specific KPIs and charts**

- **Workbooks are located in the tableau/ folder.**

- ## Schema & Tables

```
customers
├─ customer_code    (PK)
├─ customer_name
└─ customer_type

markets
├─ markets_code     (PK)
├─ markets_name
└─ zone

products
├─ product_code     (PK)
└─ product_type

date
├─ date             (PK, YYYY-MM-DD)
├─ cy_date          (datetime)
├─ year             (INT)
├─ month_name       (VARCHAR)
└─ date_yy_mmm      (VARCHAR, e.g. '20-Jun')

transactions
├─ product_code     (FK → products.product_code)
├─ customer_code    (FK → customers.customer_code)
├─ market_code      (FK → markets.markets_code)
├─ order_date       (FK → date.date)
├─ sales_qty
├─ sales_amount
├─ currency
├─ cost_price
├─ profit_margin    (DECIMAL)
└─ profit_margin_%  (DECIMAL)
```
