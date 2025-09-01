-- ==========================================
-- Initial Query: Retrieve all bookings with user, property, and payment details
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
JOIN User u ON b.user_id = u.user_id    -- Join Booking table with User table
JOIN Property p ON b.property_id = p.property_id  -- Join Booking table with Property table
LEFT JOIN Payment pay ON b.booking_id = pay.booking_id;  -- Left join to include payments if they exist

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
