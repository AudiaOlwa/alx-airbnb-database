-- ==========================================
-- Measure query performance before adding indexes
-- ==========================================
EXPLAIN ANALYZE
SELECT * 
FROM Booking b
JOIN User u ON b.user_id = u.user_id    -- Join Booking table with User table using user_id
WHERE u.email = 'example@example.com';  -- Filter results to a specific email

-- ==========================================
-- Measure query performance after adding indexes
-- ==========================================
EXPLAIN ANALYZE
SELECT * 
FROM Booking b
JOIN User u ON b.user_id = u.user_id    -- Join Booking table with User table using user_id
WHERE u.email = 'example@example.com';  -- Filter results to a specific email
