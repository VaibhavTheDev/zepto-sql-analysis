# 🛒 Zepto SQL Data Analysis Project

## 📌 Project Overview

This project analyzes product data from a Zepto-like e-commerce dataset using SQL. It includes data cleaning, exploration, and business insights.

---

## 🧰 Tools Used

* PostgreSQL
* DBeaver
* GitHub

---

## 📂 Project Structure

```
zepto-sql-analysis/
│
├── sql/
│   ├── 01_create_table.sql
│   ├── 02_data_cleaning.sql
│   ├── 03_analysis_queries.sql
│
└── README.md
```

---

## 🔧 Steps Performed

### 1. Data Cleaning

* Removed products with zero price
* Converted values from paise to rupees

### 2. Data Exploration

* Checked null values
* Identified duplicate products
* Analyzed product categories

### 3. Business Analysis

* Top discounted products
* High MRP out-of-stock products
* Revenue by category
* Price per gram analysis
* Inventory distribution

---

## 📊 Key SQL Queries

### 🔹 Top 10 Best Discounted Products

```sql
SELECT DISTINCT name, mrp, discountPercent
FROM zepto
ORDER BY discountPercent DESC
LIMIT 10;
```

---

## 🚀 How to Run

1. Run `01_create_table.sql`
2. Import dataset into PostgreSQL
3. Run `02_data_cleaning.sql`
4. Run `03_analysis_queries.sql`

---

## 📌 Author

Vaibhav Erulkar
