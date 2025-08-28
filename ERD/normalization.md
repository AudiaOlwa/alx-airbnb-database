# Database Normalization (3NF) – Airbnb Clone

## 1. First Normal Form (1NF)
- All tables have primary keys.
- All attributes contain atomic values.
- No repeating groups or multivalued attributes.
✅ The schema is in 1NF.

## 2. Second Normal Form (2NF)
- The schema is already in 1NF.
- No partial dependency on a composite key (all primary keys are simple, not composite).
- All non-key attributes depend entirely on the primary key of their table.
✅ The schema is in 2NF.

## 3. Third Normal Form (3NF)
- The schema is already in 2NF.
- No transitive dependencies should exist.

### Issue Identified:
- In the **Booking** table, the attribute `total_price` can be derived from:
  - `start_date`
  - `end_date`
  - `Property.price_pernight`

This introduces a transitive dependency because `total_price` does not depend directly on the primary key (`booking_id`), but on other non-key attributes.

### Solution:
- Remove the `total_price` column from the **Booking** table.
- Instead, calculate `total_price` dynamically using:
