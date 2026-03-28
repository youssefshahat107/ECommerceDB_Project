USE [ECommerceDB]
GO

/****** Object:  Trigger [dbo].[Check_Stock_Before_Order]    Script Date: 3/26/2026 9:17:42 PM ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE TRIGGER [dbo].[Check_Stock_Before_Order]
ON [dbo].[OrderItems]
INSTEAD OF INSERT
AS
BEGIN

IF EXISTS (
SELECT 1
FROM inserted I
JOIN Products P
ON I.Product_ID = P.Product_ID
WHERE I.Quantity > P.Stock
)

BEGIN
RAISERROR('Not enough stock available',16,1)
RETURN
END

INSERT INTO OrderItems
(Order_ID, Product_ID, Quantity, Price)

SELECT
Order_ID,
Product_ID,
Quantity,
Price
FROM inserted


END
GO

ALTER TABLE [dbo].[OrderItems] ENABLE TRIGGER [Check_Stock_Before_Order]
GO

USE [ECommerceDB]
GO

/****** Object:  Trigger [dbo].[Reduce_Stock_After_Order]    Script Date: 3/26/2026 9:18:05 PM ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE TRIGGER [dbo].[Reduce_Stock_After_Order]
ON [dbo].[OrderItems]
AFTER INSERT
AS
BEGIN

UPDATE Products
SET Stock = Stock - I.Quantity

FROM Products P
JOIN inserted I
ON P.Product_ID = I.Product_ID

END
GO

ALTER TABLE [dbo].[OrderItems] ENABLE TRIGGER [Reduce_Stock_After_Order]
GO

USE [ECommerceDB]
GO

/****** Object:  Trigger [dbo].[Restore_Stock_After_Delete]    Script Date: 3/26/2026 9:18:29 PM ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE TRIGGER [dbo].[Restore_Stock_After_Delete]
ON [dbo].[OrderItems]
AFTER DELETE
AS
BEGIN

UPDATE Products
SET Stock = Stock + D.Quantity

FROM Products P
JOIN deleted D
ON P.Product_ID = D.Product_ID

END
GO

ALTER TABLE [dbo].[OrderItems] ENABLE TRIGGER [Restore_Stock_After_Delete]
GO

