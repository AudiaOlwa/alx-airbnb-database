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


-- Rank properties uniquely based on the total number of bookings
SELECT 
    p.property_id,                            -- Identifiant unique de la propriété
    p.name AS property_name,                  -- Nom de la propriété
    COUNT(b.booking_id) AS total_bookings,    -- Nombre total de réservations pour cette propriété
    ROW_NUMBER() OVER (ORDER BY COUNT(b.booking_id) DESC) AS booking_row_number
        -- Classement unique des propriétés : chaque propriété reçoit un rang distinct
FROM Property p
LEFT JOIN Booking b ON p.property_id = b.property_id
GROUP BY p.property_id, p.name
ORDER BY booking_row_number;
