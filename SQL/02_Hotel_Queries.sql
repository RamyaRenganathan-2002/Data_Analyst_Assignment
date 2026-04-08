Q1: 
SELECT user_id, room_no
FROM bookings b
WHERE booking_date = (
    SELECT MAX(booking_date)
    FROM bookings
    WHERE user_id = b.user_id
);

Q2:
SELECT 
    b.booking_id,
    SUM(bc.item_quantity * i.item_rate) AS total_amount
FROM bookings b
JOIN booking_commercials bc 
    ON b.booking_id = bc.booking_id
JOIN items i 
    ON bc.item_id = i.item_id
WHERE EXTRACT(MONTH FROM b.booking_date) = 11
  AND EXTRACT(YEAR FROM b.booking_date) = 2021
GROUP BY b.booking_id;

Q3:
SELECT 
    bc.bill_id,
    SUM(bc.item_quantity * i.item_rate) AS total_bill
FROM booking_commercials bc
JOIN items i 
    ON bc.item_id = i.item_id
WHERE EXTRACT(MONTH FROM bc.bill_date) = 10
  AND EXTRACT(YEAR FROM bc.bill_date) = 2021
GROUP BY bc.bill_id
HAVING SUM(bc.item_quantity * i.item_rate) > 1000;

Q4:
SELECT *
FROM (
    SELECT 
        EXTRACT(MONTH FROM bc.bill_date) AS month,
        i.item_name,
        SUM(bc.item_quantity) AS total_qty,
        RANK() OVER (
            PARTITION BY EXTRACT(MONTH FROM bc.bill_date)
            ORDER BY SUM(bc.item_quantity) DESC
        ) AS most_rank,
        RANK() OVER (
            PARTITION BY EXTRACT(MONTH FROM bc.bill_date)
            ORDER BY SUM(bc.item_quantity) ASC
        ) AS least_rank
    FROM booking_commercials bc
    JOIN items i ON bc.item_id = i.item_id
    WHERE EXTRACT(YEAR FROM bc.bill_date) = 2021
    GROUP BY month, i.item_name
) t
WHERE most_rank = 1 OR least_rank = 1;

Q5:
SELECT *
FROM (
    SELECT 
        EXTRACT(MONTH FROM bc.bill_date) AS month,
        bc.bill_id,
        SUM(bc.item_quantity * i.item_rate) AS total_bill,
        RANK() OVER (
            PARTITION BY EXTRACT(MONTH FROM bc.bill_date)
            ORDER BY SUM(bc.item_quantity * i.item_rate) DESC
        ) AS rnk
    FROM booking_commercials bc
    JOIN items i ON bc.item_id = i.item_id
    WHERE EXTRACT(YEAR FROM bc.bill_date) = 2021
    GROUP BY month, bc.bill_id
) t
WHERE rnk = 2;
