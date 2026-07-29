-- ===================================================================
-- TOKOPAEDI E-COMMERCE ANALYTICS - FINAL PROJECT SQL
-- Dataset: Tokopaedi E-Commerce Database (2020 - 2024)
-- Description: Analytics queries for sales trends, category performance,
--              channel analysis, marketing funnels, and customer cohorts.
-- ===================================================================


-- -------------------------------------------------------------------
-- CASE 1: Monthly Sales Trend (2024)
-- Objective: Mengetahui pola tren revenue bulanan di tahun 2024.
-- -------------------------------------------------------------------
SELECT 
    EXTRACT(MONTH FROM order_date) AS month,
    TO_CHAR(order_date, 'Month') AS month_name,
    SUM(total_amount) AS total_revenue
FROM 
    orders
WHERE 
    EXTRACT(YEAR FROM order_date) = 2024
    AND order_status = 'Completed' -- Mengambil transaksi valid/selesai
GROUP BY 
    1, 2
ORDER BY 
    1 ASC;


-- -------------------------------------------------------------------
-- CASE 2: Total Quantity Sold per Category (2020 - 2024)
-- Objective: Mengevaluasi volume unit barang terjual per kategori tiap tahun.
-- -------------------------------------------------------------------
SELECT 
    EXTRACT(YEAR FROM o.order_date) AS year,
    p.category,
    SUM(oi.quantity) AS total_qty_sold
FROM 
    orders o
JOIN 
    order_items oi ON o.order_id = oi.order_id
JOIN 
    products p ON oi.product_id = p.product_id
WHERE 
    o.order_status = 'Completed'
    AND EXTRACT(YEAR FROM o.order_date) BETWEEN 2020 AND 2024
GROUP BY 
    1, 2
ORDER BY 
    1 ASC, 
    total_qty_sold DESC;


-- -------------------------------------------------------------------
-- CASE 3: Sales Channel Performance & YoY Revenue Growth
-- Objective: Membandingkan performa transaksi, total revenue, dan AOV antar channel.
-- -------------------------------------------------------------------
SELECT 
    s.channel_name,
    EXTRACT(YEAR FROM o.order_date) AS year,
    COUNT(DISTINCT o.order_id) AS total_orders,
    SUM(o.total_amount) AS total_revenue,
    SUM(o.total_amount) / COUNT(DISTINCT o.order_id) AS average_order_value (aov)
FROM 
    orders o
JOIN 
    sales_channels s ON o.channel_id = s.channel_id
WHERE 
    o.order_status = 'Completed'
GROUP BY 
    1, 2
ORDER BY 
    s.channel_name, 
    year ASC;


-- -------------------------------------------------------------------
-- CASE 4: Funnel Analysis & Conversion Rate for 'Organic' Traffic
-- Objective: Mengukur trafik (events) dan rasio konversi khusus traffic organic.
-- -------------------------------------------------------------------
WITH organic_events AS (
    SELECT 
        platform,
        COUNT(DISTINCT user_id) AS total_visitors,
        COUNT(DISTINCT CASE WHEN event_type = 'purchase' THEN user_id END) AS converted_users
    FROM 
        user_events
    WHERE 
        traffic_source = 'Organic'
    GROUP BY 
        platform
)
SELECT 
    platform,
    total_visitors,
    converted_users,
    ROUND((converted_users::DECIMAL / NULLIF(total_visitors, 0)) * 100, 2) AS conversion_rate_percent
FROM 
    organic_events
ORDER BY 
    conversion_rate_percent DESC;


-- -------------------------------------------------------------------
-- CASE 5: Registration Cohort & First Purchase Speed
-- Objective: Mengukur rata-rata durasi (hari) dari pendaftaran akun hingga transaksi pertama.
-- -------------------------------------------------------------------
WITH first_purchase AS (
    SELECT 
        u.user_id,
        u.registration_platform,
        u.registration_date,
        MIN(o.order_date) AS first_order_date
    FROM 
        users u
    JOIN 
        orders o ON u.user_id = o.user_id
    WHERE 
        o.order_status = 'Completed'
    GROUP BY 
        u.user_id, 
        u.registration_platform, 
        u.registration_date
)
SELECT 
    registration_platform,
    COUNT(DISTINCT user_id) AS total_users,
    ROUND(AVG(first_order_date::DATE - registration_date::DATE), 1) AS avg_days_to_first_purchase
FROM 
    first_purchase
GROUP BY 
    registration_platform
ORDER BY 
    avg_days_to_first_purchase ASC;
