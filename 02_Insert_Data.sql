USE ECommerceDB
GO

-- Insert Categories

INSERT INTO Categories (Category_Name)
VALUES 
('Electronics'),
('Accessories'),
('Furniture')

GO

-- Insert Customers

INSERT INTO Customers 
(Customer_Name, Email, Phone, Address)

VALUES
('Ahmed Ali','ahmed@gmail.com','01000000001','Cairo'),
('Sara Mohamed','sara@gmail.com','01000000002','Giza'),
('Omar Hassan','omar@gmail.com','01000000003','Alex')

GO

-- Insert Products

INSERT INTO Products
(Product_Name, Price, Stock, Category_ID)

VALUES
('Laptop',1200,50,1),
('Mouse',25,100,2),
('Keyboard',40,80,2),
('Chair',150,30,3)

GO