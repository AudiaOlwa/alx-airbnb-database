-- ==========================================
-- Indexes for User table
-- ==========================================

-- Index on email column to speed up searches in WHERE clauses
CREATE INDEX idx_user_email ON User(email);

-- ==========================================
-- Indexes for Booking table
-- ==========================================

-- Index on user_id to optimize JOINs with User table
CREATE INDEX idx_booking_user_id ON Booking(user_id);

-- Index on property_id to optimize JOINs with Property table
CREATE INDEX idx_booking_property_id ON Booking(property_id);

-- Index on start_date to speed up filtering and sorting by start date
CREATE INDEX idx_booking_start_date ON Booking(start_date);

-- Index on end_date to speed up filtering and sorting by end date
CREATE INDEX idx_booking_end_date ON Booking(end_date);

-- ==========================================
-- Indexes for Property table
-- ==========================================

-- Index on name to speed up searches by property name in WHERE clauses
CREATE INDEX idx_property_name ON Property(name);
