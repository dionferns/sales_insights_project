# Sales Analytics & Reporting

A full‐stack sales analytics project that demonstrates data ingestion, transformation, and visualization using SQL and Tableau. Dive into customer, transaction, market and date tables to compute rich KPIs and build interactive dashboards.

---

## Project Overview

This repository contains:

- **Relational schema** for customers, markets, products, transactions and a date dimension  
- **Advanced SQL queries** (CTEs, window functions, pivots) to compute revenue trends, profitability, rolling averages and market-share  
- **Two Tableau workbooks** showcasing interactive dashboards with KPIs, time-series, bar charts, drill-downs and filter controls  

---

## Schema & Tables

## Schema & Tables

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
└─ profit_margin_%  (DECIMAL)```
