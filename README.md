# Data Warehouse and Analytics Project
Building a modern data warehouse with SQL Server, including ETL Processes, data modelling and analytics.

# 🏗️ SQL Data Warehouse Project — End-to-End Architecture

## 👋 Welcome!
Welcome to my **SQL Data Warehouse Project**!  
This project showcases how to design, build, and document a complete **data warehouse architecture** using SQL Server — from raw data ingestion to clean, business-ready data layers.

---

<img width="867" height="605" alt="image" src="https://github.com/user-attachments/assets/56ecc5de-2835-4bdb-905a-5c322e61f0a8" />

---

## 📖 Project Overview
This project involves:  

- 🏗️ **Data Architecture:** Designing a Modern Data Warehouse using the **Medallion Architecture (Bronze, Silver, and Gold layers)**.  
- ⚙️ **ETL Pipelines:** Extracting, transforming, and loading data from source systems into the warehouse.  
- 📊 **Data Modeling:** Developing **fact and dimension tables** optimized for analytical queries.  
- 📈 **Analytics & Reporting:** Creating **SQL-based reports** and dashboards for actionable insights.  

🎯 This repository is an excellent resource for professionals and students looking to showcase expertise in:  
- SQL Development  
- Data Architecture  
- Data Engineering  
- ETL Pipeline Development  
- Data Modeling  
- Data Analytics  

---

## 🛠️ Important Links & Tools
Everything used here is **free** and beginner-friendly:  

- **Datasets:** Access to the project datasets (CSV files).  
- **SQL Server Express:** Lightweight database server for hosting your SQL database.  
- **SQL Server Management Studio (SSMS):** GUI for managing and querying your databases.  
- **GitHub Repository:** For version control and collaboration.  
- **Draw.io:** Design your data architecture diagrams, data models, and process flows.  
- **Notion:** Manage project documentation and access the full project template & task list.  

---

## 🚀 Project Requirements  

### 🧱 Building the Data Warehouse (Data Engineering)  

**Objective:**  
Develop a **modern data warehouse** using SQL Server to consolidate **sales data**, enabling analytical reporting and informed decision-making.  

**Specifications:**  
- **Data Sources:** Import data from two systems — ERP and CRM — provided as CSV files.  
- **Data Quality:** Cleanse and resolve inconsistencies before loading data.  
- **Integration:** Combine both sources into a single, user-friendly analytical model.  
- **Scope:** Focus on the latest dataset only (no historization required).  
- **Documentation:** Provide clear data model documentation for both technical and business users.  

---

### 📊 BI: Analytics & Reporting (Data Analysis)  

**Objective:**  
Develop SQL-based analytics to deliver insights into:  
- Customer Behavior  
- Product Performance  
- Sales Trends  

These insights enable stakeholders to make **data-driven business decisions** based on reliable, consolidated data.  

📁 For more details, refer to:  
`docs/requirements.md`  

---

## 🧩 Data Architecture Design  

The data warehouse follows the **Medallion Architecture**, consisting of three structured layers:  

### 🥉 Bronze Layer  
- **Stores:** Raw data as received from source systems.  
- **Purpose:** Preserve original data for auditing and recovery.  

### 🥈 Silver Layer  
- **Stores:** Cleaned and standardized data.  
- **Purpose:** Apply transformations, deduplication, and normalization.  

### 🥇 Gold Layer  
- **Stores:** Aggregated, business-ready data.  
- **Purpose:** Enable advanced analytics, dashboards, and reporting.  

---

## 💡 Data Modeling  

### ⭐ Star Schema  
A **denormalized** model with a central **Fact Table** surrounded by **Dimension Tables**.  
- Simple and fast for querying and reporting.  
- Ideal for dashboards and KPIs.  

### ❄️ Snowflake Schema  
A **normalized** extension of the star schema.  
- Reduces redundancy and improves data integrity.  
- Suitable for complex analytical systems.  

---

## 🙏 A Special Thank You
A huge **thank you to [Data with Baraa](https://www.youtube.com/@DataWithBaraa)** 🎥  
for his amazing educational content and walkthroughs on data engineering and SQL warehouse projects.  
His videos played a major role in helping me understand and structure this entire project step by step.  
This project is inspired by his teachings and adapted to strengthen my hands-on data engineering skills.  

---

## 🛡️ License  
This project is licensed under the **MIT License**.  
You are free to use, modify, and share this project with proper attribution.  

---

## 🙋 About Me
Hi there! 👋  
I’m a **data enthusiast** passionate about transforming raw information into meaningful insights through **data engineering and analytics**.  
This project reflects my learning journey into **data warehousing**, **SQL-based ETL**.  

If you found this helpful, feel free to ⭐ star the repo or connect with me on [LinkedIn](https://www.linkedin.com/in/mahevish)! 🚀  

