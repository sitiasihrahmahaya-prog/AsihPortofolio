# Upstream Oil & Gas Production Performance Analytics

## Project Overview
This project demonstrates an **End-to-End Data Analytics workflow** in the upstream Oil & Gas sector. The primary objective was to ingest a raw, unhygienic dataset containing daily production logs, clean it using enterprise-grade SQL strategies in **Google Cloud BigQuery**, and transform the structured results into an interactive executive dashboard via **Google Looker Studio**.

The final solution successfully resolves critical data integrity anomalies (such as negative volumes and missing metadata) and establishes an automated tracking mechanism for asset performance and operational risk identification.

---

## Tech Stack & Skills Demonstrated
* **Data Warehousing & Processing:** Google Cloud BigQuery (SQL)
* **Business Intelligence & Visualization:** Google Looker Studio
* **Core Analytics Skills:** Data Cleansing, Handling Missing/Negative Values, Data Transformation, Structural Aggregations, Performance Benchmarking, and Operational Risk Sifting.

---

## Business & Operational Insights Discovered

1. **Production Overview:** Validated and consolidated a stable total production baseline of **19,962 BBL/D** across all operational fields, establishing a reliable "single source of truth" for management reporting.
2. **Operator Performance:** **Chevron** leads the registered operators with a total output of **5,491 BBL/D**, followed closely by Medco (**4,220 BBL/D**) and Pertamina (**3,881 BBL/D**).
3. **Data Integrity Alert:** Detected a significant governance issue where the single largest production block (**6,371 BBL/D**) is categorized under an **Unknown Operator**. This highlights immediate field-logging or metadata-entry gaps that require an administrative audit.
4. **Operational Risk Sifting:** Engineered an automated filtering matrix that isolated **13 critical wells** suffering from severe water breakthrough (**Water Cut > 75%**), with worst-performers like *Well-Iota* and *Well-Sigma* exceeding 95%. These wells are producing heavily disproportionate volumes of water relative to crude oil, serving as an immediate flag for engineering interventions or shut-in evaluations.

---

## SQL Queries implemented (BigQuery)

Below are the structured SQL scripts used throughout the project milestones to clean and aggregate the dataset:

```
-- =====================================================================
-- OBJECTIVE 1: Data Cleansing & Preparation
-- Eliminating negative values, duplicates, and safeguarding NULL entries
-- =====================================================================
CREATE OR REPLACE TABLE `project-migas.id_produksi.produksi_clean` AS 
SELECT 
    well_id,
    well_name,
    region,
    -- Rectifying metadata omission
    CASE 
        WHEN operator IS NULL OR operator = '' THEN 'Unknown Operator'
        ELSE operator 
    END AS operator,
    well_depth_meters,
    well_status,
    -- Correcting erroneous negative daily oil production figures
    CASE 
        WHEN daily_oil_production_bbl < 0 THEN 0
        WHEN daily_oil_production_bbl IS NULL THEN 0
        ELSE daily_oil_production_bbl 
    END AS daily_oil_production_bbl,
    -- Protecting water cut percentages bounds
    CASE 
        WHEN water_cut_percentage < 0 THEN 0
        WHEN water_cut_percentage > 100 THEN 100
        ELSE COALESCE(water_cut_percentage, 0)
    END AS water_cut_percentage
FROM 
    `project-migas.id_produksi.produksi_raw`;

-- =====================================================================
-- OBJECTIVE 2 & 3: Performance Benchmarking & High-Level Aggregations
-- Summarizing global production limits and sorting by Operator share
-- =====================================================================
SELECT 
    operator,
    COUNT(DISTINCT well_id) AS total_active_wells,
    ROUND(SUM(daily_oil_production_bbl), 2) AS total_oil_production_bbl_d
FROM 
    `project-migas.id_produksi.produksi_clean`
GROUP BY 
    operator
ORDER BY 
    total_oil_production_bbl_d DESC;

-- =====================================================================
-- OBJECTIVE 4: Operational Efficiency & Risk Mitigation Isolation
-- Automating the extraction of high risk, high water-cut wells (>75%)
-- =====================================================================
SELECT 
    well_id,
    well_name,
    operator,
    water_cut_percentage,
    daily_oil_production_bbl
FROM 
    `project-migas.id_produksi.produksi_clean`
WHERE 
    water_cut_percentage > 75
ORDER BY 
    water_cut_percentage DESC;
```
---

## Interactive Executive Dashboard

The transformed data streams directly into Looker Studio, rendering a clean, multi-layered visual layout designed for executive decision-making:

* **KPI Core:** Tracks real-time global volumes (**19,962 BBL/D**).
* **Operator Share Breakdown:** Bar chart contrasting volume ownership.
* **Risk Control Panel:** An automated alarm matrix locking down the 13 volatile wells with critical water breakthroughs.

📌 **[Click Here to View the Interactive Looker Studio Dashboard](
(https://datastudio.google.com/reporting/dbc296c7-ef42-48ff-a1ed-c1cc3e6e09ef))**

---
*Developed as part of an end-to-end Data Analytics Portfolio project.*
