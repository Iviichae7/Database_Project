create database sports_shop;
use sports_shop;

-- Dimension Tables

create table datedimension (
    datekey int primary key,
    day tinyint not null,
    month tinyint not null,
    year smallint not null,
    quarter tinyint not null,
    week_number tinyint not null
);

create table itemdimension (
    itemkey int primary key,
    itemname varchar(100) not null,
    category varchar(50),
    brand varchar(50),
    color varchar(20),
    size varchar(15),
    sport_type varchar(50),
    price decimal(10, 2) not null,
    supplierkey int not null,
    index (supplierkey)
);

create table podimension (
    pokey int primary key,
    supplierid int not null,
    orderdate datetime not null,
    expected_delivery_date datetime,
    received_date datetime,
    backorder_flag varchar(10),
    purchase_order_status varchar(50) not null,
    quantity int not null,
    itemkey int not null,
    totalcost decimal(10, 2) not null,
    index (supplierid),
    index (itemkey)
);

create table supplierdimension (
    supplierkey int primary key,
    suppliername varchar(100) not null,
    location varchar(100) not null,
    contact varchar(100),
    contract_start_date date,
    contract_end_date date
);

create table customerdimension (
    customerkey int primary key,
    customername varchar(100) not null,
    location varchar(100) not null,
    customer_since date not null,
    preferred_payment_method varchar(50)
);

-- Fact table
create table factsalesorders (
    orderid int primary key,
    datekey int not null,
    itemkey int not null,
    pokey int not null,
    customerkey int not null,
    quantitysold int not null,
    discount_amount decimal(10, 2) default 0.00,
    shipping_cost decimal(10, 2) default 0.00,
    profit decimal(10, 2) not null,
    totalsales decimal(10, 2) not null,
    sales_channel varchar(50) not null,
    order_status varchar(50) default 'Pending',
    foreign key (datekey) references datedimension(datekey),
    foreign key (itemkey) references itemdimension(itemkey),
    foreign key (pokey) references podimension(pokey),
    foreign key (customerkey) references customerdimension(customerkey),
    index (datekey),
    index (itemkey),
    index (pokey),
    index (customerkey)
);

-- Inserting values into datedimension table
INSERT INTO datedimension (datekey, day, month, year, quarter, week_number)
VALUES
    (1, 5, 11, 2022, 4, 45),
    (2, 12, 3, 2023, 1, 10),
    (3, 25, 6, 2022, 2, 26),
    (4, 9, 9, 2023, 3, 36),
    (5, 18, 12, 2022, 4, 51),
    (6, 2, 2, 2023, 1, 5),
    (7, 20, 7, 2022, 3, 29),
    (8, 14, 5, 2023, 2, 20),
    (9, 30, 10, 2022, 4, 44),
    (10, 8, 1, 2023, 1, 2),
    (11, 16, 8, 2022, 3, 33),
    (12, 3, 4, 2023, 2, 14),
    (13, 22, 11, 2022, 4, 47),
    (14, 10, 12, 2023, 4, 50),
    (15, 29, 1, 2023, 1, 4),
    (16, 7, 10, 2022, 4, 40),
    (17, 17, 9, 2023, 3, 37),
    (18, 5, 7, 2022, 3, 27),
    (19, 12, 6, 2023, 2, 24),
    (20, 25, 12, 2022, 4, 52),
    (21, 8, 2, 2023, 1, 6),
    (22, 30, 7, 2022, 3, 30),
    (23, 19, 5, 2023, 2, 21),
    (24, 6, 11, 2022, 4, 45),
    (25, 11, 1, 2023, 1, 2),
    (26, 23, 10, 2022, 4, 43),
    (27, 4, 4, 2023, 2, 14),
    (28, 14, 9, 2023, 3, 36),
    (29, 27, 3, 2023, 1, 13),
    (30, 15, 7, 2022, 3, 28),
    (31, 9, 6, 2023, 2, 23),
    (32, 21, 12, 2022, 4, 51),
    (33, 3, 3, 2023, 1, 9),
    (34, 31, 8, 2022, 3, 35),
    (35, 16, 4, 2023, 2, 16),
    (36, 24, 11, 2022, 4, 47),
    (37, 2, 2, 2023, 1, 5),
    (38, 28, 10, 2022, 4, 43),
    (39, 1, 5, 2023, 2, 18),
    (40, 18, 7, 2022, 3, 29),
    (41, 10, 6, 2023, 2, 23),
    (42, 26, 12, 2022, 4, 52),
    (43, 4, 3, 2023, 1, 9),
    (44, 2, 9, 2023, 3, 36),
    (45, 22, 7, 2022, 3, 29),
    (46, 17, 5, 2023, 2, 20),
    (47, 5, 11, 2022, 4, 45),
    (48, 12, 1, 2023, 1, 2),
    (49, 30, 10, 2022, 4, 44),
    (50, 9, 4, 2023, 2, 15);

-- Inserting values into itemdimension table
INSERT INTO itemdimension (itemkey, itemname, category, brand, color, size, sport_type, price, supplierkey)
VALUES
    (1, 'Running Shoes', 'Footwear', 'Nike', 'Red', 'P', 'Running', 79.99, 1),
    (2, 'Running Shoes', 'Footwear', 'Nike', 'Red', 'M', 'Running', 79.99, 1),
    (3, 'Running Shoes', 'Footwear', 'Nike', 'Red', 'L', 'Running', 79.99, 1),
    (4, 'Running Shoes', 'Footwear', 'Nike', 'Red', 'XL', 'Running', 79.99, 1),
    (5, 'Running Shoes', 'Footwear', 'Nike', 'Black', 'P', 'Running', 79.99, 1),
    (6, 'Running Shoes', 'Footwear', 'Nike', 'Black', 'M', 'Running', 79.99, 1),
    (7, 'Running Shoes', 'Footwear', 'Nike', 'Black', 'L', 'Running', 79.99, 1),
    (8, 'Running Shoes', 'Footwear', 'Nike', 'Black', 'XL', 'Running', 79.99, 1),
    (9, 'Running Shoes', 'Footwear', 'Nike', 'White', 'P', 'Running', 79.99, 1),
    (10, 'Running Shoes', 'Footwear', 'Nike', 'White', 'M', 'Running', 79.99, 1),
    (11, 'Running Shoes', 'Footwear', 'Nike', 'White', 'L', 'Running', 79.99, 1),
    (12, 'Running Shoes', 'Footwear', 'Nike', 'White', 'XL', 'Running', 79.99, 1),
    (13, 'Gym Shirt', 'Gym Apparel', 'Under Armour', 'Black', 'P', 'Fitness', 34.99, 2),
    (14, 'Gym Shirt', 'Gym Apparel', 'Under Armour', 'Black', 'M', 'Fitness', 34.99, 2),
    (15, 'Gym Shirt', 'Gym Apparel', 'Under Armour', 'Black', 'L', 'Fitness', 34.99, 2),
    (16, 'Gym Shirt', 'Gym Apparel', 'Under Armour', 'Black', 'XL', 'Fitness', 34.99, 2),
    (17, 'Gym Shirt', 'Gym Apparel', 'Under Armour', 'Black', 'XXL', 'Fitness', 34.99, 2),
    (18, 'Gym Shirt', 'Gym Apparel', 'Under Armour', 'Blue', 'P', 'Fitness', 34.99, 2),
    (19, 'Gym Shirt', 'Gym Apparel', 'Under Armour', 'Blue', 'M', 'Fitness', 34.99, 2),
    (20, 'Gym Shirt', 'Gym Apparel', 'Under Armour', 'Blue', 'L', 'Fitness', 34.99, 2),
    (21, 'Gym Shirt', 'Gym Apparel', 'Under Armour', 'Blue', 'XL', 'Fitness', 34.99, 2),
    (22, 'Gym Shirt', 'Gym Apparel', 'Under Armour', 'Blue', 'XXL', 'Fitness', 34.99, 2),
    (23, 'Gym Shirt', 'Gym Apparel', 'Under Armour', 'White', 'P', 'Fitness', 34.99, 2),
    (24, 'Gym Shirt', 'Gym Apparel', 'Under Armour', 'White', 'M', 'Fitness', 34.99, 2),
    (25, 'Gym Shirt', 'Gym Apparel', 'Under Armour', 'White', 'L', 'Fitness', 34.99, 2),
    (26, 'Gym Shirt', 'Gym Apparel', 'Under Armour', 'White', 'XL', 'Fitness', 34.99, 2),
    (27, 'Gym Shirt', 'Gym Apparel', 'Under Armour', 'White', 'XXL', 'Fitness', 34.99, 2),
    (28, 'Nike Shorts', 'Shorts', 'Nike', 'Black', 'S', 'Various', 34.99, 3),
    (29, 'Nike Shorts', 'Shorts', 'Nike', 'Black', 'M', 'Various', 34.99, 3),
    (30, 'Nike Shorts', 'Shorts', 'Nike', 'Black', 'L', 'Various', 34.99, 3),
    (31, 'Nike Shorts', 'Shorts', 'Nike', 'Black', 'XL', 'Various', 34.99, 3),
    (32, 'Nike Shorts', 'Shorts', 'Nike', 'Navy', 'S', 'Various', 34.99, 3),
    (33, 'Nike Shorts', 'Shorts', 'Nike', 'Navy', 'M', 'Various', 34.99, 3),
    (34, 'Nike Shorts', 'Shorts', 'Nike', 'Navy', 'L', 'Various', 34.99, 3),
    (35, 'Nike Shorts', 'Shorts', 'Nike', 'Navy', 'XL', 'Various', 34.99, 3),
    (36, 'Training Jacket', 'Outerwear', 'Adidas', 'Black', 'P', 'Training', 79.99, 4),
    (37, 'Training Jacket', 'Outerwear', 'Adidas', 'Black', 'M', 'Training', 79.99, 4),
    (38, 'Training Jacket', 'Outerwear', 'Adidas', 'Black', 'L', 'Training', 79.99, 4),
    (39, 'Training Jacket', 'Outerwear', 'Adidas', 'Black', 'XL', 'Training', 79.99, 4),
    (40, 'Training Jacket', 'Outerwear', 'Adidas', 'White', 'P', 'Training', 79.99, 4),
    (41, 'Training Jacket', 'Outerwear', 'Adidas', 'White', 'M', 'Training', 79.99, 4),
    (42, 'Training Jacket', 'Outerwear', 'Adidas', 'White', 'L', 'Training', 79.99, 4),
    (43, 'Training Jacket', 'Outerwear', 'Adidas', 'White', 'XL', 'Training', 79.99, 4),
    (44, 'Training Jacket', 'Outerwear', 'Adidas', 'Blue', 'P', 'Training', 79.99, 4),
    (45, 'Training Jacket', 'Outerwear', 'Adidas', 'Blue', 'M', 'Training', 79.99, 4),
    (46, 'Training Jacket', 'Outerwear', 'Adidas', 'Blue', 'L', 'Training', 79.99, 4),
    (47, 'Training Jacket', 'Outerwear', 'Adidas', 'Blue', 'XL', 'Training', 79.99, 4),
    (48, 'Soccer Shoes', 'Footwear', 'Puma', 'Black', 'P', 'Soccer', 69.99, 5),
    (49, 'Soccer Shoes', 'Footwear', 'Puma', 'Black', 'M', 'Soccer', 69.99, 5),
    (50, 'Soccer Shoes', 'Footwear', 'Puma', 'Black', 'L', 'Soccer', 69.99, 5),
    (51, 'Soccer Shoes', 'Footwear', 'Puma', 'Black', 'XL', 'Soccer', 69.99, 5),
    (52, 'Soccer Shoes', 'Footwear', 'Puma', 'Orange', 'P', 'Soccer', 69.99, 5),
    (53, 'Soccer Shoes', 'Footwear', 'Puma', 'Orange', 'M', 'Soccer', 69.99, 5),
    (54, 'Soccer Shoes', 'Footwear', 'Puma', 'Orange', 'L', 'Soccer', 69.99, 5),
    (55, 'Soccer Shoes', 'Footwear', 'Puma', 'Orange', 'XL', 'Soccer', 69.99, 5),
    (56, 'Soccer Shoes', 'Footwear', 'Puma', 'Green', 'P', 'Soccer', 69.99, 5),
    (57, 'Soccer Shoes', 'Footwear', 'Puma', 'Green', 'M', 'Soccer', 69.99, 5),
    (58, 'Soccer Shoes', 'Footwear', 'Puma', 'Green', 'L', 'Soccer', 69.99, 5),
    (59, 'Soccer Shoes', 'Footwear', 'Puma', 'Green', 'XL', 'Soccer', 69.99, 5),
    (60, 'Tracksuit', 'Apparel', 'The North Face', 'Black', 'P', 'Multi-Sport', 129.99, 6),
    (61, 'Tracksuit', 'Apparel', 'The North Face', 'Black', 'M', 'Multi-Sport', 129.99, 6),
    (62, 'Tracksuit', 'Apparel', 'The North Face', 'Black', 'L', 'Multi-Sport', 129.99, 6),
    (63, 'Tracksuit', 'Apparel', 'The North Face', 'Black', 'XL', 'Multi-Sport', 129.99, 6),
    (64, 'Tracksuit', 'Apparel', 'The North Face', 'Dark Blue', 'P', 'Multi-Sport', 129.99, 6),
    (65, 'Tracksuit', 'Apparel', 'The North Face', 'Dark Blue', 'M', 'Multi-Sport', 129.99, 6),
    (66, 'Tracksuit', 'Apparel', 'The North Face', 'Dark Blue', 'L', 'Multi-Sport', 129.99, 6),
    (67, 'Tracksuit', 'Apparel', 'The North Face', 'Dark Blue', 'XL', 'Multi-Sport', 129.99, 6),
    (68, 'Tracksuit', 'Apparel', 'The North Face', 'Grey', 'P', 'Multi-Sport', 129.99, 6),
    (69, 'Tracksuit', 'Apparel', 'The North Face', 'Grey', 'M', 'Multi-Sport', 129.99, 6),
    (70, 'Tracksuit', 'Apparel', 'The North Face', 'Grey', 'L', 'Multi-Sport', 129.99, 6),
    (71, 'Tracksuit', 'Apparel', 'The North Face', 'Grey', 'XL', 'Multi-Sport', 129.99, 6),
    (72, 'Soccer Ball', 'Soccer Equipment', 'Adidas', 'White/Black', 'Size 5', 'Soccer', 24.99, 7),
    (73, 'Basketball', 'Basketball Equipment', 'Spalding', 'Orange', 'Official Size', 'Basketball', 29.99, 7),
    (74, 'Golf Ball Set', 'Golf Equipment', 'Titleist', 'White', 'Standard', 'Golf', 39.99, 7),
    (75, 'Tennis Balls (3-pack)', 'Tennis Equipment', 'Penn', 'Yellow', 'Standard', 'Tennis', 8.99, 7),
    (76, 'Rugby Ball', 'Rugby Equipment', 'Gilbert', 'Brown/White', 'Size 5', 'Rugby', 34.99, 7),
    (77, 'Volleyball', 'Volleyball Equipment', 'Mikasa', 'White', 'Official Size', 'Volleyball', 19.99, 7),
    (78, 'Mountain Bike', 'Cycling Gear', 'Trek', 'Black', 'P', 'Cycling', 899.99, 8),
    (79, 'Mountain Bike', 'Cycling Gear', 'Trek', 'Black', 'M', 'Cycling', 899.99, 8),
    (80, 'Mountain Bike', 'Cycling Gear', 'Trek', 'Black', 'L', 'Cycling', 899.99, 8),
    (81, 'Road Bike', 'Cycling Gear', 'Cannondale', 'Black', 'P', 'Cycling', 1499.99, 8),
    (82, 'Road Bike', 'Cycling Gear', 'Cannondale', 'Black', 'M', 'Cycling', 1499.99, 8),
    (83, 'Road Bike', 'Cycling Gear', 'Cannondale', 'Black', 'L', 'Cycling', 1499.99, 8),
    (84, 'BMX Bike', 'Cycling Gear', 'Mongoose', 'Orange', 'One Size', 'Cycling', 349.99, 8),
    (85, 'Electric Bike', 'Cycling Gear', 'Rad Power Bikes', 'White', 'One Size', 'Cycling', 1899.99, 8),
    (86, 'Pro Tennis Racket', 'Tennis Equipment', 'Head', 'Black', 'One Size', 'Tennis', 179.99, 9),
    (87, 'Pro Tennis Racket', 'Tennis Equipment', 'Head', 'White', 'One Size', 'Tennis', 179.99, 9),
    (88, 'Junior Tennis Racket', 'Tennis Equipment', 'Babolat', 'Yellow', 'Junior', 'Tennis', 69.99, 9),
    (89, 'Junior Tennis Racket', 'Tennis Equipment', 'Babolat', 'Blue', 'Junior', 'Tennis', 69.99, 9),
    (90, 'Beginner Tennis Racket', 'Tennis Equipment', 'Prince', 'Blue', 'One Size', 'Tennis', 49.99, 9),
    (91, 'Beginner Tennis Racket', 'Tennis Equipment', 'Prince', 'Green', 'One Size', 'Tennis', 49.99, 9),
    (92, 'Professional Tennis Racket', 'Tennis Equipment', 'Wilson', 'White', 'One Size', 'Tennis', 249.99, 9),
    (93, 'Ankle Socks (3-pack)', 'Footwear', 'Nike', 'White', 'One Size', 'Various', 14.99, 10),
    (94, 'Ankle Socks (3-pack)', 'Footwear', 'Nike', 'Black', 'One Size', 'Various', 14.99, 10),
    (95, 'Crew Socks (2-pack)', 'Footwear', 'Adidas', 'White', 'One Size', 'Various', 9.99, 10),
    (96, 'Crew Socks (2-pack)', 'Footwear', 'Adidas', 'Black', 'One Size', 'Various', 9.99, 10),
    (97, 'Compression Socks', 'Footwear', 'Under Armour', 'White', 'One Size', 'Various', 19.99, 10),
    (98, 'Compression Socks', 'Footwear', 'Under Armour', 'Gray', 'One Size', 'Various', 19.99, 103),
    (99, 'Athletic Low Cut Socks (6-pack)', 'Footwear', 'Puma', 'Assorted', 'One Size', 'Various', 24.99, 10),
    (100, 'Athletic Low Cut Socks (6-pack)', 'Footwear', 'Puma', 'Assorted', 'One Size', 'Various', 24.99, 10);

-- Inserting values into podimension table
INSERT INTO podimension (pokey, supplierid, orderdate, expected_delivery_date, received_date, backorder_flag, purchase_order_status, quantity, itemkey, totalcost)
VALUES
    (1, 1, '2023-11-28', '2023-12-10', '2023-12-09', 'No', 'Delivered', 50, 1, 3999.50),
    (2, 1, '2023-11-29', '2023-12-11', '2023-12-10', 'No', 'Delivered', 75, 2, 5999.25),
    (3, 1, '2023-11-30', '2023-12-12', '2023-12-11', 'No', 'Delivered', 30, 3, 2399.70),
    (4, 1, '2023-12-01', '2023-12-13', '2023-12-12', 'No', 'Delivered', 20, 4, 1599.80),
    (5, 1, '2023-12-02', '2023-12-14', '2023-12-13', 'No', 'Delivered', 60, 5, 4799.40),
    (6, 1, '2023-12-03', '2023-12-15', '2023-12-14', 'No', 'Delivered', 90, 6, 7199.10),
    (7, 1, '2023-12-04', '2023-12-16', '2023-12-15', 'No', 'Delivered', 40, 7, 3199.60),
    (8, 1, '2023-12-05', '2023-12-17', '2023-12-16', 'No', 'Delivered', 25, 8, 1999.75),
    (9, 1, '2023-12-06', '2023-12-18', '2023-12-17', 'No', 'Delivered', 55, 9, 4399.45),
    (10, 1, '2023-12-07', '2023-12-19', '2023-12-18', 'No', 'Delivered', 80, 10, 6399.20),
    (11, 1, '2023-12-08', '2023-12-20', '2023-12-19', 'No', 'Delivered', 35, 11, 2799.65),
    (12, 1, '2023-12-09', '2023-12-21', '2023-12-20', 'No', 'Delivered', 15, 12, 1199.85),
    (13, 2, '2023-12-10', '2023-12-22', '2023-12-21', 'No', 'Delivered', 50, 13, 1749.50),
    (14, 2, '2023-12-11', '2023-12-23', '2023-12-22', 'No', 'Delivered', 75, 14, 2624.25),
    (15, 2, '2023-12-12', '2023-12-24', '2023-12-23', 'No', 'Delivered', 30, 15, 1049.70),
    (16, 2, '2023-12-13', '2023-12-25', '2023-12-24', 'No', 'Delivered', 20, 16, 699.80),
    (17, 2, '2023-12-14', '2023-12-26', '2023-12-25', 'No', 'Delivered', 10, 17, 349.90),
    (18, 2, '2023-12-15', '2023-12-27', '2023-12-26', 'No', 'Delivered', 60, 18, 2099.40),
    (19, 2, '2023-12-16', '2023-12-28', '2023-12-27', 'No', 'Delivered', 90, 19, 3149.10),
    (20, 2, '2023-12-17', '2023-12-29', '2023-12-28', 'No', 'Delivered', 40, 20, 1399.60),
    (21, 2, '2023-12-18', '2023-12-30', '2023-12-29', 'No', 'Delivered', 25, 21, 874.75),
    (22, 2, '2023-11-28', '2023-12-10', '2023-12-09', 'No', 'Delivered', 15, 22, 524.85),
    (23, 2, '2023-11-29', '2023-12-11', '2023-12-10', 'No', 'Delivered', 55, 23, 1924.45),
    (24, 2, '2023-11-30', '2023-12-12', '2023-12-11', 'No', 'Delivered', 80, 24, 2799.20),
    (25, 2, '2023-12-01', '2023-12-13', '2023-12-12', 'No', 'Delivered', 35, 25, 1224.65),
    (26, 2, '2023-12-02', '2023-12-14', '2023-12-13', 'No', 'Delivered', 10, 26, 349.90),
    (27, 2, '2023-12-03', '2023-12-15', '2023-12-14', 'No', 'Delivered', 5, 27, 174.95),
    (28, 3, '2023-12-04', '2023-12-16', '2023-12-15', 'No', 'Delivered', 50, 28, 1749.50),
    (29, 3, '2023-12-05', '2023-12-17', '2023-12-16', 'No', 'Delivered', 75, 29, 2624.25),
    (30, 3, '2023-12-06', '2023-12-18', '2023-12-17', 'No', 'Delivered', 30, 30, 1049.70),
    (31, 3, '2023-12-07', '2023-12-19', '2023-12-18', 'No', 'Delivered', 20, 31, 699.80),
    (32, 3, '2023-12-08', '2023-12-20', '2023-12-19', 'No', 'Delivered', 60, 32, 2099.40),
    (33, 3, '2023-12-09', '2023-12-21', '2023-12-20', 'No', 'Delivered', 90, 33, 3149.10),
    (34, 3, '2023-12-10', '2023-12-22', '2023-12-21', 'No', 'Delivered', 40, 34, 1399.60),
    (35, 3, '2023-12-11', '2023-12-23', '2023-12-22', 'No', 'Delivered', 25, 35, 874.75),
    (36, 4, '2023-12-05', '2023-12-20', '2023-12-19', 'No', 'Delivered', 50, 36, 3999.50),
    (37, 4, '2023-12-05', '2023-12-20', '2023-12-19', 'No', 'Delivered', 75, 37, 5999.25),
    (38, 4, '2023-12-06', '2023-12-21', '2023-12-20', 'No', 'Delivered', 30, 38, 2399.70),
    (39, 4, '2023-12-06', '2023-12-21', '2023-12-20', 'No', 'Delivered', 20, 39, 1599.80),
    (40, 4, '2023-12-07', '2023-12-22', '2023-12-21', 'No', 'Delivered', 60, 40, 4799.40),
    (41, 4, '2023-12-07', '2023-12-22', '2023-12-21', 'No', 'Delivered', 90, 41, 7199.10),
    (42, 4, '2023-12-08', '2023-12-23', '2023-12-22', 'No', 'Delivered', 40, 42, 3199.60),
    (43, 4, '2023-12-08', '2023-12-23', '2023-12-22', 'No', 'Delivered', 25, 43, 1999.75),
    (44, 4, '2023-12-09', '2023-12-24', '2023-12-23', 'No', 'Delivered', 55, 44, 4399.45),
    (45, 4, '2023-12-09', '2023-12-24', '2023-12-23', 'No', 'Delivered', 80, 45, 6399.20),
    (46, 4, '2023-12-10', '2023-12-25', '2023-12-24', 'No', 'Delivered', 35, 46, 2799.65),
    (47, 4, '2023-12-10', '2023-12-25', '2023-12-24', 'No', 'Delivered', 15, 47, 1199.85),
    (48, 5, '2023-12-01', '2023-12-18', '2023-12-17', 'No', 'Delivered', 50, 48, 3499.50),
    (49, 5, '2023-12-02', '2023-12-19', '2023-12-18', 'No', 'Delivered', 75, 49, 5249.25),
    (50, 5, '2023-12-03', '2023-12-20', '2023-12-19', 'No', 'Delivered', 30, 50, 2099.70),
    (51, 5, '2023-12-04', '2023-12-21', '2023-12-20', 'No', 'Delivered', 20, 51, 1399.80),
    (52, 5, '2023-12-05', '2023-12-22', '2023-12-21', 'No', 'Delivered', 60, 52, 4199.40),
    (53, 5, '2023-12-06', '2023-12-23', '2023-12-22', 'No', 'Delivered', 90, 53, 6299.10),
    (54, 5, '2023-12-07', '2023-12-24', '2023-12-23', 'No', 'Delivered', 40, 54, 2799.60),
    (55, 5, '2023-12-08', '2023-12-25', '2023-12-24', 'No', 'Delivered', 25, 55, 1749.75),
    (56, 5, '2023-12-09', '2023-12-26', '2023-12-25', 'No', 'Delivered', 55, 56, 3849.45),
    (57, 5, '2023-12-10', '2023-12-27', '2023-12-26', 'No', 'Delivered', 80, 57, 5599.20),
    (58, 5, '2023-12-11', '2023-12-28', '2023-12-27', 'No', 'Delivered', 35, 58, 2449.65),
    (59, 5, '2023-12-12', '2023-12-29', '2023-12-28', 'No', 'Delivered', 15, 59, 1049.85),
    (60, 6, '2023-12-02', '2023-12-21', '2023-12-20', 'No', 'Delivered', 50, 60, 6499.50),
    (61, 6, '2023-12-03', '2023-12-22', '2023-12-21', 'No', 'Delivered', 75, 61, 9749.25),
    (62, 6, '2023-12-04', '2023-12-23', '2023-12-22', 'No', 'Delivered', 30, 62, 3899.70),
    (63, 6, '2023-12-05', '2023-12-24', '2023-12-23', 'No', 'Delivered', 20, 63, 2599.80),
    (64, 6, '2023-12-06', '2023-12-25', '2023-12-24', 'No', 'Delivered', 60, 64, 7799.40),
    (65, 6, '2023-12-07', '2023-12-26', '2023-12-25', 'No', 'Delivered', 90, 65, 11699.10),
    (66, 6, '2023-12-08', '2023-12-27', '2023-12-26', 'No', 'Delivered', 40, 66, 5199.60),
    (67, 6, '2023-12-09', '2023-12-28', '2023-12-27', 'No', 'Delivered', 25, 67, 3249.75),
    (68, 6, '2023-12-10', '2023-12-29', '2023-12-28', 'No', 'Delivered', 55, 68, 7149.45),
    (69, 6, '2023-12-11', '2023-12-30', '2023-12-29', 'No', 'Delivered', 80, 69, 10399.20),
    (70, 6, '2023-12-12', '2023-12-31', '2023-12-30', 'No', 'Delivered', 35, 70, 4549.65),
    (71, 6, '2023-12-13', '2024-01-01', '2023-12-31', 'No', 'Delivered', 15, 71, 1949.85),
    (72, 7, '2023-12-14', '2023-12-31', '2023-12-30', 'No', 'Delivered', 50, 72, 1249.50),
    (73, 7, '2023-12-15', '2024-01-01', '2023-12-31', 'No', 'Delivered', 25, 73, 749.75),
    (74, 7, '2023-12-16', '2024-01-02', '2024-01-01', 'No', 'Delivered', 40, 74, 1599.60),
    (75, 7, '2023-12-17', '2024-01-03', '2024-01-02', 'No', 'Delivered', 100, 75, 899.00),
    (76, 7, '2023-12-18', '2024-01-04', '2024-01-03', 'No', 'Delivered', 30, 76, 1049.70),
    (77, 7, '2023-12-19', '2024-01-05', '2024-01-04', 'No', 'Delivered', 70, 77, 1399.30),
    (78, 8, '2023-12-20', '2024-01-06', '2024-01-05', 'No', 'Delivered', 50, 78, 44999.50),
    (79, 8, '2023-12-21', '2024-01-07', '2024-01-06', 'No', 'Delivered', 25, 79, 22499.75),
    (80, 8, '2023-12-22', '2024-01-08', '2024-01-07', 'No', 'Delivered', 40, 80, 35999.60),
    (81, 8, '2023-12-23', '2024-01-09', '2024-01-08', 'No', 'Delivered', 100, 81, 14999.00),
    (82, 8, '2023-12-24', '2024-01-10', '2024-01-09', 'No', 'Delivered', 30, 82, 4499.70),
    (83, 8, '2023-12-25', '2024-01-11', '2024-01-10', 'No', 'Delivered', 70, 83, 10499.30),
    (84, 8, '2023-12-26', '2024-01-12', '2024-01-11', 'No', 'Delivered', 50, 84, 17499.50),
    (85, 8, '2023-12-27', '2024-01-13', '2024-01-12', 'No', 'Delivered', 15, 85, 28499.85),
    (86, 9, '2023-12-28', '2024-01-14', '2024-01-13', 'No', 'Delivered', 50, 86, 8999.50),
    (87, 9, '2023-12-29', '2024-01-15', '2024-01-14', 'No', 'Delivered', 25, 87, 4499.75),
    (88, 9, '2023-12-30', '2024-01-16', '2024-01-15', 'No', 'Delivered', 40, 88, 2799.60),
    (89, 9, '2023-12-31', '2024-01-17', '2024-01-16', 'No', 'Delivered', 100, 89, 6999.00),
    (90, 9, '2024-01-01', '2024-01-18', '2024-01-17', 'No', 'Delivered', 30, 90, 1499.70),
    (91, 9, '2024-01-02', '2024-01-19', '2024-01-18', 'No', 'Delivered', 70, 91, 3499.30),
    (92, 9, '2024-01-03', '2024-01-20', '2024-01-19', 'No', 'Delivered', 50, 92, 12499.50),
    (93, 10, '2024-01-04', '2024-01-21', '2024-01-20', 'No', 'Delivered', 50, 93, 749.50),
    (94, 10, '2024-01-05', '2024-01-22', '2024-01-21', 'No', 'Delivered', 25, 94, 374.75),
    (95, 10, '2024-01-06', '2024-01-23', '2024-01-22', 'No', 'Delivered', 40, 95, 399.60),
    (96, 10, '2024-01-07', '2024-01-24', '2024-01-23', 'No', 'Delivered', 100, 96, 999.00),
    (97, 10, '2024-01-08', '2024-01-25', '2024-01-24', 'No', 'Delivered', 30, 97, 599.70),
    (98, 103, '2024-01-09', '2024-01-26', '2024-01-25', 'No', 'Delivered', 70, 98, 1399.30),
    (99, 10, '2024-01-10', '2024-01-27', '2024-01-26', 'No', 'Delivered', 50, 99, 1249.50),
    (100, 10, '2024-01-11', '2024-01-28', '2024-01-27', 'No', 'Delivered', 15, 100, 374.85);
    
-- Inserting values into supplierdimension table
INSERT INTO supplierdimension (supplierkey, suppliername, location, contact, contract_start_date, contract_end_date)
VALUES
    (1, 'Sports World', 'Dublin, Ireland', '+353 1 123 4567', '2022-01-01', '2023-12-31'),
    (2, 'Fitness Pro Ireland', 'Cork, Ireland', '+353 21 987 6543', '2022-02-15', '2024-02-14'),
    (3, 'Active Gear Co.', 'Galway, Ireland', '+353 91 246 8024', '2021-12-05', '2023-12-04'),
    (4, 'Outdoor Sports Ltd.', 'Limerick, Ireland', '+353 61 333 7890', '2022-03-20', '2023-03-19'),
    (5, 'Athletic Supplies Ireland', 'Waterford, Ireland', '+353 51 555 1234', '2022-04-10', '2024-04-09'),
    (6, 'Playground Fitness', 'Drogheda, Ireland', '+353 41 777 8888', '2022-05-25', '2023-05-24'),
    (7, 'Sports Emporium', 'Dundalk, Ireland', '+353 42 654 3210', '2022-06-15', '2023-06-14'),
    (8, 'Irish Sports Gear Co.', 'Sligo, Ireland', '+353 71 111 2222', '2022-07-30', '2023-07-29'),
    (9, 'Fitness Equipment Ireland', 'Kilkenny, Ireland', '+353 56 987 6543', '2022-08-12', '2024-08-11'),
    (10, 'Extreme Sports Ireland', 'Tralee, Ireland', '+353 66 333 1111', '2022-09-28', '2023-09-27');

-- Inserting values into customerdimension table
INSERT INTO customerdimension (customerkey, customername, location, customer_since, preferred_payment_method)
VALUES
    (1, 'Sarah Murphy', 'Cork, Ireland', '1995-08-10', 'Bank Transfer'),
    (2, 'Michael Kelly', 'Galway, Ireland', '1992-04-25', 'Credit Card'),
    (3, 'Emma OSullivan', 'Limerick, Ireland', '1998-11-15', 'PayPal'),
    (4, 'David Byrne', 'Waterford, Ireland', '1990-09-30', 'Credit Card'),
    (5, 'Aoife Ryan', 'Drogheda, Ireland', '1993-12-18', 'Bank Transfer'),
    (6, 'Paula Walsh', 'Dundalk, Ireland', '1997-06-05', 'Credit Card'),
    (7, 'Mark ONeill', 'Sligo, Ireland', '1994-02-20', 'PayPal'),
    (8, 'Sean McCarthy', 'Kilkenny, Ireland', '1996-10-12', 'Credit Card'),
    (9, 'Ciara Byrne', 'Tralee, Ireland', '1991-07-28', 'Bank Transfer'),
    (10, 'Padraig Murphy', 'Dublin, Ireland', '1999-03-08', 'Credit Card'),
    (11, 'Eoin Flynn', 'Wexford, Ireland', '1994-09-14', 'Bank Transfer'),
    (12, 'Aisling Brennan', 'Ennis, Ireland', '1996-12-30', 'Credit Card'),
    (13, 'Cian OConnor', 'Letterkenny, Ireland', '1992-05-25', 'PayPal'),
    (14, 'Niamh Hogan', 'Athlone, Ireland', '1998-02-11', 'Credit Card'),
    (15, 'Brendan Burke', 'Killarney, Ireland', '1993-10-08', 'Bank Transfer'),
    (16, 'Fiona Murray', 'Cavan, Ireland', '1997-11-22', 'Credit Card'),
    (17, 'Darragh Dunne', 'Kildare, Ireland', '1990-08-03', 'PayPal'),
    (18, 'Sinead OReilly', 'Mullingar, Ireland', '1995-04-19', 'Credit Card'),
    (19, 'Pádraigín MacCarthy', 'Clonmel, Ireland', '1996-06-15', 'Bank Transfer'),
    (20, 'Conor OSullivan', 'Donegal, Ireland', '1999-01-04', 'Credit Card'),
    (21, 'Orlaith Connolly', 'Louth, Ireland', '1991-07-28', 'Bank Transfer'),
    (22, 'Tadhg Brennan', 'Mayo, Ireland', '1994-02-20', 'Credit Card'),
    (23, 'Maeve ODonnell', 'Wicklow, Ireland', '1998-11-15', 'PayPal'),
    (24, 'Gearóid Kelly', 'Meath, Ireland', '1990-09-30', 'Credit Card'),
    (25, 'Saoirse Byrne', 'Monaghan, Ireland', '1993-12-18', 'Bank Transfer'),
    (26, 'Caoimhe Duffy', 'Kerry, Ireland', '1997-06-05', 'Credit Card'),
    (27, 'Liam Murphy', 'Antrim, Ireland', '1994-02-20', 'PayPal'),
    (28, 'Aoibhín Flynn', 'Armagh, Ireland', '1996-10-12', 'Credit Card'),
    (29, 'Declan ONeill', 'Derry, Ireland', '1991-07-28', 'Bank Transfer'),
    (30, 'Róisín OReilly', 'Fermanagh, Ireland', '1999-03-08', 'Credit Card'),
    (31, 'Seamus Gallagher', 'Tyrone, Ireland', '1995-08-10', 'Bank Transfer'),
    (32, 'Gráinne OSullivan', 'Down, Ireland', '1992-04-25', 'Credit Card'),
    (33, 'Fionnuala Kelly', 'Dublin, Ireland', '1998-11-15', 'PayPal'),
    (34, 'Dónal Byrne', 'Galway, Ireland', '1990-09-30', 'Credit Card'),
    (35, 'Aodhán Walsh', 'Cork, Ireland', '1993-12-18', 'Bank Transfer'),
    (36, 'Sorcha ONeill', 'Limerick, Ireland', '1997-06-05', 'Credit Card'),
    (37, 'Cathal Brennan', 'Waterford, Ireland', '1994-02-20', 'PayPal'),
    (38, 'Muireann Murphy', 'Drogheda, Ireland', '1996-10-12', 'Credit Card'),
    (39, 'Niall OConnor', 'Dundalk, Ireland', '1991-07-28', 'Bank Transfer'),
    (40, 'Siobhán Flynn', 'Sligo, Ireland', '1999-03-08', 'Credit Card'),
    (41, 'Eoghan McCarthy', 'Kilkenny, Ireland', '1995-08-10', 'Bank Transfer'),
    (42, 'Róisín Byrne', 'Tralee, Ireland', '1992-04-25', 'Credit Card'),
    (43, 'Dara Murphy', 'Dublin, Ireland', '1998-11-15', 'PayPal'),
    (44, 'Laoise Kelly', 'Wexford, Ireland', '1990-09-30', 'Credit Card'),
    (45, 'Ciarán Brennan', 'Ennis, Ireland', '1993-12-18', 'Bank Transfer'),
    (46, 'Ailbhe OConnor', 'Letterkenny, Ireland', '1997-06-05', 'Credit Card'),
    (47, 'Eimear Hogan', 'Athlone, Ireland', '1994-02-20', 'PayPal'),
    (48, 'Colm Burke', 'Killarney, Ireland', '1996-10-12', 'Credit Card'),
    (49, 'Mairead Murray', 'Cavan, Ireland', '1991-07-28', 'Bank Transfer'),
    (50, 'Lorcan Dunne', 'Kildare, Ireland', '1999-03-08', 'Credit Card');

-- Inserting values into factsalesorders table (assuming some placeholder values)
INSERT INTO factsalesorders (
    orderid, datekey, itemkey, pokey, customerkey, quantitysold,
    discount_amount, shipping_cost, profit, totalsales,
    sales_channel, order_status
)
VALUES
    (1, 1, 1, 1, 1, 5, 10.00, 5.00, 15.00, 100.00, 'Online', 'Completed'),
    (2, 2, 2, 2, 2, 10, 15.00, 7.50, 22.50, 200.00, 'In-store', 'Shipped'),
    (3, 3, 3, 3, 3, 8, 12.00, 6.00, 18.00, 150.00, 'Online', 'Processing'),
    (4, 4, 4, 4, 4, 15, 20.00, 10.00, 30.00, 300.00, 'Online', 'Completed'),
    (5, 5, 5, 5, 5, 20, 25.00, 12.50, 37.50, 250.00, 'In-store', 'Shipped'),
    (6, 6, 6, 6, 6, 12, 18.00, 9.00, 27.00, 180.00, 'Online', 'Processing'),
    (7, 7, 7, 7, 7, 18, 22.00, 11.00, 33.00, 350.00, 'Online', 'Completed'),
    (8, 8, 8, 8, 8, 25, 30.00, 15.00, 45.00, 400.00, 'In-store', 'Shipped'),
    (9, 9, 9, 9, 9, 7, 8.00, 4.00, 12.00, 120.00, 'Online', 'Processing'),
    (10, 10, 10, 10, 10, 30, 35.00, 17.50, 52.50, 280.00, 'In-store', 'Completed'),
    (11, 11, 11, 11, 11, 6, 11.00, 5.50, 16.50, 110.00, 'Online', 'Completed'),
    (12, 12, 12, 12, 12, 11, 16.00, 8.00, 24.00, 220.00, 'In-store', 'Shipped'),
    (13, 13, 13, 13, 13, 9, 13.00, 6.50, 19.50, 165.00, 'Online', 'Processing'),
    (14, 14, 14, 14, 14, 16, 21.00, 10.50, 31.50, 320.00, 'Online', 'Completed'),
    (15, 15, 15, 15, 15, 21, 26.00, 13.00, 39.00, 270.00, 'In-store', 'Shipped'),
    (16, 16, 16, 16, 16, 13, 19.00, 9.50, 28.50, 190.00, 'Online', 'Processing'),
    (17, 17, 17, 17, 17, 9, 23.00, 11.50, 34.50, 370.00, 'Online', 'Completed'),
    (18, 18, 18, 18, 18, 26, 31.00, 15.50, 46.50, 420.00, 'In-store', 'Shipped'),
    (19, 19, 19, 19, 19, 8, 9.00, 4.50, 13.50, 130.00, 'Online', 'Processing'),
    (20, 20, 20, 20, 20, 31, 36.00, 18.00, 54.00, 290.00, 'In-store', 'Completed'),
    (21, 21, 21, 21, 21, 12, 22.00, 11.00, 33.00, 115.00, 'Online', 'Completed'),
    (22, 22, 22, 22, 22, 13, 17.00, 8.50, 25.50, 230.00, 'In-store', 'Shipped'),
    (23, 23, 23, 23, 23, 14, 14.00, 7.00, 21.00, 175.00, 'Online', 'Processing'),
    (24, 24, 24, 24, 24, 15, 19.00, 9.50, 28.50, 315.00, 'Online', 'Completed'),
    (25, 25, 25, 25, 25, 16, 24.00, 12.00, 36.00, 265.00, 'In-store', 'Shipped'),
    (26, 26, 26, 26, 26, 9, 18.00, 9.00, 27.00, 195.00, 'Online', 'Processing'),
    (27, 27, 27, 27, 27, 5, 23.00, 11.50, 34.50, 375.00, 'Online', 'Completed'),
    (28, 28, 28, 28, 28, 19, 28.00, 14.00, 42.00, 425.00, 'In-store', 'Shipped'),
    (29, 29, 29, 29, 29, 20, 29.00, 14.50, 43.50, 135.00, 'Online', 'Processing'),
    (30, 30, 30, 30, 30, 21, 30.00, 15.00, 45.00, 290.00, 'In-store', 'Completed'),
    (31, 31, 31, 31, 31, 19, 31.00, 15.50, 46.50, 125.00, 'Online', 'Completed'),
    (32, 32, 32, 32, 32, 23, 32.00, 16.00, 48.00, 240.00, 'In-store', 'Shipped'),
    (33, 33, 33, 33, 33, 24, 33.00, 16.50, 49.50, 185.00, 'Online', 'Processing'),
    (34, 34, 34, 34, 34, 25, 34.00, 17.00, 51.00, 315.00, 'Online', 'Completed'),
    (35, 35, 35, 35, 35, 25, 35.00, 17.50, 52.50, 265.00, 'In-store', 'Shipped'),
    (36, 36, 36, 36, 36, 27, 36.00, 18.00, 54.00, 195.00, 'Online', 'Processing'),
    (37, 37, 37, 37, 37, 28, 37.00, 18.50, 55.50, 375.00, 'Online', 'Completed'),
    (38, 38, 38, 38, 38, 29, 38.00, 19.00, 57.00, 425.00, 'In-store', 'Shipped'),
    (39, 39, 39, 39, 39, 19, 39.00, 19.50, 58.50, 135.00, 'Online', 'Processing'),
    (40, 40, 40, 40, 40, 31, 40.00, 20.00, 60.00, 290.00, 'In-store', 'Completed'),
    (41, 41, 41, 41, 41, 5, 9.00, 4.50, 13.50, 110.00, 'Online', 'Completed'),
    (42, 42, 42, 42, 42, 10, 14.00, 7.00, 21.00, 220.00, 'In-store', 'Shipped'),
    (43, 43, 43, 43, 43, 8, 11.00, 5.50, 16.50, 165.00, 'Online', 'Processing'),
    (44, 44, 44, 44, 44, 15, 19.00, 9.50, 28.50, 320.00, 'Online', 'Completed'),
    (45, 45, 45, 45, 45, 20, 25.00, 12.50, 37.50, 250.00, 'In-store', 'Shipped'),
    (46, 46, 46, 46, 46, 12, 18.00, 9.00, 27.00, 180.00, 'Online', 'Processing'),
    (47, 47, 47, 47, 47, 14, 22.00, 11.00, 33.00, 350.00, 'Online', 'Completed'),
    (48, 48, 48, 48, 48, 25, 30.00, 15.00, 45.00, 400.00, 'In-store', 'Shipped'),
    (49, 49, 49, 49, 49, 7, 8.00, 4.00, 12.00, 120.00, 'Online', 'Processing'),
    (50, 50, 50, 50, 50, 30, 35.00, 17.50, 52.50, 280.00, 'In-store', 'Completed'),
    (51, 1, 51, 51, 1, 5, 10.00, 5.00, 15.00, 100.00, 'Online', 'Completed'),
    (52, 2, 52, 52, 2, 10, 15.00, 7.50, 22.50, 200.00, 'In-store', 'Shipped'),
    (53, 3, 53, 53, 3, 8, 12.00, 6.00, 18.00, 150.00, 'Online', 'Processing'),
    (54, 4, 54, 54, 4, 15, 20.00, 10.00, 30.00, 300.00, 'Online', 'Completed'),
    (55, 5, 55, 55, 5, 20, 25.00, 12.50, 37.50, 250.00, 'In-store', 'Shipped'),
    (56, 6, 56, 56, 6, 12, 18.00, 9.00, 27.00, 180.00, 'Online', 'Processing'),
    (57, 7, 57, 57, 7, 18, 22.00, 11.00, 33.00, 350.00, 'Online', 'Completed'),
    (58, 8, 58, 58, 8, 25, 30.00, 15.00, 45.00, 400.00, 'In-store', 'Shipped'),
    (59, 9, 59, 59, 9, 7, 8.00, 4.00, 12.00, 120.00, 'Online', 'Processing'),
    (60, 10, 60, 60, 10, 30, 35.00, 17.50, 52.50, 280.00, 'In-store', 'Completed'),
    (61, 11, 61, 61, 11, 6, 11.00, 5.50, 16.50, 110.00, 'Online', 'Completed'),
    (62, 12, 62, 62, 12, 11, 16.00, 8.00, 24.00, 220.00, 'In-store', 'Shipped'),
    (63, 13, 63, 63, 13, 9, 13.00, 6.50, 19.50, 165.00, 'Online', 'Processing'),
    (64, 14, 64, 64, 14, 16, 21.00, 10.50, 31.50, 320.00, 'Online', 'Completed'),
    (65, 15, 65, 65, 15, 21, 26.00, 13.00, 39.00, 270.00, 'In-store', 'Shipped'),
    (66, 16, 66, 66, 16, 13, 19.00, 9.50, 28.50, 190.00, 'Online', 'Processing'),
    (67, 17, 67, 67, 17, 19, 23.00, 11.50, 34.50, 370.00, 'Online', 'Completed'),
    (68, 18, 68, 68, 18, 26, 31.00, 15.50, 46.50, 420.00, 'In-store', 'Shipped'),
    (69, 19, 69, 69, 19, 8, 9.00, 4.50, 13.50, 130.00, 'Online', 'Processing'),
    (70, 20, 70, 70, 20, 31, 36.00, 18.00, 54.00, 290.00, 'In-store', 'Completed'),
    (71, 21, 71, 71, 21, 12, 22.00, 11.00, 33.00, 115.00, 'Online', 'Completed'),
    (72, 22, 72, 72, 22, 13, 17.00, 8.50, 25.50, 230.00, 'In-store', 'Shipped'),
    (73, 23, 73, 73, 23, 14, 14.00, 7.00, 21.00, 175.00, 'Online', 'Processing'),
    (74, 24, 74, 74, 24, 15, 19.00, 9.50, 28.50, 315.00, 'Online', 'Completed'),
    (75, 25, 75, 75, 25, 16, 24.00, 12.00, 36.00, 265.00, 'In-store', 'Shipped'),
    (76, 26, 76, 76, 26, 17, 18.00, 9.00, 27.00, 195.00, 'Online', 'Processing'),
    (77, 27, 77, 77, 27, 18, 23.00, 11.50, 34.50, 375.00, 'Online', 'Completed'),
    (78, 28, 78, 78, 28, 19, 28.00, 14.00, 42.00, 425.00, 'In-store', 'Shipped'),
    (79, 29, 79, 79, 29, 20, 29.00, 14.50, 43.50, 135.00, 'Online', 'Processing'),
    (80, 30, 80, 80, 30, 21, 30.00, 15.00, 45.00, 290.00, 'In-store', 'Completed'),
    (81, 31, 81, 81, 31, 5, 9.00, 4.50, 13.50, 110.00, 'Online', 'Completed'),
    (82, 32, 82, 82, 32, 10, 14.00, 7.00, 21.00, 220.00, 'In-store', 'Shipped'),
    (83, 33, 83, 83, 33, 8, 11.00, 5.50, 16.50, 165.00, 'Online', 'Processing'),
    (84, 34, 84, 84, 34, 15, 19.00, 9.50, 28.50, 320.00, 'Online', 'Completed'),
    (85, 35, 85, 85, 35, 13, 25.00, 12.50, 37.50, 250.00, 'In-store', 'Shipped'),
    (86, 36, 86, 86, 36, 12, 18.00, 9.00, 27.00, 180.00, 'Online', 'Processing'),
    (87, 37, 87, 87, 37, 18, 22.00, 11.00, 33.00, 350.00, 'Online', 'Completed'),
    (88, 38, 88, 88, 38, 25, 30.00, 15.00, 45.00, 400.00, 'In-store', 'Shipped'),
    (89, 39, 89, 89, 39, 7, 8.00, 4.00, 12.00, 120.00, 'Online', 'Processing'),
    (90, 40, 90, 90, 40, 30, 35.00, 17.50, 52.50, 280.00, 'In-store', 'Completed'),
    (91, 41, 91, 91, 41, 5, 10.00, 5.00, 15.00, 100.00, 'Online', 'Completed'),
    (92, 42, 92, 92, 42, 10, 15.00, 7.50, 22.50, 200.00, 'In-store', 'Shipped'),
    (93, 43, 93, 93, 43, 8, 12.00, 6.00, 18.00, 150.00, 'Online', 'Processing'),
    (94, 44, 94, 94, 44, 15, 20.00, 10.00, 30.00, 300.00, 'Online', 'Completed'),
    (95, 45, 95, 95, 45, 20, 25.00, 12.50, 37.50, 250.00, 'In-store', 'Shipped'),
    (96, 46, 96, 96, 46, 12, 18.00, 9.00, 27.00, 180.00, 'Online', 'Processing'),
    (97, 47, 97, 97, 47, 18, 22.00, 11.00, 33.00, 350.00, 'Online', 'Completed'),
    (98, 48, 98, 98, 48, 20, 25.00, 12.50, 37.50, 250.00, 'In-store', 'Shipped'),
    (99, 49, 99, 99, 49, 12, 18.00, 9.00, 27.00, 180.00, 'Online', 'Processing'),
    (100, 50, 100, 100, 50, 15, 22.00, 11.00, 33.00, 350.00, 'Online', 'Completed');

create database sports_shop_data_mart;
use sports_shop_data_mart;

create table sales_performance_and_analysis as 
select 
    i.itemname,
    i.category,
    s.sales_channel,
    count(distinct s.customerkey) as unique_customers,
    sum(s.quantitysold) as total_units_sold,
    sum(s.profit) as total_profit,
    sum(s.totalsales) as total_sales 
from sports_shop.factsalesorders s
    join sports_shop.itemdimension i on s.itemkey = i.itemkey
group by 
    i.itemname, i.category, s.sales_channel
order by 
    total_profit desc;

select * from sales_performance_and_analysis;

create index idx_itemdimension_itemname on sports_shop.itemdimension (itemname);
create index idx_itemdimension_category on sports_shop.itemdimension (category);
create index idx_itemdimension_itemname_category on sports_shop.itemdimension (itemname, category);
create index idx_factsalesorders_sales_channel on sports_shop.factsalesorders (sales_channel);



-- Data mart Schema ----- MD MAHMUDUL HASAN ------ 
-- This qeury stores and displays data of Online sales performance of stores accross Ireland on monthly basis.

use sports_shop_data_mart;
CREATE TABLE monthly_online_sales_report AS SELECT location AS Store_Location,
    sales_channel AS Sales_Method,
    year,
    month,
    SUM(totalsales) AS Total_Sales FROM
    sports_shop.factsalesorders
        INNER JOIN
    sports_shop.customerdimension ON factsalesorders.customerkey = customerdimension.customerkey
        LEFT JOIN
    sports_shop.datedimension ON datedimension.datekey = factsalesorders.datekey
WHERE
    year = 2023 AND sales_channel = 'online'
GROUP BY location , sales_channel , month , year
ORDER BY total_sales DESC;

-- creating Index for optimization
CREATE INDEX idx_year
ON sports_shop.datedimension (year);

CREATE INDEX idx_sales_channel
ON sports_shop.factsalesorders (sales_channel);

SELECT * FROM monthly_online_sales_report;
-- ------- End of MD MAHMUDUL HASAN'S PART ------------


-- ----- Data mart Schema ----- NICHOLAS ALVES --------
-- The goal of this query is to identify the sales performance of each item ordered from suppliers

use sports_shop_data_mart;
create table inventory_performance as 
SELECT id.itemkey, id.itemname, id.category, id.brand, id.color, id.size,
       SUM(fs.quantitysold) AS total_sold,
       SUM(pd.quantity) AS total_ordered,
       (SUM(pd.quantity) - SUM(fs.quantitysold)) AS remaining_inventory
FROM sports_shop.itemdimension id
LEFT JOIN sports_shop.factsalesorders fs ON id.itemkey = fs.itemkey
LEFT JOIN sports_shop.podimension pd ON id.itemkey = pd.itemkey
GROUP BY id.itemkey, id.itemname, id.category, id.brand, id.color, id.size 
ORDER BY remaining_inventory DESC;

select * from inventory_performance;

CREATE INDEX idx_itemkey ON sports_shop.itemdimension(itemkey);
CREATE INDEX idx_quantity ON sports_shop.podimension(quantity);
CREATE INDEX idx_quantity_sold ON sports_shop.factsalesorders(quantitysold);

-- ------- End of NICHOLAS ALVES' PART ------------



