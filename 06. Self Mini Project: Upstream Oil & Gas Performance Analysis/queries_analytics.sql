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
