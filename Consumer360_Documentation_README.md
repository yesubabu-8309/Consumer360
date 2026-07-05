# Consumer360: Enterprise Retail Analytics Platform

Consumer360 is an enterprise-grade data engineering and analytics platform that transforms messy retail transactional logs into deep customer behavior insights. It combines data cleaning pipelines, structural relational database management, data science modeling, and corporate BI dashboards into a unified system.

## 🌟 Core System Highlights
* **High-Speed Data Ingestion:** Uses a custom Python preprocessing pipeline and server-native database loaders (`LOAD DATA INFILE`) to ingest hundreds of thousands of raw rows in seconds.
* **Advanced Data Science Engines:** Implements Python notebooks for multi-axis customer grouping (RFM), lifecycle cohort analysis, predictive customer value tracking (CLV), and product affinity discovery (Market Basket Analysis).
* **Enterprise Business Intelligence:** Features optimized database views linked directly to interactive Power BI dashboards for fast, real-time KPI tracking.

## 📂 System Architecture Blueprint

```
 ┌────────────────┐      ┌────────────────┐      ┌────────────────┐
 │  Raw Data Log  │ ───> │ Ingestion Loop │ ───> │ Unified Staging│
 │ (latin1 files) │      │ (Pandas Engine)│      │  (utf-8 CSV)   │
 └────────────────┘      └────────────────┘      └────────────────┘
                                                                 │
                                                                 ▼
 ┌────────────────┐      ┌────────────────┐      ┌────────────────┐
 │ Pristine View  │ <─── │ Cleaning Layer │ <─── │ Relational DB  │
 │ (Target Table) │      │ (SQL Validation)      │(LOAD DATA Loop)│
 └────────────────┘      └────────────────┘      └────────────────┘
         │
         ├───> [Python Modeling Cluster] ───> RFM / Cohorts / Predictive CLV
         │
         └───> [Enterprise DB Views] ─────> Power BI Dashboard Presentation
```

## 🛠️ Infrastructure Components
* **Data Processing:** Python 3.x, Pandas Core Engine
* **Database Layer:** MySQL Server Instance v8.0+, Relational SQL Schemas & Database Views
* **Analytics Engine:** SQLAlchemy Database Engine, Lifetimes Statistical Framework, MLxtend (Apriori Framework)
* **Visualization Layer:** Microsoft Power BI Desktop (`.pbix` Model), DAX Multi-Dimensional Modeling

---

## 🚀 Step-by-Step Installation & Deployment Guide

### Phase 1: Preprocessing & Data Standarization
1. Open a terminal inside the project directory and install the required dependencies:
   ```bash
   pip install pandas numpy sqlalchemy pymysql mlxtend lifetimes
   ```
2. Run the ingestion notebook to resolve character encoding issues and convert the raw files into a standardized format:
   ```bash
   jupyter notebook xlx_to_csv.ipynb
   ```

### Phase 2: Database Initialization & Data Loading
1. Log into your local MySQL command-line client or workbench interface:
   ```sql
   mysql -u root -p
   ```
2. Execute the initialization scripts in sequence to set up the database and ingest the clean staging data:
   ```sql
   SOURCE 01_CreateDatabase.sql;
   SOURCE 02_CreateTable.sql;
   SOURCE 03_LoadData.sql;
   ```

### Phase 3: Data Quality & Structural Cleaning
1. Run the data validation routines to isolate incomplete rows and log order cancellations:
   ```sql
   SOURCE 04_DataCleaning.sql;
   ```
2. Build the optimized database views to prepare the clean data for reporting:
   ```sql
   SOURCE Views.sql;
   ```

### Phase 4: Running the Advanced Analytics Engines
1. Open the analytics notebooks using your Jupyter interface:
   ```bash
   jupyter notebook
   ```
2. Run the notebooks in sequence to calculate customer segments, retention matrices, value predictions, and product affinities:
   * `RFM_Analysis.ipynb` — Customer segmentation scoring
   * `Cohort_Analysis.ipynb` — Lifecycle retention patterns
   * `CLV_model.ipynb` — Forward-looking value projections
   * `Market_Basket_Analasys.ipynb` — Product relationship mining

### Phase 5: Dashboard Visualization Deployment
1. Launch Microsoft Power BI Desktop.
2. Open the file `Consumer360.pbix`.
3. Click **Refresh** to pull the latest data from your local MySQL instance and update the interactive dashboards.
