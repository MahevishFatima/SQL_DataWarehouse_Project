# Data Warehouse and Analytics Project
Building a modern data warehouse with SQL Server, including ETL Processes, data modelling and analytics.

# 🏗️ SQL Data Warehouse Project — End-to-End Architecture

## 👋 Welcome!
Welcome to my **SQL Data Warehouse Project**!  
This project showcases how to design, build, and document a complete **data warehouse architecture** using SQL Server — from raw data ingestion to clean, business-ready data layers.

---

<img width="867" height="605" alt="image" src="https://github.com/user-attachments/assets/56ecc5de-2835-4bdb-905a-5c322e61f0a8" />


## 📖 Project Description
In this project, I designed and implemented a **three-tiered data warehouse** based on industry best practices.  
The architecture follows the **Bronze–Silver–Gold** data layering model:

### 🥉 Bronze Layer
- **Purpose:** Store raw data as received from source systems.  
- **Object Type:** Table  
- **Load Type:** Batch (Full Load)  
- **Transformations:** None  
- **Data Model:** None (as-is)

### 🥈 Silver Layer
- **Purpose:** Contain cleaned, standardized, and validated data.  
- **Object Type:** Table   
- **Load Type:** Batch (Full Load)  
- **Transformations:** Cleaning, Standardization, Normalization, Enrichment, Derived Columns
- **Data Model:** None (as-is)  

### 🥇 Gold Layer
- **Purpose:** Provide business-ready, aggregated data for analytics.  
- **Object Type:** Views  
- **No Load **   
- **Transformations:** Integration, Aggregations, Joins, Business Logic  
- **Data Model:** Star Schema (Dimensional (Facts & Dimensions)), Aggregated Tables

The **Consumer Layer** serves BI and analytics tools like **Power BI**, **Tableau**, or **direct SQL queries** for ad-hoc analysis and machine learning use cases.

---

## 🧩 Data Modeling
To organize and optimize data, two popular schema designs were implemented:

### ⭐ Star Schema
A simple, denormalized structure where fact tables connect to dimension tables.  
- Fast querying  
- Ideal for dashboards & reports  
- Easy to understand for business users  

### ❄️ Snowflake Schema
A normalized version of the star schema where dimensions are broken into sub-dimensions.  
- Reduces redundancy  
- Improves data integrity  
- Better for complex analytical systems  

These schemas are essential in **data warehousing** to represent **fact and dimension tables** — enabling efficient reporting, metrics tracking, and BI insights.

---

## 🧠 Key Concepts Covered
- Data Warehouse Fundamentals  
- ETL (Extract, Transform, Load) Concepts  
- Data Modeling (Star & Snowflake)  
- Layered Architecture Design (Bronze–Silver–Gold)  
- SQL Server Implementation  
- Visualization Integration (Power BI / Tableau)

---

## ⚙️ Project Requirements
To build or run this project, you’ll need:

- **SQL Server Express**  
- **SQL Server Management Studio (SSMS)** 
- **Draw.io** (for architecture diagrams)
- **Notion** Get the Project Template from Notion
- **[Notion Project Steps](https://www.notion.so/SQL-Data-Warehouse-Project-2885f89bd8bf800686b4ea4a65137eb7?source=copy_link)** Access to All Project Phases and Tasks.
- **Power BI / Tableau** (optional for visualization)  
- Basic understanding of SQL & data modeling  

---

## 🙏 A Special Thank You
A huge **thank you to [Data with Baraa](https://www.youtube.com/@DataWithBaraa)** 🎥  
for his amazing educational content and walkthroughs on data engineering and SQL warehouse projects.  
His videos played a major role in helping me understand and structure this entire project step by step.  
This project is inspired by his teachings and adapted to strengthen my hands-on data engineering skills.  

---

## 🙋 About Me
Hi there! 👋  
I’m a **data enthusiast** passionate about transforming raw information into meaningful insights through **data engineering and analytics**.  
This project reflects my learning journey into **data warehousing**, **SQL-based ETL**.  

If you found this helpful, feel free to ⭐ star the repo or connect with me on [LinkedIn](https://www.linkedin.com/in/mahevish)! 🚀  

