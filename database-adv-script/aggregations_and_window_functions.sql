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


-- Rank properties based on the total number of bookings they have received
SELECT 
    p.property_id,                            -- Unique identifier of the property
    p.name AS property_name,                  -- Property name
    COUNT(b.booking_id) AS total_bookings,    -- Total number of bookings for this property
    RANK() OVER (ORDER BY COUNT(b.booking_id) DESC) AS booking_rank
        -- Ranking of properties based on booking count (ties get the same rank)
FROM Property p
LEFT JOIN Booking b ON p.property_id = b.property_id  -- Join properties with their bookings
GROUP BY p.property_id, p.name                        -- Group by property to count bookings
ORDER BY booking_rank;                                -- Order results by rank
