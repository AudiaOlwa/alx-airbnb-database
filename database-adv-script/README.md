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
