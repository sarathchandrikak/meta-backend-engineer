```sql

-- -----------------------------------------------------
-- Schema little_lemon_db
-- -----------------------------------------------------
CREATE SCHEMA LittleLemonDB;

-- -----------------------------------------------------
-- CREATE TABLE Bookings
-- -----------------------------------------------------

CREATE TABLE IF NOT EXISTS Bookings (
  BookingID INT NOT NULL,
  Date DATE NOT NULL,
  TableNumber INT NOT NULL,
  PRIMARY KEY (BookingID));


-- -----------------------------------------------------
-- CREATE TABLE CustomerDetails
-- -----------------------------------------------------

CREATE TABLE IF NOT EXISTS CustomerDetails (
  CustomerID INT NOT NULL,
  Contacts VARCHAR(255) NOT NULL,
  Names VARCHAR(255) NOT NULL,
  PRIMARY KEY (CustomerID));

-- -----------------------------------------------------
-- CREATE TABLE Order_Delivery_Status
-- -----------------------------------------------------

CREATE TABLE IF NOT EXISTS Order_Delivery_Status (
  StatusID INT NOT NULL,
  DeliveryDate DATE NOT NULL,
  DeliveryStatus VARCHAR(255) NOT NULL,
  PRIMARY KEY (StatusID));

-- -----------------------------------------------------
-- CREATE TABLE Staff_Information
-- -----------------------------------------------------

CREATE TABLE IF NOT EXISTS Staff_Information (
  StaffID INT NOT NULL,
  Name VARCHAR(255) NOT NULL,
  Role VARCHAR(255) NOT NULL,
  Salary VARCHAR(255) NOT NULL,
  PRIMARY KEY (StaffID));

-- -----------------------------------------------------
-- CREATE TABLE Orders
-- -----------------------------------------------------

 CREATE TABLE IF NOT EXISTS Orders (
   OrderID INT NOT NULL,
   OrderDate INT NOT NULL,
   Quantity INT NOT NULL,
   TotalCost INT NOT NULL,
   StatusID INT NOT NULL,
   CustomerID INT NOT NULL,
   PRIMARY KEY (OrderID),
   CONSTRAINT Customer_fk
     FOREIGN KEY (CustomerID)
     REFERENCES CustomerDetails (CustomerID)
     ON DELETE NO ACTION
     ON UPDATE NO ACTION,
   CONSTRAINT Order_fk
     FOREIGN KEY (StatusID)
     REFERENCES Order_Delivery_Status (StatusID)
     ON DELETE CASCADE
     ON UPDATE CASCADE);
 

CREATE INDEX Customer_fk_idx ON Orders (CustomerID);
CREATE INDEX Order_fk_idx ON Orders (StatusID);

-- -----------------------------------------------------
-- CREATE TABLE Menu
-- -----------------------------------------------------

CREATE TABLE IF NOT EXISTS Menu (
  MenuID INT NOT NULL,
  Starters VARCHAR(255) NOT NULL,
  Cuisines VARCHAR(255) NOT NULL,
  Courses VARCHAR(255) NOT NULL,
  Drinks VARCHAR(255) NOT NULL,
  Desserts VARCHAR(255) NOT NULL,
  OrderID INT NOT NULL,
  BookingID INT NOT NULL,
  StaffID INT NOT NULL,
  PRIMARY KEY (MenuID),
  CONSTRAINT Menu_fk
    FOREIGN KEY (OrderID)
    REFERENCES Orders (OrderID)
    ON DELETE CASCADE
    ON UPDATE CASCADE,
  CONSTRAINT Bookings_fk
    FOREIGN KEY (BookingID)
    REFERENCES Bookings (BookingID)
    ON DELETE CASCADE
    ON UPDATE CASCADE,
  CONSTRAINT Staff_fk
    FOREIGN KEY (StaffID)
    REFERENCES Staff_Information (StaffID)
    ON DELETE CASCADE
    ON UPDATE CASCADE);



  CREATE INDEX Menu_fk_idx ON Menu (OrderID);
  CREATE INDEX Bookings_fk_idx ON Menu (BookingID);
  CREATE INDEX Staff_fk_idx ON Menu (StaffID);

```




```sql

-- -----------------------------------------------------
-- Insert data into tables
-- -----------------------------------------------------


INSERT INTO customerdetails (CustomerID, Names, Contacts)
VALUES
(1, 'John Doe', 'john.doe@example.com'),
(2, 'Jane Doe', 'jane.doe@example.com'),
(3, 'Alice', 'alice@example.com'),
(4, 'Bob', 'bob@example.com'),
(5, 'Charlie', 'charlie@example.com'),
(6, 'David', 'david@example.com'),
(7, 'Emily', 'emily@example.com'),
(8, 'Frank', 'frank@example.com'),
(9, 'Grace', 'grace@example.com'),
(10, 'Hannah', 'hannah@example.com');

INSERT INTO staff_information (StaffID, Name, Role, Salary)
VALUES
(1,'Sarah', 'Manager', 55000),
(2,'Tom', 'Waiter', 30000),
(3,'Linda', 'Chef', 40000),
(4,'Robert', 'Cashier', 31000),
(5,'Daniel', 'Waiter', 32000),
(6,'Susan', 'Hostess', 28000),
(7,'Chris', 'Manager', 60000),
(8,'Jessica', 'Chef', 38000),
(9,'Brian', 'Waiter', 29000),
(10,'Kim', 'Hostess', 27000);

INSERT INTO Menu (MenuID, Starters, Cuisines, Courses, Drinks, Desserts, OrderID, BookingID, StaffID)
VALUES
(1, 'Garlic Butter Shrimp', 'Italian', 'Appetizer', 'White Wine', 'Tiramisu', 1, 1, 1),
(2, 'Spring Rolls', 'Chinese', 'Appetizer', 'Green Tea', 'Fruit Tart', 2, 2, 2),
(3, 'Caprese Salad', 'Italian', 'Salad', 'Iced Tea', 'Cheesecake', 3, 3, 3),
(4, 'Chicken Wings', 'American', 'Appetizer', 'Soda', 'Chocolate Cake', 4, 4, 4),
(5, 'Tomato Soup', 'French', 'Soup', 'Red Wine', 'Creme Brulee', 5, 5, 5),
(6, 'Sushi Rolls', 'Japanese', 'Appetizer', 'Sake', 'Mochi Ice Cream', 6, 6, 6),
(7, 'Hummus with Pita', 'Lebanese', 'Appetizer', 'Mint Tea', 'Baklava', 7, 7, 7),
(8, 'Tandoori Chicken', 'Indian', 'Main Course', 'Lassi', 'Gulab Jamun', 8, 8, 8),
(9, 'Greek Salad', 'Greek', 'Salad', 'Ouzo', 'Baklava', 9, 9, 9),
(10, 'Steak au Poivre', 'French', 'Main Course', 'Red Wine', 'Creme Brulee', 10, 10, 10);

INSERT INTO Bookings (BookingID, Date, TableNumber)
VALUES
(1, '2023-09-01 12:00:00', 10),
(2, '2023-09-01 12:30:00', 12),
(3, '2023-09-02 13:00:00', 14),
(4, '2023-09-02 14:00:00', 16),
(5, '2023-09-03 15:00:00', 18),
(6, '2023-09-03 16:00:00', 20),
(7, '2023-09-04 17:00:00', 22),
(8, '2023-09-04 18:00:00', 24),
(9, '2023-09-05 19:00:00', 26),
(10, '2023-09-05 20:00:00', 28);


INSERT INTO Orders (OrderID, OrderDate, Quantity, TotalCost, StatusID, CustomerID)
VALUES
(1, '2023-09-01 12:00:00', 3, 499, 1, 5),
(2, '2023-09-01 12:30:00', 2, 295, 2, 8),
(3, '2023-09-02 13:00:00', 4, 599, 3, 4),
(4, '2023-09-02 14:00:00', 1, 199, 4, 7),
(5, '2023-09-03 15:00:00', 5, 795, 5, 1),
(6, '2023-09-03 16:00:00', 2, 295, 6, 9),
(7, '2023-09-04 17:00:00', 3, 499, 7, 2),
(8, '2023-09-04 18:00:00', 4, 599, 8, 6),
(9, '2023-09-05 20:00:00', 1, 199, 9, 3),
(10, '2023-09-05 20:00:00', 5, 795, 10, 10);

INSERT INTO Order_Delivery_Status (StatusID, DeliveryDate, DeliveryStatus)
VALUES
(1, '2023-09-01 12:15:00', 'Delivered'),
(2, '2023-09-01 12:45:00', 'Preparing'),
(3, '2023-09-02 13:15:00', 'Preparing'),
(4, '2023-09-02 14:15:00', 'Out for delivery'),
(5, '2023-09-03 15:15:00', 'Out for delivery'),
(6, '2023-09-03 16:15:00', 'Delivered'),
(7, '2023-09-04 17:15:00', 'Preparing'),
(8, '2023-09-04 18:15:00', 'Delivered'),
(9, '2023-09-05 19:15:00', 'Delivered'),
(10, '2023-09-05 20:15:00', 'Delivered');

```


```sql

-- -----------------------------------------------------
-- CREATE VIEW ORDERSVIEW
-- -----------------------------------------------------

CREATE VIEW OrdersView AS
SELECT OrderID, Quantity, TotalCost
FROM orders
WHERE Quantity > 2;

```

![](/images/ordersview.png)

```sql

-- -----------------------------------------------------
-- JOIN QUERY
-- -----------------------------------------------------

select * from customerdetails c inner join orders o on c.customerid = o.customerid inner join menu m on o.orderid = m.orderid;


-- -----------------------------------------------------
-- GROUPBY QUERY
-- -----------------------------------------------------

select m.orderid, count(m.orderid)  from orders o inner join menu m on o.orderid = m.orderid group by m.orderid having count(m.orderid) >= 2;


-- -----------------------------------------------------
-- PROCEDURE/FUNCTION GETMAXQUANTITY()
-- -----------------------------------------------------

CREATE OR REPLACE FUNCTION get_max_quantity()
RETURNS TABLE(max_quantity INTEGER) AS
$$
BEGIN
    RETURN QUERY
    SELECT max(quantity) AS max_quantity FROM orders;
END;
$$
LANGUAGE plpgsql;


PREPARE GetOrderDetail (INT) AS
SELECT OrderID, Quantity, TotalCost FROM Orders WHERE CustomerID = $1;

```


```sql

-- -----------------------------------------------------
-- PROCEDURE/FUNCTION CANCELORDER()
-- -----------------------------------------------------

CREATE OR REPLACE FUNCTION CancelOrder(orderId INT) 
RETURNS VOID AS
$$
BEGIN
    DELETE FROM Orders WHERE OrderID = orderId;
END;
$$
LANGUAGE plpgsql;

```

```sql 
-- -----------------------------------------------------
-- PROCEDURE/FUNCTION CHECKBOOKING()
-- -----------------------------------------------------

CREATE OR REPLACE FUNCTION CheckBooking(booking_date DATE, table_number INT) 
RETURNS TABLE(booking_status TEXT) AS
$$
DECLARE 
    bookedTable INT;
BEGIN
    SELECT COUNT(*) INTO bookedTable
    FROM Bookings 
    WHERE date = booking_date AND tablenumber = table_number;

    IF bookedTable > 0 THEN
        RETURN QUERY SELECT CONCAT('Table ', table_number, ' is already booked') AS booking_status;
    ELSE 
        RETURN QUERY SELECT CONCAT('Table ', table_number, ' is not booked') AS booking_status;
    END IF;
END;
$$
LANGUAGE plpgsql;
```


```sql
-- -----------------------------------------------------
-- PROCEDURE/FUNCTION UPDATEBOOKING()
-- -----------------------------------------------------

CREATE OR REPLACE FUNCTION UpdateBooking(booking_id INT, booking_date DATE) 
RETURNS TABLE(confirmation TEXT) AS
$$
BEGIN
    UPDATE bookings SET date = booking_date WHERE BookingID = bookingid;
    RETURN QUERY SELECT CONCAT('Booking ', booking_id, ' updated') AS confirmation;
END;
$$
LANGUAGE plpgsql;

```


```sql
-- -----------------------------------------------------
-- PROCEDURE/FUNCTION CANCELBOOKING()
-- -----------------------------------------------------

CREATE OR REPLACE FUNCTION CancelBooking(booking_id_to_cancel INT) 
RETURNS TABLE(confirmation TEXT) AS
$$
BEGIN
    -- Delete the booking record
    DELETE FROM LittleLemonDB.Bookings
    WHERE BookingID = booking_id_to_cancel;

    RETURN QUERY SELECT CONCAT('Booking ', booking_id_to_cancel, ' cancelled') AS confirmation;
END;
$$
LANGUAGE plpgsql;

```

```sql

-- -----------------------------------------------------
-- PROCEDURE/FUNCTION ADDBOOKING()
-- -----------------------------------------------------

CREATE OR REPLACE FUNCTION AddBooking(booking_id INT, booking_date DATE, table_number INT) 
 RETURNS TABLE(confirmation TEXT) AS
 $$
 BEGIN
    INSERT INTO Bookings(BookingID, Date, TableNumber) VALUES (SET bookingID = booking_id, date = booking_date, tablenumber= table_number);
    RETURN QUERY SELECT CONCAT('Booking ', booking_id, ' added') AS confirmation;
END;
 $$
 LANGUAGE plpgsql;

 SELECT * FROM AddBooking(25, '2022-10-11', 16); 


INSERT INTO Bookings (BookingID, Date, TableNumber)
VALUES
(11, '2022-10-10', 5),
(12, '2022-11-12', 3),
(13, '2023-09-02', 14),
(14, '2022-10-11', 2),
(15, '2023-10-13', 1);

```