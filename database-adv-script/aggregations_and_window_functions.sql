-- Aggregation:
-- Find the total number of bookings made by each user
SELECT 
    u.id        AS user_id,
    u.first_name,
    u.last_name,
    COUNT(b.id) AS total_bookings
FROM users u
LEFT JOIN bookings b
    ON u.id = b.user_id
GROUP BY u.id, u.first_name, u.last_name
ORDER BY total_bookings DESC;


-- Window functions:
-- Rank properties based on the total number of bookings they have received.
-- Use a CTE to first compute total_bookings per property, then apply window functions.
WITH property_bookings AS (
    SELECT
        p.id   AS property_id,
        p.name AS property_name,
        COUNT(b.id) AS total_bookings
    FROM properties p
    LEFT JOIN bookings b
        ON p.id = b.property_id
    GROUP BY p.id, p.name
)
SELECT
    property_id,
    property_name,
    total_bookings,
    RANK()       OVER (ORDER BY total_bookings DESC) AS booking_rank,
    ROW_NUMBER() OVER (ORDER BY total_bookings DESC) AS booking_row_number
FROM property_bookings
ORDER BY booking_rank;
