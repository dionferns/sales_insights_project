WITH zone_revenue AS (
  SELECT
    m.zone,
    SUM(t.sales_amount) AS total_zone_revenue
  FROM transactions AS t
  JOIN markets AS m
    ON t.market_code = m.markets_code
  JOIN date AS d
    ON t.order_date = d.date
  WHERE d.year = 2020
  GROUP BY
    m.zone
),
grand_total AS (
  SELECT SUM(total_zone_revenue) AS overall_revenue
  FROM zone_revenue
)
SELECT
  zr.zone,
  zr.total_zone_revenue,
  ROUND(zr.total_zone_revenue / gt.overall_revenue * 100, 2)
    AS zone_share_pct
FROM zone_revenue AS zr
CROSS JOIN grand_total AS gt
ORDER BY
  zone_share_pct DESC;
