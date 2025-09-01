# Partitioning Performance Report

## Objective
Optimize queries on the Booking table by implementing table partitioning based on start_date.

## Steps
1. Created a partitioned table `Booking_partitioned` using RANGE partitioning on start_date.
2. Created monthly partitions: Booking_2025_01, Booking_2025_02, Booking_2025_03.
3. Migrated data from the original Booking table into the partitioned table.
4. Tested queries using EXPLAIN ANALYZE.

## Observations
- Queries on specific date ranges only scanned the relevant partitions (query pruning).
- Execution time reduced significantly compared to scanning the entire Booking table.
- Table partitioning is effective for large datasets with frequent date-range queries.

## Recommendations
- Create additional partitions as new months or years are added.
- Consider indexing within partitions for frequently queried columns (e.g., user_id, property_id).
