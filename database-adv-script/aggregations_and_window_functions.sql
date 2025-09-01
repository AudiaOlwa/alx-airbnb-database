-- Retrieve the total number of bookings made by each user
SELECT 
    u.user_id,                         -- Unique identifier of the user
    u.first_name,                      -- User's first name
    u.last_name,                       -- User's last name
    COUNT(b.booking_id) AS total_bookings  -- Total bookings made by this user
FROM User u
LEFT JOIN Booking b ON u.user_id = b.user_id   -- Join users with their bookings
GROUP BY u.user_id, u.first_name, u.last_name  -- Group by user to count their bookings
ORDER BY total_bookings DESC;                  -- Sort users by total bookings (highest first)

-- ==========================================
-- Window function: Rank properties using RANK()
-- ==========================================
SELECT 
    p.property_id,                            -- Unique identifier of the property
    p.name AS property_name,                  -- Property name
    COUNT(b.booking_id) AS total_bookings,    -- Total number of bookings for this property
    RANK() OVER (ORDER BY COUNT(b.booking_id) DESC) AS booking_rank
        -- Ranking of properties based on total bookings (ties share the same rank)
FROM Property p
LEFT JOIN Booking b ON p.property_id = b.property_id
GROUP BY p.property_id, p.name
ORDER BY booking_rank;

-- ==========================================
-- Window function: Rank properties using ROW_NUMBER()
-- ==========================================
SELECT 
    p.property_id,                            -- Unique identifier of the property
    p.name AS property_name,                  -- Property name
    COUNT(b.booking_id) AS total_bookings,    -- Total number of bookings for this property
    ROW_NUMBER() OVER (ORDER BY COUNT(b.booking_id) DESC) AS booking_row_number
        -- Unique ranking of properties based on total bookings (ties get different ranks)
FROM Property p
LEFT JOIN Booking b ON p.property_id = b.property_id
GROUP BY p.property_id, p.name
ORDER BY booking_row_number;