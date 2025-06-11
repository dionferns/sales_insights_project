# Sales Analytics Dashboard

This project is about comprehensive sales analytics solution built with SQL and Tableau, providing insights into revenue, profit, and sales trends across multiple markets and time periods for a company.

---

## Project Overview

This project demonstrates end-to-end sales analytics by:

- Storing transactional data in a relational database  
- Writing SQL queries to extract and aggregate key metrics  
- Building an interactive Tableau dashboard to visualize revenue, profit, and sales quantities by market, customer, and product  

By leveraging both SQL and Tableau, stakeholders can explore performance trends over time, compare markets, and drill into the details of individual transactions.

---

## Data Model

Two primary tables:

1. **`customers`**  
   - Contains customer master records (e.g. `customer_id`, `customer_name`, `segment`).  

2. **`transactions`**  
   - Contains each sales order (e.g. `order_id`, `order_date`, `market_code`, `product_code`, `sales_amount`, `currency`).  

3. **`date`**  
   - A date dimension table used to enrich transactions with calendar attributes (`date`, `year`, `month_name`, etc.).
