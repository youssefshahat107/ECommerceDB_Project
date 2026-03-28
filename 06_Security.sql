USE ECommerceDB
GO

-------------------------
-- CREATE ROLES
-------------------------

CREATE ROLE SalesRole
GO

CREATE ROLE InventoryRole
GO

CREATE ROLE AccountRole
GO

CREATE ROLE AdminRole
GO


-------------------------
-- SALES ROLE PERMISSIONS
-------------------------

GRANT SELECT, INSERT, UPDATE
ON Customers TO SalesRole

GRANT SELECT, INSERT, UPDATE
ON Orders TO SalesRole

GRANT SELECT, INSERT, UPDATE
ON OrderItems TO SalesRole

GRANT SELECT, INSERT
ON Payments TO SalesRole


-------------------------
-- INVENTORY ROLE
-------------------------

GRANT SELECT, INSERT, UPDATE
ON Products TO InventoryRole

GRANT SELECT, INSERT, UPDATE
ON Categories TO InventoryRole


-------------------------
-- ACCOUNT ROLE
-------------------------

GRANT SELECT, INSERT
ON Payments TO AccountRole

GRANT SELECT
ON Orders TO AccountRole


-------------------------
-- ADMIN ROLE
-------------------------

GRANT CONTROL
ON DATABASE::ECommerceDB
TO AdminRole


-------------------------
-- CREATE USERS
-------------------------

CREATE USER sales_user
FOR LOGIN sales_user

CREATE USER inventory_user
FOR LOGIN inventory_user

CREATE USER account_user
FOR LOGIN account_user

CREATE USER admin_user
FOR LOGIN admin_user


-------------------------
-- ADD USERS TO ROLES
-------------------------

ALTER ROLE SalesRole
ADD MEMBER sales_user

ALTER ROLE InventoryRole
ADD MEMBER inventory_user

ALTER ROLE AccountRole
ADD MEMBER account_user

ALTER ROLE AdminRole
ADD MEMBER admin_user

GO