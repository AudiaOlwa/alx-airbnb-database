# SQL Join Queries Documentation

This document presents three SQL queries demonstrating the use of **JOINS** (INNER JOIN, LEFT JOIN, FULL OUTER JOIN) on the `User`, `Booking`, `Property`, and `Review` tables. Each query is explained with its purpose.

---

## 1. INNER JOIN – Retrieve bookings with their users

```sql
SELECT 
    b.booking_id,
    b.property_id,
    b.start_date,
    b.end_date,
    u.user_id,
    u.first_name,
    u.last_name,
    u.email
FROM Booking b
INNER JOIN User u ON b.user_id = u.user_id;


-------------------------------------------------------------

# SQL Subqueries Documentation

This document presents two SQL queries that demonstrate the use of **subqueries**:
1. A **non-correlated subquery** to filter properties by their average rating.
2. A **correlated subquery** to identify users with more than 3 bookings.

---

## 1. Non-Correlated Subquery – Properties with an Average Rating > 4.0

--sql
SELECT 
    p.property_id,
    p.name AS property_name
FROM Property p
WHERE p.property_id IN (
    SELECT r.property_id
    FROM Review r
    GROUP BY r.property_id
    HAVING AVG(r.rating) > 4.0
); 

-------------------------------------------------------------


# SQL Aggregation and Window Functions Documentation

This document demonstrates two types of SQL queries:  
1. **Aggregation with GROUP BY** using the `COUNT` function.  
2. **Window functions** (`RANK`, `ROW_NUMBER`) to rank results.  

---

## 1. Aggregation with COUNT and GROUP BY – Total bookings per user

--sql
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
