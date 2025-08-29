# Database Seed – Airbnb Clone

This folder contains SQL scripts to populate the Airbnb clone database with **sample data**.

## Files
- **seed.sql** → Inserts test data into the database.
- **README.md** → Documentation of the dataset.

## Entities and Sample Data
1. **Users**
   - 4 users (Alice, Bob, Charlie, Diana).
   - Each has unique email and phone number.

2. **Properties**
   - 4 properties across different countries.
   - Hosted by different users.

3. **Bookings**
   - Guests book properties with different statuses (`confirmed`, `pending`, `cancelled`).

4. **Payments**
   - Linked to bookings, using multiple payment methods (`credit_card`, `paypal`, `bank_transfer`).

5. **Messages**
   - Users exchange messages (host ↔ guest).

## Usage
1. Ensure the schema is created:
   ```bash
   psql -d airbnb_db -f ../database-script-0x01/schema.sql
