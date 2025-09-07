# Index Performance – ALX Airbnb Database

## Objective
Identify and create indexes on high-usage columns in the **User**, **Booking**, and **Property** tables to improve query performance.

---

## Step 1: Identify High-Usage Columns
From our previous queries, the following columns are frequently used in `WHERE`, `JOIN`, and `ORDER BY` clauses:

- **Users**
  - `id` (used in JOINs with `bookings`)
  - `email` (likely used in lookups)
- **Bookings**
  - `id` (primary key, already indexed by default)
  - `user_id` (JOIN with `users`)
  - `property_id` (JOIN with `properties`)
  - `start_date`, `end_date` (used in range filters)
- **Properties**
  - `id` (used in JOINs with `bookings` and `reviews`)
  - `name` (sometimes used in searches)

---

## Step 2: Create Indexes
```sql
-- Users table
CREATE INDEX idx_users_email ON users(email);

-- Bookings table
CREATE INDEX idx_bookings_user_id ON bookings(user_id);
CREATE INDEX idx_bookings_property_id ON bookings(property_id);
CREATE INDEX idx_bookings_start_date ON bookings(start_date);

-- Properties table
CREATE INDEX idx_properties_name ON properties(name);
