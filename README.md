# 🛒 E-Commerce Database System (SQL Server)

## 📌 Project Overview
This project represents a full database design and implementation for an E-Commerce system using Microsoft SQL Server.

The system manages customers, products, orders, payments, shipping, and product reviews.  
It includes advanced database features such as triggers, stored procedures, backup strategies, and role-based security.

---

## 🧱 Database Features

### 📊 Tables
The database contains the following main tables:

- Customers
- Products
- Categories
- Orders
- OrderItems
- Payments
- Shipping
- Reviews
- Product_Audit

All tables are linked using **Primary Keys** and **Foreign Keys** to maintain data integrity.

---

## ⚙️ Triggers

The system includes automatic triggers to manage product stock:

- **Check_Stock_Before_Order**
  - Prevents ordering products with insufficient stock.

- **Reduce_Stock_After_Order**
  - Automatically decreases stock after placing an order.

- **Restore_Stock_After_Delete**
  - Restores stock when order items are deleted.

---

## 🧠 Stored Procedures

### Create_New_Order
Creates a new order and automatically inserts order items.

Features:
- Retrieves product price
- Creates new order
- Inserts order item
- Supports automated workflow

---

## 🔐 Security Implementation

Role-based security was implemented using:

- SalesRole
- InventoryRole
- AccountRole
- AdminRole

Each role has specific permissions to ensure controlled access.

Users created:

- sales_user
- inventory_user
- account_user
- admin_user

---

## 💾 Backup Strategy

Implemented a full backup system including:

- Full Backup
- Differential Backup
- Transaction Log Backup
- Restore Process

Maintenance Plans were configured for automated backups.

---

## 📂 Project Files

- 01_Tables.sql → Database structure
- 02_Insert_Data.sql → Sample data
- 03_Triggers.sql → Database triggers
- 04_Procedures.sql → Stored procedures
- 05_Backup_Restore.sql → Backup & Restore scripts
- 06_Security.sql → Users & Roles
- ERD.png → Database diagram

---

## 🛠️ Tools Used

- Microsoft SQL Server
- SQL Server Management Studio (SSMS)

---

## 📈 Skills Demonstrated

- Database Design
- SQL Development
- Triggers
- Stored Procedures
- Backup & Restore
- Security Management
- ERD Modeling

---

## 📷 ERD Diagram

(Insert ERD image here)

---

## 👨‍💻 Author

Developed by:
**Youssef Shahat Sayed**

SQL Server Database Project