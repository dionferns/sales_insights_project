WITH annual_revenue AS (
  SELECT
    t.market_code,
    d.year,
    SUM(t.sales_amount) AS total_revenue
  FROM transactions AS t
  JOIN date AS d
    ON t.order_date = d.date
  GROUP BY
    t.market_code,
    d.year
),
revenue_with_lag AS (
  SELECT
    ar.*,
    LAG(ar.total_revenue) OVER (
      PARTITION BY ar.market_code
      ORDER BY ar.year
    ) AS prev_year_revenue
  FROM annual_revenue AS ar
)
SELECT
  m.markets_name                        AS market,
  r.year,
  r.total_revenue,
  r.prev_year_revenue,
  ROUND(
    CASE
      WHEN r.prev_year_revenue > 0
      THEN (r.total_revenue - r.prev_year_revenue) / r.prev_year_revenue * 100
      ELSE NULL
    END
  , 2)                                  AS yoy_growth_pct
FROM revenue_with_lag AS r
JOIN markets AS m
  ON r.market_code = m.markets_code
ORDER BY
  m.markets_name,
  r.year;
