-- Initial query: Retrieve all bookings with user, property, and payment details
-- Includes filtering with WHERE and AND to meet requirements
EXPLAIN
SELECT 
    b.id           AS booking_id,
    b.start_date,
    b.end_date,
    u.id           AS user_id,
    u.first_name,
    u.last_name,
    u.email,
    p.id           AS property_id,
    p.name         AS property_name,
    pay.id         AS payment_id,
    pay.amount,
    pay.payment_date,
    pay.status
FROM bookings b
JOIN users u
    ON b.user_id = u.id
JOIN properties p
    ON b.property_id = p.id
JOIN payments pay
    ON b.id = pay.booking_id
WHERE b.start_date >= '2025-01-01'
  AND pay.status = 'completed';


-- Refactored query with improved performance
EXPLAIN
SELECT 
    b.id           AS booking_id,
    b.start_date,
    b.end_date,
    u.first_name,
    u.last_name,
    u.email,
    p.name         AS property_name,
    pay.amount,
    pay.payment_date
FROM bookings b
INNER JOIN users u
    ON b.user_id = u.id
INNER JOIN properties p
    ON b.property_id = p.id
LEFT JOIN payments pay
    ON b.id = pay.booking_id
WHERE b.start_date >= '2025-01-01'
  AND (pay.status = 'completed' OR pay.status IS NULL);
