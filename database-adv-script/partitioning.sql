-- File: partitioning.sql
-- Step 1: Create a partitioned Booking table by start_date
CREATE TABLE Booking_partitioned (
    booking_id UUID PRIMARY KEY,
    user_id UUID NOT NULL,
    property_id UUID NOT NULL,
    start_date DATE NOT NULL,
    end_date DATE NOT NULL,
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP
) PARTITION BY RANGE (start_date);

-- Step 2: Create partitions for different date ranges
CREATE TABLE Booking_2025_01 PARTITION OF Booking_partitioned
    FOR VALUES FROM ('2025-01-01') TO ('2025-02-01');

CREATE TABLE Booking_2025_02 PARTITION OF Booking_partitioned
    FOR VALUES FROM ('2025-02-01') TO ('2025-03-01');

CREATE TABLE Booking_2025_03 PARTITION OF Booking_partitioned
    FOR VALUES FROM ('2025-03-01') TO ('2025-04-01');

-- Step 3: Insert data from the original Booking table
INSERT INTO Booking_partitioned (booking_id, user_id, property_id, start_date, end_date, created_at)
SELECT booking_id, user_id, property_id, start_date, end_date, created_at
FROM Booking;


-- Fetch bookings in January 2025
EXPLAIN ANALYZE
SELECT *
FROM Booking_partitioned
WHERE start_date >= '2025-01-01' AND start_date < '2025-02-01';
