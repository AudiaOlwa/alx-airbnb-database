# ER Diagram Requirements — ALX Airbnb Database

This folder contains the ER diagram for the `alx-airbnb-database` project.

## Entities
- **User(user_id PK, first_name, last_name, email UNIQUE, password_hash, phone_number NULL, role ENUM, created_at)**
- **Property(property_id PK, host_id FK→User.user_id, name, description, location, pricepernight, created_at, updated_at)**
- **Booking(booking_id PK, property_id FK→Property.property_id, user_id FK→User.user_id, start_date, end_date, total_price, status ENUM, created_at)**
- **Payment(payment_id PK, booking_id FK→Booking.booking_id, amount, payment_date, payment_method ENUM)**
- **Review(review_id PK, property_id FK→Property.property_id, user_id FK→User.user_id, rating 1..5, comment, created_at)**
- **Message(message_id PK, sender_id FK→User.user_id, recipient_id FK→User.user_id, message_body, sent_at)**

## Relationships & Cardinalities
- User **1:N** Property (host → properties)  
- User **1:N** Booking  
- Property **1:N** Booking  
- Booking **1:N** Payment  
- User **1:N** Review  
- Property **1:N** Review  
- User **1:N** Message (as sender)  
- User **1:N** Message (as recipient)

## Constraints & Indexing
- **UNIQUE**: User.email  
- **CHECK**: Review.rating BETWEEN 1 AND 5  
- **FKs**: host_id, property_id, user_id, booking_id, sender_id, recipient_id  
- **Indexes**: all PKs (auto), plus `User.email`, `Property.property_id`, `Booking.property_id`, `Booking.booking_id`, `Payment.booking_id`


## Notes
- Payments per booking can be 1..N (captures split payments or retries).
- Messages model supports direct user-to-user messaging (sender/recipient).
