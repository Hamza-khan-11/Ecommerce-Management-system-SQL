CREATE DATABASE Ecommerce_Management;
USE Ecommerce_Management;

-- Creating Tables
CREATE TABLE Cart (
    Cart_id VARCHAR(7) PRIMARY KEY
);

CREATE TABLE Customer (
    Customer_id VARCHAR(6) PRIMARY KEY,
    c_pass VARCHAR(10) NOT NULL,
    Name VARCHAR(20) NOT NULL,
    Address VARCHAR(20) NOT NULL,
    Pincode CHAR(6) NOT NULL,
    Phone_number_s CHAR(10) NOT NULL,
    Cart_id VARCHAR(7) NOT NULL,
    FOREIGN KEY (Cart_id) REFERENCES Cart(Cart_id)
);

CREATE TABLE Seller (
    Seller_id VARCHAR(6) PRIMARY KEY,
    s_pass VARCHAR(10) NOT NULL,
    Name VARCHAR(20) NOT NULL,
    Address VARCHAR(10) NOT NULL
);

CREATE TABLE Seller_Phone_num (
    Phone_num CHAR(10) NOT NULL,
    Seller_id VARCHAR(6) NOT NULL,
    PRIMARY KEY (Phone_num, Seller_id),
    FOREIGN KEY (Seller_id) REFERENCES Seller(Seller_id) ON DELETE CASCADE
);

CREATE TABLE Payment (
    payment_id VARCHAR(7) PRIMARY KEY,
    payment_date DATE NOT NULL,
    Payment_type VARCHAR(10) NOT NULL,
    Customer_id VARCHAR(6) NOT NULL,
    Cart_id VARCHAR(7) NOT NULL,
    FOREIGN KEY (Customer_id) REFERENCES Customer(Customer_id),
    FOREIGN KEY (Cart_id) REFERENCES Cart(Cart_id),
    total_amount DECIMAL(10, 2)
);

CREATE TABLE Product (
    Product_id VARCHAR(7) PRIMARY KEY,
    Type VARCHAR(15) NOT NULL,
    Color VARCHAR(15) NOT NULL,
    P_Size VARCHAR(2) NOT NULL,
    Gender CHAR(1) NOT NULL,
    Commission DECIMAL(5, 2) NOT NULL,
    Cost DECIMAL(10, 2) NOT NULL,
    Quantity INT NOT NULL,
    Seller_id VARCHAR(6),
    FOREIGN KEY (Seller_id) REFERENCES Seller(Seller_id) ON DELETE SET NULL
);

CREATE TABLE Cart_item (
    Quantity_wished INT NOT NULL,
    Date_Added DATE NOT NULL,
    Cart_id VARCHAR(7) NOT NULL,
    Product_id VARCHAR(7) NOT NULL,
    purchased VARCHAR(3) DEFAULT 'NO',
    FOREIGN KEY (Cart_id) REFERENCES Cart(Cart_id),
    FOREIGN KEY (Product_id) REFERENCES Product(Product_id),
    PRIMARY KEY (Cart_id, Product_id)
);

CREATE TABLE Purchase_Order (
    Order_id VARCHAR(7) PRIMARY KEY,
    Order_date DATE NOT NULL,
    Customer_id VARCHAR(6) NOT NULL,
    Total_amount DECIMAL(10, 2),
    FOREIGN KEY (Customer_id) REFERENCES Customer(Customer_id)
);

CREATE TABLE Order_Item (
    Order_item_id VARCHAR(7) PRIMARY KEY,
    Order_id VARCHAR(7) NOT NULL,
    Product_id VARCHAR(7) NOT NULL,
    Quantity INT NOT NULL,
    Unit_price DECIMAL(10, 2) NOT NULL,
    FOREIGN KEY (Order_id) REFERENCES Purchase_Order(Order_id),
    FOREIGN KEY (Product_id) REFERENCES Product(Product_id)
);

CREATE TABLE Category (
    Category_id VARCHAR(7) PRIMARY KEY,
    Category_name VARCHAR(20) NOT NULL,
    Description VARCHAR(50)
);

-- Inserting Values
INSERT INTO Cart (Cart_id) VALUES 
('crt1012'), ('crt1013'), ('crt1014'), ('crt1015'), ('crt1011'), ('crt1016'), ('crt1021');

INSERT INTO Customer (Customer_id, c_pass, Name, Address, Pincode, Phone_number_s, Cart_id)
VALUES 
('cid101', 'pass101', 'Alice', 'A-123', '100001', '1234567890', 'crt1012'),
('cid102', 'pass102', 'Bob', 'B-456', '200002', '2345678901', 'crt1013'),
('cid103', 'pass103', 'Charlie', 'C-789', '300003', '3456789012', 'crt1014'),
('cid100', 'ABCM1235', 'rajat', 'G-453', '632014', '9893135876', 'crt1016'),
('cid104', 'pass104', 'David', 'D-789', '400004', '4567890123', 'crt1015'),
('cid105', 'pass105', 'Emily', 'E-012', '500005', '5678901234', 'crt1016');

UPDATE Customer SET Cart_id = 'crt1021' WHERE Customer_id = 'cid101';

INSERT INTO Seller (Seller_id, s_pass, Name, Address)
VALUES 
('sid101', 'pass101', 'John', 'NY'),
('sid102', 'pass102', 'Jane', 'LA'),
('sid103', 'pass103', 'Smith', 'SF'),
('sid100', '12345', 'aman', 'delhi cmc');

INSERT INTO Seller_Phone_num (Phone_num, Seller_id) VALUES 
('1122334455', 'sid101'), ('2233445566', 'sid102'), ('3344556677', 'sid103'), ('9943336206', 'sid100');

INSERT INTO Product (Product_id, Type, Color, P_Size, Gender, Commission, Cost, Quantity, Seller_id)
VALUES
('pid1006', 'Electronics', 'orange', 'M', 'M', 15, 500, 50, 'sid101'), 
('pid1002', 'shirt', 'blue', 'M', 'M', 15, 500, 50, 'sid101'),
('pid1003', 'dress', 'green', 'L', 'F', 20, 1500, 30, 'sid102'),
('pid1004', 't-shirt', 'black', 'S', 'M', 10, 300, 100, 'sid103'),
('pid1005', 'jeans', 'blue', '30', 'F', 12, 800, 25, 'sid100'),
('pid1001', 'jeans', 'red', '32', 'M', 10, 1000.5, 20, 'sid100'),
('pid1007', 'jeans', 'blue', '32', 'F', 12, 800, 25, 'sid101'),
('pid1008', 'jeans', 'black', '32', 'F', 12, 750, 10, 'sid102'),
('pid1009', 'Clothing', 'White', 'S', 'F', 10, 700, 20, 'sid102'),
('pid1011', 'jeans', 'blue', '32', 'F', 12, 700, 20, 'sid101');

INSERT INTO Cart_item (Quantity_wished, Date_Added, Cart_id, Product_id, purchased)
VALUES 
(2, STR_TO_DATE('10-JUN-2023', '%d-%b-%Y'), 'crt1012', 'pid1002', 'YES'),
(1, STR_TO_DATE('12-JUN-2023', '%d-%b-%Y'), 'crt1013', 'pid1003', 'NO'),
(3, STR_TO_DATE('15-JUN-2023', '%d-%b-%Y'), 'crt1014', 'pid1004', 'YES'),
(3, STR_TO_DATE('10-OCT-1999', '%d-%b-%Y'), 'crt1011', 'pid1001', 'YES'),
(2, STR_TO_DATE('2023-06-10', '%Y-%m-%d'), 'crt1016', 'pid1002', 'NO'),
(1, STR_TO_DATE('2023-06-12', '%Y-%m-%d'), 'crt1016', 'pid1003', 'NO'),
(2, STR_TO_DATE('20-JUN-2023', '%d-%b-%Y'), 'crt1015', 'pid1003', 'NO'),
(1, STR_TO_DATE('22-JUN-2023', '%d-%b-%Y'), 'crt1016', 'pid1004', 'NO'),
(2, STR_TO_DATE('01-JUN-2023', '%d-%b-%Y'), 'crt1021', 'pid1011', 'YES');

INSERT INTO Payment (payment_id, payment_date, Payment_type, Customer_id, Cart_id, total_amount) VALUES 
('pmt1002', STR_TO_DATE('11-JUN-2023', '%d-%b-%Y'), 'credit', 'cid101', 'crt1012', 500),
('pmt1003', STR_TO_DATE('13-JUN-2023', '%d-%b-%Y'), 'debit', 'cid102', 'crt1013', 1500),
('pmt1004', STR_TO_DATE('16-JUN-2023', '%d-%b-%Y'), 'credit', 'cid103', 'crt1014', 900),
('pmt1001', STR_TO_DATE('11-JUN-2023', '%d-%b-%Y'), 'cash', 'cid100', 'crt1016', 1000);

INSERT INTO Purchase_Order (Order_id, Order_date, Customer_id, Total_amount)
VALUES 
('ord001', STR_TO_DATE('2023-06-11', '%Y-%m-%d'), 'cid101', 500),
('ord002', STR_TO_DATE('2023-06-13', '%Y-%m-%d'), 'cid102', 1500),
('ord003', STR_TO_DATE('2023-06-16', '%Y-%m-%d'), 'cid103', 900),
('ord004', STR_TO_DATE('2023-06-10', '%Y-%m-%d'), 'cid100', 1000.5);

-- Inserting Order Items
INSERT INTO Order_Item (Order_item_id, Order_id, Product_id, Quantity, Unit_price)
VALUES 
('oit001', 'ord001', 'pid1001', 2, 200),
('oit002', 'ord002', 'pid1002', 3, 300),
('oit003', 'ord003', 'pid1003', 1, 500),
('oit004', 'ord004', 'pid1004', 2, 400);

-- If the customer wants to see details of products present in the cart
SELECT * FROM Product 
WHERE Product_id IN (
    SELECT Product_id FROM Cart_item 
    WHERE Cart_id IN (
        SELECT Cart_id FROM Customer WHERE Customer_id = 'cid100'
    ) AND purchased = 'NO'
);

-- If a customer wants to see order history
SELECT oi.Product_id, oi.Quantity, po.Order_date, oi.Unit_price
FROM Purchase_Order po
JOIN Order_Item oi ON po.Order_id = oi.Order_id
WHERE po.Customer_id = 'cid100';

-- Customer wants to see filtered products based on size, gender, and type
SELECT Product_id, Color, Cost, Seller_id 
FROM Product 
WHERE Type = 'jeans' AND P_Size = '32' AND Gender = 'F' AND Quantity > 0;

-- If customer wants to modify the cart
DELETE FROM Cart_item 
WHERE Product_id = 'pid1001' AND Cart_id IN (SELECT Cart_id FROM Customer WHERE Customer_id = 'cid100');

-- If a seller stops selling his product
DELETE FROM Seller WHERE Seller_id = 'sid100';
UPDATE Product SET Quantity = 0 WHERE Seller_id IS NULL;

-- The total amount payable by a specific customer for the products
SELECT SUM(Quantity_wished * Cost) AS total_payable 
FROM Product P 
JOIN Cart_item C ON P.Product_id = C.Product_id 
WHERE C.Product_id IN (
    SELECT Product_id FROM Cart_item 
    WHERE Cart_id IN (SELECT Cart_id FROM Customer WHERE Customer_id = 'cid101') AND purchased = 'YES'
);

-- Show the details of customers who have not purchased anything
SELECT * FROM Customer 
WHERE Customer_id NOT IN (SELECT Customer_id FROM Payment);

-- Find the total profit of the website from sales
SELECT SUM(oi.Quantity * p.Cost * p.Commission / 100) AS total_profit 
FROM Order_Item oi
JOIN Product p ON oi.Product_id = p.Product_id;

-- Show order details including customer information
SELECT po.Order_id, po.Order_date, c.Name, c.Address, po.Total_amount
FROM Purchase_Order po
JOIN Customer c ON po.Customer_id = c.Customer_id;

-- Show products under a specific category
SELECT p.Product_id, p.Type, p.Color, p.Cost, p.Quantity
FROM Product p
JOIN Category c ON p.Type = c.Category_name
WHERE c.Category_id = 'cat001';

-- Show order details for a specific customer
SELECT po.Order_id, po.Order_date, oi.Product_id, oi.Quantity, oi.Unit_price
FROM Purchase_Order po
JOIN Order_Item oi ON po.Order_id = oi.Order_id
WHERE po.Customer_id = 'cid101';

-- SET SQL_SAFE_UPDATES = 0;

-- Update total amount in Purchase_Order based on Order_Item
UPDATE Purchase_Order po
JOIN (
    SELECT Order_id, SUM(Quantity * Unit_price) AS Total
    FROM Order_Item
    GROUP BY Order_id
) oi ON po.Order_id = oi.Order_id
SET po.Total_amount = oi.Total;

-- Procedures and Functions
DELIMITER //

CREATE PROCEDURE order_summary(IN param_order_id VARCHAR(7))
BEGIN
    SELECT po.Order_id, po.Order_date, po.Total_amount, 
           c.Name AS Customer_Name, c.Address AS Customer_Address, c.Pincode, c.Phone_number_s
    FROM Purchase_Order po
    JOIN Customer c ON po.Customer_id = c.Customer_id
    WHERE po.Order_id = param_order_id;
    
    SELECT oi.Order_item_id, p.Product_id, p.Type, p.Color, p.P_Size, p.Gender, oi.Quantity, oi.Unit_price
    FROM Order_Item oi
    JOIN Product p ON oi.Product_id = p.Product_id
    WHERE oi.Order_id = param_order_id;
END //

CREATE FUNCTION get_total_amount(param_order_id VARCHAR(7)) 
RETURNS DECIMAL(10, 2)
DETERMINISTIC
BEGIN
    DECLARE total_amount DECIMAL(10, 2);
    SELECT SUM(oi.Quantity * oi.Unit_price) INTO total_amount
    FROM Order_Item oi
    WHERE oi.Order_id = param_order_id;
    RETURN total_amount;
END //

-- New Procedures, Functions, and Triggers
CREATE PROCEDURE cost_filter(IN c DECIMAL(10, 2), IN t VARCHAR(7))
BEGIN
    DECLARE cs DECIMAL(10, 2);
    DECLARE ty VARCHAR(7);
    DECLARE id VARCHAR(7);

    DECLARE done INT DEFAULT 0;
    DECLARE cf CURSOR FOR
        SELECT Product_id, Cost, Type FROM Product WHERE Cost < c AND Type = t;
    DECLARE CONTINUE HANDLER FOR NOT FOUND SET done = 1;

    OPEN cf;
    read_loop: LOOP
        FETCH cf INTO id, cs, ty;
        IF done THEN
            LEAVE read_loop;
        END IF;
        SELECT CONCAT('Product ', id, ' has cost ', cs, ' and the type is ', ty);
    END LOOP;
    CLOSE cf;
END //

CREATE FUNCTION totalProducts(sId VARCHAR(6))
RETURNS INT
DETERMINISTIC
BEGIN
    DECLARE total_count INT;
    SELECT COUNT(*) INTO total_count
    FROM Product
    WHERE Seller_id = sId;
    RETURN total_count;
END //

CREATE PROCEDURE getProductQuantity(p_id VARCHAR(7))
BEGIN
    DECLARE quan INT;
    DECLARE product_not_found BOOLEAN DEFAULT FALSE;

    SELECT Quantity INTO quan
    FROM Product
    WHERE Product_id = p_id;

    IF quan IS NULL THEN
        SET product_not_found = TRUE;
    END IF;

    IF product_not_found THEN
        SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = 'Sorry, no such product exists!';
    ELSE
        SELECT quan AS Product_Quantity;
    END IF;
END //

CREATE FUNCTION numCartId(cd VARCHAR(7))
RETURNS INT
DETERMINISTIC
BEGIN
    DECLARE total INT DEFAULT 0;
    SELECT COUNT(*) INTO total
    FROM Cart_item
    WHERE Cart_id = cd;
    RETURN total;
END //

CREATE TRIGGER before_customer
BEFORE INSERT ON Customer
FOR EACH ROW
BEGIN
    DECLARE n INT;
    SET n = numCartId(NEW.Cart_id);
    IF n > 0 THEN
        SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = 'Cart ID already exists!';
    END IF;
END //

CREATE FUNCTION total_cost(cId VARCHAR(7))
RETURNS DECIMAL(10, 2)
DETERMINISTIC
BEGIN
    DECLARE total DECIMAL(10, 2) DEFAULT 0.00;
    SELECT SUM(p.Cost) INTO total
    FROM Product p
    INNER JOIN Cart_item ci ON p.Product_id = ci.Product_id
    WHERE ci.Cart_id = cId;
    RETURN total;
END //

CREATE TRIGGER before_pay_up
BEFORE INSERT ON Payment
FOR EACH ROW
BEGIN
    DECLARE total_cost DECIMAL(10, 2);
    SET total_cost = total_cost(NEW.Cart_id);
    SET NEW.total_amount = total_cost;
END //

DELIMITER ;

-- Usage of procedure and function
CALL order_summary('ord003');
SELECT get_total_amount('ord003') AS Total_Amount;
CALL cost_filter(1000, 'jeans');
SELECT totalProducts('sid100') AS TotalProducts;
CALL getProductQuantity('pid1001');
