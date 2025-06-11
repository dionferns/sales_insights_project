
WITH monthly_stats AS (
  SELECT
    t.market_code,
    d.year,
    d.month_name,
    SUM(t.sales_amount)           AS total_revenue,
    AVG(t.profit_margin)          AS avg_profit_margin
  FROM transactions AS t
  JOIN date AS d
    ON t.order_date = d.date
  WHERE d.year = 2020
  GROUP BY
    t.market_code,
    d.year,
    d.month_name
)
SELECT
  m.markets_name       AS market,
  ms.month_name,
  ms.total_revenue,
  ROUND(ms.avg_profit_margin, 2) AS avg_profit_margin_pct
FROM monthly_stats AS ms
JOIN markets AS m
  ON ms.market_code = m.markets_code
ORDER BY
  m.markets_name,
  FIELD(ms.month_name,
    'January','February','March','April','May','June',
    'July','August','September','October','November','December'
  );