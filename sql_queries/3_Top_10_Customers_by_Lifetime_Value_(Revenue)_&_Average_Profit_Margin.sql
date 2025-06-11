SELECT
  c.customer_name,
  COUNT(t.order_date)                    AS num_orders,
  SUM(t.sales_amount)                    AS total_revenue,
  ROUND(AVG(t.profit_margin), 2)         AS avg_profit_margin_pct
FROM transactions AS t
JOIN customers AS c
  ON t.customer_code = c.customer_code
GROUP BY
  c.customer_code,
  c.customer_name
ORDER BY
  total_revenue DESC
LIMIT 10;
