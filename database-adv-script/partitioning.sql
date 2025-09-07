-- Step 1: Create a new partitioned table for bookings based on start_date
-- Drop old partitioned version if exists (safety)
DROP TABLE IF EXISTS bookings_partitioned CASCADE;

-- Create partitioned table
CREATE TABLE bookings_partitioned (
    id SERIAL PRIMARY KEY,
    user_id INT NOT NULL,
    property_id INT NOT NULL,
    start_date DATE NOT NULL,
    end_date DATE NOT NULL,
    status VARCHAR(20)
) PARTITION BY RANGE (start_date);

-- Step 2: Define partitions (by year, can adjust as needed)
CREATE TABLE bookings_2024 PARTITION OF bookings_partitioned
    FOR VALUES FROM ('2024-01-01') TO ('2025-01-01');

CREATE TABLE bookings_2025 PARTITION OF bookings_partitioned
    FOR VALUES FROM ('2025-01-01') TO ('2026-01-01');

-- Step 3: Index partitions for better performance
CREATE INDEX idx_bookings_2024_start_date ON bookings_2024(start_date);
CREATE INDEX idx_bookings_2025_start_date ON bookings_2025(start_date);

-- Performance with EXPLAIN ANALYZE before and after
EXPLAIN ANALYZE
SELECT *
FROM bookings_partitioned
WHERE start_date BETWEEN '2025-01-01' AND '2025-03-31';
