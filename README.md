E-commerce Database Schema and Queries
This document explains the database structure for a simple e-commerce system and the SQL queries needed to work with the data.

Database Tables
The system has four main tables:

1. Users
id — Unique number for each user

name — User's full name

email — User's email address

password — User's password (stored securely)

role — User role (for example, "admin" or "customer")

2. Products
id — Unique number for each product

name — Name of the product

description — Details about the product

price — Cost of the product

stock — How many items are available

created_at — Date and time the product was added

3. Orders
id — Unique number for each order

user_id — The id of the user who placed the order

total_price — Total cost of the order

status — Current status of the order (for example, "pending", "shipped")

created_at — Date and time when the order was placed

4. Order_Items
id — Unique number for each order item

order_id — The id of the order this item belongs to

product_id — The id of the product

quantity — Number of units ordered

price — Price of the product at the time of order

MySQL Queries
1. Get all products with more than 10 in stock
sql
Copy
Edit
SELECT * FROM Products
WHERE stock > 10;
2. Get all orders placed by a specific user
Replace USER_ID with the actual user's id.

sql
Copy
Edit
SELECT * FROM Orders
WHERE user_id = USER_ID;
3. Update product stock after an order is placed
Replace PRODUCT_ID with the product's id and QUANTITY_ORDERED with the number ordered.

sql
Copy
Edit
UPDATE Products
SET stock = stock - QUANTITY_ORDERED
WHERE id = PRODUCT_ID;
How to Use
Create the tables in your MySQL database with the columns described above.

Use the queries to get product and order information.

Update the stock after orders to keep the product quantities correct.
