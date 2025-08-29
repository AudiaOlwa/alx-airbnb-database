-- seed.sql
-- Populate Airbnb Clone database with sample data

-- ================
-- USERS
-- ================
INSERT INTO users (full_name, email, phone_number)
VALUES
('Alice Johnson', 'alice@example.com', '+22991000001'),
('Bob Smith', 'bob@example.com', '+22991000002'),
('Charlie Brown', 'charlie@example.com', '+22991000003'),
('Diana Prince', 'diana@example.com', '+22991000004');

-- ================
-- PROPERTIES
-- ================
INSERT INTO properties (host_id, title, description, location, price_per_night)
VALUES
(1, 'Cozy Apartment in Cotonou', 'A nice 2-bedroom apartment near the beach.', 'Cotonou, Benin', 45.00),
(2, 'Modern Studio in Paris', 'Compact studio perfect for solo travelers.', 'Paris, France', 80.00),
(2, 'Spacious Villa in Lomé', 'Luxury villa with a pool and garden.', 'Lomé, Togo', 150.00),
(3, 'Rustic Cabin in Accra', 'Cabin surrounded by nature, ideal for retreats.', 'Accra, Ghana', 60.00);

-- ================
-- BOOKINGS
-- ================
INSERT INTO bookings (property_id, guest_id, start_date, end_date, status)
VALUES
(1, 2, '2025-09-01', '2025-09-05', 'confirmed'),
(2, 1, '2025-09-10', '2025-09-15', 'pending'),
(3, 4, '2025-09-20', '2025-09-25', 'cancelled'),
(4, 2, '2025-09-28', '2025-10-02', 'confirmed');

-- ================
-- PAYMENTS
-- ================
INSERT INTO payments (booking_id, amount, payment_method)
VALUES
(1, 180.00, 'credit_card'),
(2, 400.00, 'paypal'),
(4, 240.00, 'bank_transfer');

-- ================
-- MESSAGES
-- ================
INSERT INTO messages (sender_id, receiver_id, message_body)
VALUES
(1, 2, 'Hi Bob, I look forward to hosting you in Cotonou!'),
(2, 1, 'Thanks Alice, I’m excited for the stay!'),
(3, 4, 'Hello Diana, your booking has been cancelled as requested.'),
(4, 3, 'Thanks Charlie, understood.');
