# 🛒 Olist E-Commerce — End to End Data Analysis

## 📌 Project Overview
Analysis of 100,000+ real orders from Olist, a Brazilian e-commerce platform.
The goal was to extract actionable business insights across payments, products,
geography, delivery performance and revenue growth.

## 🛠️ Tools Used
| Tool | Purpose |
|------|---------|
| Python (Pandas, Matplotlib, Seaborn) | Data cleaning & EDA |
| MySQL | Business queries & analysis |
| Excel | Reporting & charts |
| Power BI | Interactive dashboard |

## 📁 Project Structure

## 🔍 Dataset
- **Source:** Kaggle — Brazilian E-Commerce Public Dataset by Olist
- **Size:** 100,000+ orders across 8 tables
- **Period:** September 2016 — August 2018

## 📊 Key Findings

### 💳 Payments
- Credit card drives **78% of total revenue**
- Average order value: **R$160.99**

### 🏆 Product Categories
- **Health & Beauty** is the top revenue category at R$1.25M
- **Watches & Gifts** generates similar revenue with half the orders — premium buyers
- Top revenue categories are NOT the highest rated — quality gap exists

### 🗺️ Geography
- **São Paulo** generates 37% of total revenue
- Northeast states have **higher average order values** despite lower volume
- **Alagoas** has the worst late delivery rate at 23.93%

### 📦 Delivery
- **93.2%** of orders delivered on time or early
- Late deliveries concentrated in **Northeast Brazil**
- Average early delivery: 13.5 days ahead of schedule

### 📈 Growth
- Grew from **3 orders** in Sept 2016 to **7,000+ orders/month** by 2018
- **2,000x growth** in just 18 months
- Biggest spike: **November 2017** — Black Friday

## 💡 Recommendations
1. **Build a loyalty program** — only 3.1% of customers return
2. **Improve Northeast logistics** — Alagoas has 24% late delivery rate
3. **Investigate quality** in health & beauty — high revenue but average reviews
4. **Target São Paulo** with premium marketing campaigns

## 🚀 How to Run
1. Clone this repository
2. Open `notebooks/olist_eda.ipynb` in Jupyter
3. Run all cells in order
4. Open `sql/queries.sql` in MySQL Workbench
5. Open `reports/olist_dashboard.pbix` in Power BI Desktop

## 👤 Author
Duaa Suqaina
https://www.linkedin.com/in/duaa-s-4775b8208/
