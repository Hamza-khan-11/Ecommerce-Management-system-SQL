# E-Commerce Management System

## 📌 Project Overview
The **E-Commerce Management System** is a relational database project designed to streamline and manage the core operations of an online retail platform. It handles product management, customer data, order processing, and inventory control. This system addresses common issues found in decentralized systems by ensuring data integrity through a centralized database structure.

This project was developed as a Final Project for the **Database Management System (CT-261)** course.

## 🚀 Features
* **Centralized Data Management:** Efficiently stores and links customers, products, orders, and payments.
* **Normalized Schema:** The database is normalized up to the **Third Normal Form (3NF)** to reduce redundancy and ensure data consistency.
* **Inventory Control:** Tracks product quantities, types, and seller details.
* **Automated Logic:** Utilizes **Stored Procedures**, **Functions**, and **Triggers** to automate calculations (e.g., total cart cost) and enforce rules (e.g., preventing duplicate carts).
* **Financial Reporting:** Capabilities to calculate total profits and generate order summaries.

## 🛠️ Tech Stack
* **Language:** SQL (Structured Query Language)
* **Database Concept:** Relational Database Management System (RDBMS)
* **Key Concepts:** DDL, DML, Joins, Normalization, Stored Procedures, Triggers, Cursors.

## 🗂️ Database Schema
The system consists of the following key entities:

1.  **Customer:** Stores personal details and links to their active Cart.
2.  **Seller:** Manages seller profiles and locations.
3.  **Product:** Contains inventory details (Type, Color, Size, Cost, Commission).
4.  **Cart & Cart_item:** Manages the shopping cart functionality and items wished for by customers.
5.  **Purchase_Order & Order_Item:** Records confirmed orders and the specific items within them.
6.  **Payment:** Tracks payment transactions (Credit, Debit, Cash) linked to carts and customers.
7.  **Category:** Classification of products.

## 📊 Entity Relationship Diagram (ERD)
The database implements various relationships to ensure data integrity:
* **1:N (One-to-Many):** One Customer can have multiple Orders; One Seller can have multiple Products.
* **M:N (Many-to-Many):** Handled via bridge tables like `Cart_item` and `Order_Item`.
* **1:1 (One-to-One):** Each Customer is assigned one active Cart.

*(Note: You can view the full ERD in the `Report ecommerce management.docx` included in this repo).*

## ⚙️ Advanced SQL Implementations

### Stored Procedures
* `order_summary(order_id)`: Generates a detailed report of a specific order, including customer info and item breakdown.
* `cost_filter(cost, type)`: Uses a **Cursor** to filter products based on a price ceiling and category type.

### Functions
* `get_total_amount(order_id)`: Calculates the total monetary value of an order.
* `totalProducts(seller_id)`: Returns the inventory count for a specific seller.
* `numCartId(cart_id)`: Helper function to count items in a cart.

### Triggers
* `before_customer`: Ensures that a Customer is not assigned a duplicate or invalid Cart ID before insertion.
* `before_pay_up`: Automatically calculates and sets the `total_amount` in the Payment table based on the cart's contents before a payment record is created.

## 📥 Installation & Usage
1.  **Clone the Repository:**
    ```bash
    git clone [https://github.com/your-username/ecommerce-management-system.git](https://github.com/your-username/ecommerce-management-system.git)
    ```
2.  **Import the Database:**
    * Open your SQL tool (e.g., MySQL Workbench, phpMyAdmin).
    * Run the script `Ecommerce Management system Query.sql`.
    * This script will:
        1.  Create the database `Ecommerce_Management`.
        2.  Create all tables (DDL).
        3.  Insert sample dummy data (DML).
        4.  Define all Procedures, Functions, and Triggers.

3.  **Run Queries:**
    You can test the system using the provided procedure calls at the bottom of the SQL file:
    ```sql
    CALL order_summary('ord003');
    SELECT get_total_amount('ord003');
    ```

## 📝 Project Structure
* `Ecommerce Management system Query.sql`: The main source code containing the database schema and logic.
* `Report ecommerce management.docx`: Detailed documentation regarding normalization and ERD.
* `Company Internal Deck Presentation.pptx`: Project presentation slides.

## 👤 Author
**Muhammad Hamza Khan**
* **ID:** DT-22048 / DT-48
* **Course:** Database Management System (CT-261)

---
*This project is for educational purposes demonstrating robust database design principles.*