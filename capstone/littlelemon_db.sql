-- -----------------------------------------------------
-- Schema little_lemon_db
-- -----------------------------------------------------

CREATE TABLE CustomerDetails (
    CustomerID INT PRIMARY KEY,
    Name VARCHAR(100),
    ContactDetails VARCHAR(100)
);

CREATE TABLE StaffInformation (
    StaffID INT PRIMARY KEY,
    Name VARCHAR(100),
    Role VARCHAR(50),
    Salary DECIMAL(10, 2)
);

CREATE TABLE Menu (
    MenuItemID INT PRIMARY KEY,
    ItemType VARCHAR(50),
    ItemName VARCHAR(100),
    Price DECIMAL(10, 2)
);

CREATE TABLE Bookings (
    BookingID INT PRIMARY KEY,
    Date DATE,
    CustomerID INT REFERENCES CustomerDetails(CustomerID),
    TableNumber INT 
);

CREATE TABLE Orders (
    OrderID INT PRIMARY KEY,
    OrderDate DATE,
    Quantity INT,
    TotalCost DECIMAL(10, 2),
    CustomerID INT REFERENCES CustomerDetails(CustomerID),
    MenuItemID INT REFERENCES Menu(MenuItemID)
);

CREATE TABLE OrderDeliveryStatus (
    OrderID INT PRIMARY KEY REFERENCES Orders(OrderID),
    DeliveryDate DATE,
    Status VARCHAR(50)
);
