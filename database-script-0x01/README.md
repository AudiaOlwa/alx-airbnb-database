# Database Schema – Airbnb Clone

This folder contains the SQL script that defines the schema of the Airbnb clone database.

## Files
- **schema.sql** → SQL script that creates all tables, constraints, and indexes.
- **README.md** → Documentation of the schema.

## Entities
1. **Users**
   - Stores information about users (hosts & guests).
   - Unique email and phone number.

2. **Properties**
   - Listings created by hosts.
   - Each property references its host (`host_id → users.user_id`).
   - Index on `location` for faster search.

3. **Bookings**
   - Guests can book properties for a period.
   - References both guest (`users.user_id`) and property (`properties.property_id`).
   - Constraint ensures `end_date > start_date`.

4. **Payments**
   - Linked to bookings.
   - Stores payment amount, method, and date.

5. **Messages**
   - Allows communication between users (sender → receiver).
   - Both foreign keys reference the `users` table.

## Notes
- All foreign keys use `ON DELETE CASCADE` to maintain referential integrity.
- Indexes were added on frequently searched columns (`location`, `guest_id`, `property_id`, `sender_id`, `receiver_id`).
