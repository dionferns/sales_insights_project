WITH delhi_sales AS (
  SELECT
    d.year,
    d.month_name,
    SUM(t.sales_qty) AS monthly_qty,
    DATE_FORMAT(d.cy_date, '%Y-%m-01') AS month_start
  FROM transactions AS t
  JOIN date AS d
    ON t.order_date = d.date
  WHERE t.market_code = 'Mark001'
  GROUP BY
    d.cy_date,
    d.year,
    d.month_name
)
SELECT
  ds.year,
  ds.month_name,
  ds.monthly_qty,
  ROUND(
    AVG(ds2.monthly_qty) OVER (
      ORDER BY ds.month_start
      ROWS BETWEEN 2 PRECEDING AND CURRENT ROW
    )
  , 0) AS rolling_3mo_avg_qty
FROM delhi_sales AS ds
ORDER BY
  ds.month_start;
