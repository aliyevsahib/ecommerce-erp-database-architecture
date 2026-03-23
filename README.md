# ecommerce-erp-database-architecture
An end-to-end enterprise ERP database simulation built in MySQL. Features robust architecture, ACID transactions, advanced analytics, B-Tree index optimisation, and role-based security views.

# Enterprise E-Commerce ERP: Database Architecture & Analytics

## 📌 Executive Summary
This project is an end-to-end simulation of an enterprise-level e-commerce ERP backend (Logix ERP). Moving beyond basic data analysis, this repository demonstrates full-stack database engineering: from raw data ingestion and strict relational architecture to engine optimisation, ACID-compliant transactions, and role-based security. 

The database processes over **100,000+ rows** of real-world Brazilian e-commerce data (Olist), transforming a massive CSV heap into a highly optimised, query-ready business intelligence engine.

## 🏗️ The Architecture & Pipeline
This project is structured chronologically to reflect a real-world database build:

* **Phase 1: Architecture (DDL)** - Built a normalised relational schema with strict `PRIMARY KEY` and `FOREIGN KEY` constraints. Bypassed GUI limitations by engineering bulk data ingestion pipelines using `LOAD DATA INFILE`.
* **Phase 2: Business Logic (TCL & Routines)** - Developed `Stored Procedures` to automate complex joins. Engineered `START TRANSACTION` and `ROLLBACK` safety nets to guarantee ACID compliance and prevent orphaned financial records during order creation.
* **Phase 3: Advanced Analytics (DQL)** - Extracted high-level executive business intelligence using aggregations, multi-step **Common Table Expressions (CTEs)**, and complex **Window Functions** (`OVER(PARTITION BY)`).
* **Phase 4: Engine Optimisation** - Utilised the `EXPLAIN` execution plan to identify a crippling Full Table Scan (99,000+ rows). Engineered a physical **B-Tree Index** to reduce query read loads to exactly the required rows, dropping execution time to sub-milliseconds.
* **Phase 5: Security Fortification (DCL)** - Secured sensitive vault data (like customer zip codes) by building role-specific SQL **Views** (Virtual Tables) for the marketing department.

## 📂 Repository Structure

* `📁 01_Architecture_and_Data_Load/` - Table creation schemas and bulk CSV ingestion scripts.
* `📁 02_Business_Logic_and_Transactions/` - Stored procedures and rollback-protected transaction blocks.
* `📁 03_Advanced_Analytics/` - BI queries utilising CTEs, Grouping, and Window Functions.
* `📁 04_Optimization_and_Security/` - B-Tree Index creation and SQL View definitions.

## 💡 Key Technical Achievements
* **Dynamic Window Functions:** Allowed executives to view individual product prices alongside category averages without crushing the underlying row data.
* **Multi-Step CTEs:** Filtered high-value VIP customers (>$1,000 spend) and elite vendors (>$200,000 revenue) by changing the shape of the data before applying conditional logic.
* **Algorithmic Search Optimisation:** Transitioned the engine from `ALL` (Full Table Scan) to `ref` (Index Lookup), proving that an independent developer engineers for speed, not just syntax.
