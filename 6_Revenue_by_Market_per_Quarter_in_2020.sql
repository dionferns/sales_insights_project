SELECT
  qtr,
  ROUND(SUM(CASE WHEN m.markets_code = 'Mark001' THEN t.sales_amount END), 2) AS Chennai,
  ROUND(SUM(CASE WHEN m.markets_code = 'Mark002' THEN t.sales_amount END), 2) AS Mumbai,
  ROUND(SUM(CASE WHEN m.markets_code = 'Mark003' THEN t.sales_amount END), 2) AS Ahmedabad,
  ROUND(SUM(t.sales_amount), 2)                                                   AS total_revenue
FROM transactions AS t
JOIN date AS d
  ON t.order_date = d.date
JOIN markets AS m
  ON t.market_code = m.markets_code
WHERE d.year = 2020
GROUP BY
  QUARTER(d.cy_date) AS qtr
ORDER BY
  qtr;
