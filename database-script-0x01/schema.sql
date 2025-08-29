-- schema.sql
-- Airbnb Clone Database Schema
-- Author: <Ton nom>
-- Description: SQL script to create tables and constraints for the Airbnb database

-- Drop tables if they exist (clean start)
DROP TABLE IF EXISTS messages, payments, bookings, properties, users CASCADE;

-- =====================
-- USERS
-- =====================
CREATE TABLE users (
    user_id SERIAL PRIMARY KEY,
    full_name VARCHAR(100) NOT NULL,
    email VARCHAR(100) UNIQUE NOT NULL,
    phone_number VARCHAR(20) UNIQUE,
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

-- =====================
-- PROPERTIES
-- =====================
CREATE TABLE properties (
    property_id SERIAL PRIMARY KEY,
    host_id INT NOT NULL,
    title VARCHAR(150) NOT NULL,
    description TEXT,
    location VARCHAR(150) NOT NULL,
    price_per_night DECIMAL(10,2) NOT NULL,
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    FOREIGN KEY (host_id) REFERENCES users(user_id) ON DELETE CASCADE
);

-- Index on location for faster search
CREATE INDEX idx_properties_location ON properties(location);

-- =====================
-- BOOKINGS
-- =====================
CREATE TABLE bookings (
    booking_id SERIAL PRIMARY KEY,
    property_id INT NOT NULL,
    guest_id INT NOT NULL,
    start_date DATE NOT NULL,
    end_date DATE NOT NULL,
    status VARCHAR(20) DEFAULT 'pending',
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    FOREIGN KEY (property_id) REFERENCES properties(property_id) ON DELETE CASCADE,
    FOREIGN KEY (guest_id) REFERENCES users(user_id) ON DELETE CASCADE,
    CHECK (end_date > start_date)
);

-- Index on guest and property for faster lookups
CREATE INDEX idx_bookings_guest ON bookings(guest_id);
CREATE INDEX idx_bookings_property ON bookings(property_id);

-- =====================
-- PAYMENTS
-- =====================
CREATE TABLE payments (
    payment_id SERIAL PRIMARY KEY,
    booking_id INT NOT NULL,
    amount DECIMAL(10,2) NOT NULL CHECK (amount >= 0),
    payment_date TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    payment_method VARCHAR(50) NOT NULL,
    FOREIGN KEY (booking_id) REFERENCES bookings(booking_id) ON DELETE CASCADE
);

-- Index on booking_id
CREATE INDEX idx_payments_booking ON payments(booking_id);

-- =====================
-- MESSAGES
-- =====================
CREATE TABLE messages (
    message_id SERIAL PRIMARY KEY,
    sender_id INT NOT NULL,
    receiver_id INT NOT NULL,
    message_body TEXT NOT NULL,
    sent_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    FOREIGN KEY (sender_id) REFERENCES users(user_id) ON DELETE CASCADE,
    FOREIGN KEY (receiver_id) REFERENCES users(user_id) ON DELETE CASCADE
);

-- Index on sender and receiver
CREATE INDEX idx_messages_sender ON messages(sender_id);
CREATE INDEX idx_messages_receiver ON messages(receiver_id);
