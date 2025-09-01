-- ==========================================
-- Indexes for User table
-- ==========================================
CREATE INDEX idx_user_email ON User(email);

-- ==========================================
-- Indexes for Booking table
-- ==========================================
CREATE INDEX idx_booking_user_id ON Booking(user_id);
CREATE INDEX idx_booking_property_id ON Booking(property_id);
CREATE INDEX idx_booking_start_date ON Booking(start_date);
CREATE INDEX idx_booking_end_date ON Booking(end_date);

-- ==========================================
-- Indexes for Property table
-- ==========================================
CREATE INDEX idx_property_name ON Property(name);

-- ==========================================
-- Measure query performance before adding indexes
-- ==========================================
EXPLAIN ANALYZE
SELECT * 
FROM Booking b
JOIN User u ON b.user_id = u.user_id
WHERE u.email = 'example@example.com';

-- ==========================================
-- Measure query performance after adding indexes
-- ==========================================
EXPLAIN ANALYZE
SELECT * 
FROM Booking b
JOIN User u ON b.user_id = u.user_id
WHERE u.email = 'example@example.com';
