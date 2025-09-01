# Database Performance Monitoring Report

## Objective
Continuously monitor and refine database performance by analyzing query execution plans and making schema adjustments.

## Queries Monitored
1. Fetch bookings for a specific user
2. Fetch reviews for a specific property

## Bottlenecks Identified
- Full table scans on User and Review tables
- JOINs on large tables without indexes
- Queries scanning more rows than necessary

## Optimization Steps
1. Added indexes:
   - User(email)
   - Review(property_id)
2. Refactored queries to select only necessary columns
3. Considered table partitioning for Booking table for large datasets

## Results
- Reduced execution time for monitored queries
- Query plans now use indexes (no full table scans)
- Overall database performance improved

## Recommendations
- Continuously monitor new queries as the dataset grows
- Add indexes proactively on frequently queried columns
- Consider partitioning large tables for date-based queries
