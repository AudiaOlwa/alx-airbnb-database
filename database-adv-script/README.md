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

```sql
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
