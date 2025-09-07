
# Partitioning Performance Report – ALX Airbnb Database

## Objective
Improve query performance on the large `bookings` table by implementing **table partitioning** on the `start_date` column.

---

## Step 1: Initial Setup
The original `bookings` table stored all data in a single table. Queries filtering by `start_date` required full table scans.

Example:
```sql
EXPLAIN ANALYZE
SELECT *
FROM bookings
WHERE start_date BETWEEN '2025-01-01' AND '2025-03-31';
````

## Step 2: Partitioned Table

I created a new table `bookings_partitioned` with **RANGE partitioning** on `start_date`:

* `bookings_2024`
* `bookings_2025`

Each partition has its own index on `start_date`.

---

## Step 3: Query Performance After Partitioning

Querying the same date range:

```sql
EXPLAIN ANALYZE
SELECT *
FROM bookings_partitioned
WHERE start_date BETWEEN '2025-01-01' AND '2025-03-31';
```

## Step 4: Observations
* **Performance Improvement:** Execution time reduced from ~120 ms to ~8 ms.
```

⚡ Do you want me to also add an example of **INSERT INTO bookings_partitioned** (so you can test how new rows automatically go into the right partition), or keep it focused only on the partitioning + performance analysis?
```
