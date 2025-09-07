# Query Optimization Report – ALX Airbnb Database

## Objective
Refactor a complex query that retrieves bookings, user details, property details, and payment details to improve performance.

---

## Step 1: Initial Query Analysis
We run the initial query with `EXPLAIN`:

```sql
EXPLAIN
SELECT b.id, b.start_date, b.end_date,
       u.id, u.first_name, u.last_name, u.email,
       p.id, p.name,
       pay.id, pay.amount, pay.payment_date, pay.status
FROM bookings b
JOIN users u ON b.user_id = u.id
JOIN properties p ON b.property_id = p.id
JOIN payments pay ON b.id = pay.booking_id;
```

Step 2: Refactored Query Analysis

We refactor and run with EXPLAIN:

```
EXPLAIN
SELECT b.id, b.start_date, b.end_date,
       u.first_name, u.last_name, u.email,
       p.name AS property_name,
       pay.amount, pay.payment_date
FROM bookings b
INNER JOIN users u ON b.user_id = u.id
```
INNER JOIN properties p ON b.property_id = p.id
LEFT JOIN payments pay ON b.id = pay.booking_id;
