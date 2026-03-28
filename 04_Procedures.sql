CREATE PROCEDURE Create_New_Order
    @Customer_ID INT,
    @Product_ID INT,
    @Quantity INT
AS
BEGIN

DECLARE @Price DECIMAL(10,2)

SELECT @Price = Price
FROM Products
WHERE Product_ID = @Product_ID

INSERT INTO Orders
(Customer_ID)
VALUES
(@Customer_ID)

DECLARE @Order_ID INT

SELECT @Order_ID = SCOPE_IDENTITY()

INSERT INTO OrderItems
(Order_ID, Product_ID, Quantity, Price)

VALUES
(@Order_ID, @Product_ID, @Quantity, @Price)

END
GO