-- ==============================================================================
-- PROJECT     : Upstream Asset Portfolio Analytics
-- OBJECTIVE   : Technical Assessment for Reservoir & Production Analysis (Internship 2026)
-- TARGET CO   : PT Pertamina Hulu Energi (Fungsi D&P Technical Excellence)
-- ==============================================================================

-- ------------------------------------------------------------------------------
-- STAGE 1: DATABASE & TABLE INITIALIZATION
-- Creating a robust database schema with proper data types to prevent structural errors.
-- ------------------------------------------------------------------------------

CREATE TABLE ep_portfolio (
    field_id VARCHAR(10) PRIMARY KEY,
    field_name VARCHAR(50) NOT NULL,
    environment_type VARCHAR(20) NOT NULL,
    reserves_mmboe NUMERIC(5,1) NOT NULL,
    peak_production INT NOT NULL,
    capex_usd_million NUMERIC(6,1) NOT NULL,
    opex_usd_per_bbl NUMERIC(4,1) NOT NULL,
    project_irr NUMERIC(3,2) NOT NULL,
    payback_period_years NUMERIC(3,1) NOT NULL,
    project_npv_million NUMERIC(5,1) NOT NULL,
    feasibility_status VARCHAR(30) NOT NULL
);

-- ------------------------------------------------------------------------------
-- STAGE 2: DATA INGESTION (60 SYNTHETIC FIELDS)
-- Ingesting standardized unformatted text rows converted into clean numeric records.
-- ------------------------------------------------------------------------------

INSERT INTO ep_portfolio VALUES
('PHE-001','Alpha-01','Offshore',120.5,15000,450.0,18.5,0.22,4.2,310.5,'APPROVED FOR FID'),
('PHE-002','Alpha-02','Offshore',85.2,11000,380.0,19.0,0.19,5.1,145.2,'APPROVED FOR FID'),
('PHE-003','Alpha-03','Offshore',145.0,18500,520.0,17.8,0.25,3.8,420.8,'APPROVED FOR FID'),
('PHE-004','Alpha-04','Offshore',40.1,5000,210.0,22.5,0.06,9.9,-12.5,'REJECT / REDESIGN'),
('PHE-005','Alpha-05','Offshore',98.7,12500,410.0,18.9,0.21,4.5,210.3,'APPROVED FOR FID'),
('PHE-006','Alpha-06','Offshore',110.3,14000,440.0,18.2,0.23,4.0,285.6,'APPROVED FOR FID'),
('PHE-007','Alpha-07','Offshore',35.5,4200,195.0,24.0,0.05,9.5,-13.6,'REJECT / REDESIGN'),
('PHE-008','Alpha-08','Offshore',75.8,9500,320.0,19.5,0.16,5.8,85.4,'APPROVED FOR FID'),
('PHE-009','Alpha-09','Offshore',130.2,16800,490.0,18.0,0.24,3.9,375.2,'APPROVED FOR FID'),
('PHE-010','Alpha-10','Offshore',62.4,7800,280.0,20.5,0.14,6.5,45.1,'APPROVED FOR FID'),
('PHE-011','Beta-11','Onshore',55.0,6500,180.0,12.5,0.18,3.5,65.3,'APPROVED FOR FID'),
('PHE-012','Beta-12','Onshore',42.3,5000,145.0,13.2,0.15,4.2,32.4,'APPROVED FOR FID'),
('PHE-013','Beta-13','Onshore',90.5,11500,280.0,11.0,0.26,2.1,195.8,'APPROVED FOR FID'),
('PHE-014','Beta-14','Onshore',28.2,3100,110.0,14.5,0.06,9.2,-5.4,'REJECT / REDESIGN'),
('PHE-015','Beta-15','Onshore',68.4,8200,210.0,12.0,0.20,3.0,112.1,'APPROVED FOR FID'),
('PHE-016','Beta-16','Onshore',73.1,8900,225.0,11.8,0.22,2.8,135.6,'APPROVED FOR FID'),
('PHE-017','Beta-17','Onshore',22.0,2500,95.0,15.0,0.05,9.8,-8.2,'REJECT / REDESIGN'),
('PHE-018','Beta-18','Onshore',50.6,6000,165.0,12.8,0.17,3.8,51.2,'APPROVED FOR FID'),
('PHE-019','Beta-19','Onshore',88.0,11000,270.0,11.2,0.25,2.3,184.5,'APPROVED FOR FID'),
('PHE-020','Beta-20','Onshore',37.5,4500,135.0,13.6,0.13,4.8,18.9,'APPROVED FOR FID'),
('PHE-021','Mahakkam-21','Offshore',115.0,14200,435.0,18.4,0.22,4.1,290.4,'APPROVED FOR FID'),
('PHE-022','Mahakkam-31','Offshore',88.5,11200,390.0,18.8,0.19,5.0,156.9,'APPROVED FOR FID'),
('PHE-023','Mahakkam-23','Offshore',138.0,17900,510.0,17.9,0.24,3.9,395.2,'APPROVED FOR FID'),
('PHE-024','Mahakkam-24','Offshore',42.0,5200,215.0,22.3,0.06,9.9,-11.8,'REJECT / REDESIGN'),
('PHE-025','Mahakkam-25','Offshore',102.5,13000,420.0,18.6,0.22,4.3,230.1,'APPROVED FOR FID'),
('PHE-026','Mahakkam-26','Offshore',108.0,13800,430.0,18.3,0.23,4.1,275.4,'APPROVED FOR FID'),
('PHE-027','Mahakkam-27','Offshore',33.0,4000,190.0,24.5,0.05,9.6,-14.2,'REJECT / REDESIGN'),
('PHE-028','Mahakkam-28','Offshore',78.0,9800,330.0,19.3,0.17,5.6,95.2,'APPROVED FOR FID'),
('PHE-029','Mahakkam-29','Offshore',128.5,16500,485.0,18.1,0.24,4.0,365.8,'APPROVED FOR FID'),
('PHE-030','Mahakkam-30','Offshore',65.0,8000,290.0,20.2,0.15,6.2,55.3,'APPROVED FOR FID'),
('PHE-031','Jaguar-31','Onshore',58.0,6900,190.0,12.4,0.19,3.3,75.4,'APPROVED FOR FID'),
('PHE-032','Jaguar-32','Onshore',45.0,5300,150.0,13.0,0.16,4.0,40.1,'APPROVED FOR FID'),
('PHE-033','Jaguar-33','Onshore',93.0,11900,290.0,10.9,0.27,2.0,215.3,'APPROVED FOR FID'),
('PHE-034','Jaguar-34','Onshore',29.5,3300,115.0,14.3,0.06,9.1,-4.9,'REJECT / REDESIGN'),
('PHE-035','Jaguar-35','Onshore',71.0,8500,220.0,11.9,0.21,2.9,125.8,'APPROVED FOR FID'),
('PHE-036','Jaguar-36','Onshore',75.5,9200,230.0,11.6,0.23,2.7,148.2,'APPROVED FOR FID'),
('PHE-037','Jaguar-37','Onshore',24.0,2700,100.0,14.8,0.05,9.7,-7.5,'REJECT / REDESIGN'),
('PHE-038','Jaguar-38','Onshore',52.5,6200,170.0,12.7,0.18,3.6,58.4,'APPROVED FOR FID'),
('PHE-039','Jaguar-39','Onshore',91.0,11400,280.0,11.1,0.26,2.2,198.6,'APPROVED FOR FID'),
('PHE-040','Jaguar-40','Onshore',39.0,4700,140.0,13.4,0.14,4.6,24.5,'APPROVED FOR FID'),
('PHE-041','Sultan-41','Offshore',122.0,15200,455.0,18.4,0.22,4.2,320.1,'APPROVED FOR FID'),
('PHE-042','Sultan-42','Offshore',83.0,10800,375.0,19.1,0.18,5.2,135.4,'APPROVED FOR FID'),
('PHE-043','Sultan-43','Offshore',142.5,18200,515.0,17.8,0.25,3.8,410.2,'APPROVED FOR FID'),
('PHE-044','Sultan-44','Offshore',38.5,4800,205.0,22.7,0.06,9.9,-13.1,'REJECT / REDESIGN'),
('PHE-045','Sultan-45','Offshore',100.0,12700,415.0,18.7,0.21,4.4,220.5,'APPROVED FOR FID'),
('PHE-046','Sultan-46','Offshore',112.5,14300,445.0,18.1,0.23,4.0,298.3,'APPROVED FOR FID'),
('PHE-047','Sultan-47','Offshore',34.0,4100,192.0,24.2,0.05,9.6,-13.9,'REJECT / REDESIGN'),
('PHE-048','Sultan-48','Offshore',74.5,9300,315.0,19.6,0.16,5.9,80.1,'APPROVED FOR FID'),
('PHE-049','Sultan-49','Offshore',132.0,17000,495.0,18.0,0.24,3.9,385.4,'APPROVED FOR FID'),
('PHE-050','Sultan-50','Offshore',60.5,7600,275.0,20.6,0.14,6.6,40.2,'APPROVED FOR FID'),
('PHE-051','Delta-51','Onshore',60.0,7200,195.0,12.3,0.19,3.2,82.1,'APPROVED FOR FID'),
('PHE-052','Delta-52','Onshore',44.0,5100,148.0,13.1,0.16,4.1,36.8,'APPROVED FOR FID'),
('PHE-053','Delta-53','Onshore',95.0,12100,295.0,10.8,0.27,2.0,225.4,'APPROVED FOR FID'),
('PHE-054','Delta-54','Onshore',27.0,3000,108.0,14.6,0.06,9.3,-5.9,'REJECT / REDESIGN'),
('PHE-055','Delta-55','Onshore',70.0,8400,215.0,11.9,0.21,2.9,120.3,'APPROVED FOR FID'),
('PHE-056','Delta-56','Onshore',77.0,9400,235.0,11.5,0.24,2.6,155.7,'APPROVED FOR FID'),
('PHE-057','Delta-57','Onshore',25.0,2800,102.0,14.7,0.05,9.7,-7.1,'REJECT / REDESIGN'),
('PHE-058','Delta-04','Onshore',54.0,6400,172.0,12.6,0.18,3.5,62.1,'APPROVED FOR FID'),
('PHE-059','Delta-59','Onshore',92.5,11600,285.0,11.0,0.26,2.1,205.2,'APPROVED FOR FID'),
('PHE-060','Delta-60','Onshore',40.0,4800,142.0,13.3,0.14,4.5,27.8,'APPROVED FOR FID');

-- ------------------------------------------------------------------------------
-- STAGE 3: BUSINESS OBJECTIVES QUERY TRANSLATION
-- ------------------------------------------------------------------------------

-- OBJECTIVE 1 & 4: Macro Asset & CAPEX Allocation Analysis (Pivot Replication)
-- Purpose: Analyzes total asset distribution and macro operational expenditure trends.
SELECT 
    environment_type,
    COUNT(field_id) AS total_fields,
    SUM(capex_usd_million) AS total_capex_usd_million
FROM 
    ep_portfolio
GROUP BY 
    environment_type;


-- OBJECTIVE 2: Portfolio Baseline & Boundary Auditing (Descriptive Stats Replication)
-- Purpose: Extracts mathematical parameters to spot outlier fields and baseline averages.
SELECT 
    ROUND(AVG(reserves_mmboe), 1) AS avg_reserves_mmboe,
    MAX(project_npv_million) AS max_npv_usd_million,
    MIN(project_npv_million) AS min_npv_usd_million
FROM 
    ep_portfolio;


-- OBJECTIVE 3 (Part 1): Feasibility Screening Gate (Nested IF Replication)
-- Purpose: Programmatically tags asset viability based on economic thresholds.
SELECT 
    field_id,
    field_name,
    environment_type,
    project_npv_million,
    CASE 
        WHEN project_npv_million > 0 THEN 'APPROVED FOR FID'
        ELSE 'REJECT / REDESIGN'
    END AS simulated_feasibility_status
FROM 
    ep_portfolio
ORDER BY 
    project_npv_million DESC;


-- OBJECTIVE 3 (Part 2): Dynamic Field Profile Query (VLOOKUP / INDEX-MATCH Replication)
-- Purpose: Emulates user-driven search cell input (e.g., Target Field ID: PHE-022).
SELECT 
    field_id,
    field_name,
    environment_type,
    project_npv_million AS npv_usd_million
FROM 
    ep_portfolio
WHERE 
    field_id = 'PHE-022';
