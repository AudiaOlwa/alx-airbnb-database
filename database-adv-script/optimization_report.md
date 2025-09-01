# Optimization Report

## Initial Query
- Retrieved all bookings with user, property, and payment details.
- Used multiple joins (Booking → User, Booking → Property, Booking → Payment).

## Performance Issues
- Full table scans observed on Booking and Payment tables.
- SELECT * retrieves unnecessary columns, increasing I/O and memory usage.
- JOINs on large tables without indexes are slow.

## Optimization Steps
1. Created indexes:
   - `Booking(user_id)`  -- speeds up join with User table
   - `Booking(property_id)`  -- speeds up join with Property table
   - `Payment(booking_id)`  -- speeds up join with Booking table
2. Refactored query to select only necessary columns (reduced data load).
3. Verified performance improvement using `EXPLAIN ANALYZE`.

## Results
- Execution time reduced significantly.
- PostgreSQL uses indexes for JOINs.
- Query is now more efficient and readable.
