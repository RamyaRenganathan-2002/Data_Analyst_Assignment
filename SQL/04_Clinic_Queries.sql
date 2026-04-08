Q1:
SELECT 
    sales_channel,
    SUM(amount) AS total_revenue
FROM clinic_sales
WHERE EXTRACT(YEAR FROM datetime) = 2021
GROUP BY sales_channel;

Q2:
SELECT 
    uid,
    SUM(amount) AS total_spent
FROM clinic_sales
WHERE EXTRACT(YEAR FROM datetime) = 2021
GROUP BY uid
ORDER BY total_spent DESC
LIMIT 10;

Q3:
SELECT 
    r.month,
    r.revenue,
    e.expense,
    (r.revenue - e.expense) AS profit,
    CASE 
        WHEN (r.revenue - e.expense) > 0 THEN 'Profitable'
        ELSE 'Not Profitable'
    END AS status
FROM (
    SELECT 
        EXTRACT(MONTH FROM datetime) AS month,
        SUM(amount) AS revenue
    FROM clinic_sales
    WHERE EXTRACT(YEAR FROM datetime) = 2021
    GROUP BY month
) r
JOIN (
    SELECT 
        EXTRACT(MONTH FROM datetime) AS month,
        SUM(amount) AS expense
    FROM expenses
    WHERE EXTRACT(YEAR FROM datetime) = 2021
    GROUP BY month
) e
ON r.month = e.month;

Q4:
SELECT *
FROM (
    SELECT 
        c.city,
        cs.cid,
        SUM(cs.amount) - COALESCE(SUM(e.amount), 0) AS profit,
        RANK() OVER (
            PARTITION BY c.city 
            ORDER BY SUM(cs.amount) - COALESCE(SUM(e.amount), 0) DESC
        ) AS rnk
    FROM clinic_sales cs
    JOIN clinics c ON cs.cid = c.cid
    LEFT JOIN expenses e ON cs.cid = e.cid
    WHERE EXTRACT(MONTH FROM cs.datetime) = 9
    GROUP BY c.city, cs.cid
) t
WHERE rnk = 1;

Q5:
SELECT *
FROM (
    SELECT 
        c.state,
        cs.cid,
        SUM(cs.amount) - COALESCE(SUM(e.amount), 0) AS profit,
        RANK() OVER (
            PARTITION BY c.state 
            ORDER BY SUM(cs.amount) - COALESCE(SUM(e.amount), 0) ASC
        ) AS rnk
    FROM clinic_sales cs
    JOIN clinics c ON cs.cid = c.cid
    LEFT JOIN expenses e ON cs.cid = e.cid
    WHERE EXTRACT(MONTH FROM cs.datetime) = 9
    GROUP BY c.state, cs.cid
) t
WHERE rnk = 2;
