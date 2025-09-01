-- ==========================================
-- Initial Query: Retrieve bookings with user, property, and payment details
-- Includes a WHERE clause for filtering
-- ==========================================
SELECT 
    b.booking_id,
    b.start_date,
    b.end_date,
    u.user_id,
    u.first_name,
    u.last_name,
    u.email,
    p.property_id,
    p.name AS property_name,
    p.address,
    pay.payment_id,
    pay.amount,
    pay.status
FROM Booking b
JOIN User u ON b.user_id = u.user_id
JOIN Property p ON b.property_id = p.property_id
LEFT JOIN Payment pay ON b.booking_id = pay.booking_id
WHERE b.start_date >= '2025-01-01'  -- Filter bookings starting from Jan 1, 2025
  AND pay.status = 'completed';      -- Optional filter to include only completed payments

-- ==========================================
-- Analyze performance using EXPLAIN ANALYZE
-- ==========================================
EXPLAIN ANALYZE
SELECT 
    b.booking_id,
    b.start_date,
    b.end_date,
    u.user_id,
    u.first_name,
    u.last_name,
    u.email,
    p.property_id,
    p.name AS property_name,
    p.address,
    pay.payment_id,
    pay.amount,
    pay.status
FROM Booking b
JOIN User u ON b.user_id = u.user_id
JOIN Property p ON b.property_id = p.property_id
LEFT JOIN Payment pay ON b.booking_id = pay.booking_id;

-- ==========================================
-- Refactored Query: Optimized by selecting only necessary columns
-- ==========================================
SELECT 
    b.booking_id,
    b.start_date,
    b.end_date,
    u.first_name,
    u.last_name,
    u.email,
    p.name AS property_name,
    p.address,
    pay.amount,
    pay.status
FROM Booking b
JOIN User u ON b.user_id = u.user_id
JOIN Property p ON b.property_id = p.property_id
LEFT JOIN Payment pay ON b.booking_id = pay.booking_id;

-- ==========================================
-- Analyze performance of the refactored query
-- ==========================================
EXPLAIN ANALYZE
SELECT 
    b.booking_id,
    b.start_date,
    b.end_date,
    u.first_name,
    u.last_name,
    u.email,
    p.name AS property_name,
    p.address,
    pay.amount,
    pay.status
FROM Booking b
JOIN User u ON b.user_id = u.user_id
JOIN Property p ON b.property_id = p.property_id
LEFT JOIN Payment pay ON b.booking_id = pay.booking_id;
