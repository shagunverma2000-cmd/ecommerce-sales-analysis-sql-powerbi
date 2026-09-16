# 🛒 E-Commerce Sales & Customer Analysis — SQL Project

## 📌 Project Overview

This project focuses on analyzing an **e-commerce transactional dataset using SQL** to extract meaningful business insights related to customers, products, orders, sales performance, and customer purchasing behavior.

The analysis was performed using **MySQL**, with data organized into four relational tables:

* `Customers`
* `Products`
* `Orders`
* `OrderDetails`

The project demonstrates practical SQL skills including **data exploration, table relationships, joins, aggregations, filtering, grouping, sorting, and business-oriented analysis**.

---

## 🎯 Business Objective

The primary objective of this project is to use SQL to answer important business questions such as:

* How are customers and orders distributed?
* Which products generate higher sales?
* What are the overall sales trends?
* Which customers contribute significantly to revenue?
* How do different products perform based on order quantity and sales?
* How can transactional data be transformed into actionable business insights?

---

## 🗂️ Dataset Structure

The project contains four main tables:

### 1. Customers

Contains customer-level information used to understand the customer base.

**Key field:**

* `customer_id`

### 2. Products

Contains information about the products available for purchase.

**Key field:**

* `product_id`

### 3. Orders

Contains order-level transactional information.

**Key field:**

* `order_id`
* `customer_id`

### 4. OrderDetails

Contains details of products included in each order.

**Key fields:**

* `order_id`
* `product_id`

These tables are connected through relational keys, allowing customer, order, and product-level analysis.

---

## 🔗 Data Relationships

The major relationships used during analysis are:

```text
Customers
    │
    │ customer_id
    ▼
  Orders
    │
    │ order_id
    ▼
OrderDetails
    │
    │ product_id
    ▼
 Products
```

This relational structure allows the analysis to combine information across multiple tables using SQL `JOIN` operations.

---

## 🛠️ Tools & Technologies

* **MySQL**
* **SQL**
* Relational Database Concepts
* Git & GitHub

---

## 🔍 Analysis Performed

### Data Exploration

The project begins with understanding the structure of each table using commands such as:

```sql
DESCRIBE customers;
DESCRIBE Products;
DESCRIBE Orders;
DESCRIBE OrderDetails;
```

This helped identify columns, data types, and the structure of the available data.

---

### Data Cleaning

Column names were checked and corrected where required to ensure consistent SQL querying.

Example:

```sql
ALTER TABLE customers
RENAME COLUMN customer_id TO customer_id;
```

The dataset was then prepared for further analysis.

---

### Customer Analysis

Customer-level analysis was performed to understand:

* Number of customers
* Customer ordering activity
* Customer purchase behavior
* Customer contribution to sales

---

### Product Analysis

Product-level analysis focused on:

* Product performance
* Quantity sold
* Sales contribution
* Identification of products with higher transaction activity

---

### Order Analysis

Order-level analysis examined:

* Number of orders
* Order distribution
* Order-level sales information
* Relationship between customers and their orders

---

### Sales Analysis

Aggregations were used to calculate and compare sales-related metrics.

Common SQL techniques used include:

```sql
SUM()
COUNT()
AVG()
GROUP BY
ORDER BY
```

These operations were combined with joins to generate business-level insights.

---

## 🧠 SQL Concepts Demonstrated

This project demonstrates practical usage of:

* `CREATE DATABASE`
* `USE`
* `DESCRIBE`
* `ALTER TABLE`
* `SELECT`
* `WHERE`
* `GROUP BY`
* `HAVING`
* `ORDER BY`
* `DISTINCT`
* Aggregate functions
* `INNER JOIN`
* Multi-table joins
* Aliases
* Conditional filtering
* Business-oriented SQL analysis

---

## 📊 Business Questions

The SQL analysis is designed around questions such as:

1. How many customers are present in the database?
2. How many orders have been placed?
3. Which products have the highest sales activity?
4. Which customers have placed the most orders?
5. What is the total sales generated?
6. Which products contribute most to overall sales?
7. What is the average order value?
8. How does customer purchasing behavior vary?
9. How can multiple relational tables be combined to generate business insights?

---

## 📈 Key Learning Outcomes

Through this project, I strengthened my ability to:

* Work with relational databases
* Understand relationships between multiple tables
* Write SQL queries for business problems
* Combine multiple datasets using joins
* Apply aggregation functions to transactional data
* Convert raw transactional data into meaningful metrics
* Approach SQL problems from a business perspective

---

## 📁 Repository Structure

```text
eCommerce-SQL-Analysis/
│
├── Customers.csv
├── Products.csv
├── Orders.csv
├── OrderDetails.csv
│
├── eCommerce_analysis.sql
│
└── README.md
```

> The exact filenames may vary depending on the files uploaded to the repository.

---

## 🚀 How to Run the Project

### Step 1 — Create the database

```sql
CREATE DATABASE eCommerce_db;
```

### Step 2 — Select the database

```sql
USE eCommerce_db;
```

### Step 3 — Create and load the tables

Load the four dataset files into their respective tables:

* Customers
* Products
* Orders
* OrderDetails

### Step 4 — Run the SQL analysis

Open the SQL analysis file and execute the queries sequentially.

---

## 💼 Skills Demonstrated

**SQL | MySQL | Data Analysis | Data Cleaning | Relational Databases | Joins | Aggregations | Business Analysis | GitHub**

---

## 👤 Author

**Shagun Verma**

Aspiring Data Analyst | SQL | Excel | Python | Power BI

GitHub: `shagunverma2000-cmd`
