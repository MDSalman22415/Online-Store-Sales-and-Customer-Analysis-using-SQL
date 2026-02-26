---Project Name : Online Store Sales and Customer Analysis System using Sql--- 
---Creating a table ---
CREATE  TABLE customers(
customer_id  INT PRIMARY KEY,
customer_name VARCHAR (40),
email VARCHAR (50),
phone_number VARCHAR (30),
city	VARCHAR (40),
states	VARCHAR (20),
country	 VARCHAR (10),
signup_date DATE,
customer_status	VARCHAR (20),
loyalty_score INT
);


CREATE TABLE products(
product_id	INT PRIMARY KEY,
product_name	VARCHAR (30),
category VARCHAR (20),
brand	VARCHAR (50),
price	NUMERIC (13,5),
stock_quantity INT,
supplier_name	 VARCHAR (40),
rating	NUMERIC (8,4),
created_date DATE,
product_status VARCHAR (20)
);


CREATE TABLE order_items(
order_item_id  INT PRIMARY KEY,
order_id	INT,
product_id	INT,
quantity	INT,
unit_price	NUMERIC (13,4),
discount	INT,
tax_percent	INT,
final_price	NUMERIC (14,5),
warehouse	VARCHAR (20),
dispatch_status VARCHAR (20)
);




CREATE TABLE orders(
order_id	INT PRIMARY KEY,
customer_id INT,
order_date	DATE,
order_status VARCHAR (30),
shipping_address VARCHAR (80),
city   VARCHAR (30),
states VARCHAR (20),
postal_code INT,
shipping_method	VARCHAR (30),
estimated_delivery_days INT
);





CREATE TABLE payments(
payment_id INT PRIMARY KEY,
order_id	INT,
payment_date DATE,
payment_method	 VARCHAR (20),
payment_status	VARCHAR (20),
transaction_amount NUMERIC(20,5),
bank_name	VARCHAR (40),
transaction_reference VARCHAR (50),
refund_status	VARCHAR (20),
currency VARCHAR (20)
);


---CREATING A FOREIGN KEY--
ALTER TABLE orders
ADD CONSTRAINT orders_customer
FOREIGN KEY (customer_id) REFERENCES
customers (customer_id)


ALTER TABLE order_items
ADD CONSTRAINT fk_order_items_orders
FOREIGN KEY (order_id)
REFERENCES orders(order_id);


ALTER TABLE order_items
ADD CONSTRAINT fk_order_items_producuts
FOREIGN KEY (product_id) REFERENCES
products(product_id)


ALTER TABLE payments
ADD CONSTRAINT fk_payments_orders
FOREIGN KEY (order_id) REFERENCES
orders (order_id)















