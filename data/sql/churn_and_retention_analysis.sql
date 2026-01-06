-- =========================================
-- Vehicle Renewal Churn & Retention Analysis
-- Database: 2026PROJECT
-- =========================================

USE 2026PROJECT;

-- -----------------------------------------
-- 1. Inspect 2024 Renewals
-- -----------------------------------------
SELECT *
FROM `2024_renewals`;

-- -----------------------------------------
-- 2. Inspect 2025 Renewals
-- -----------------------------------------
SELECT *
FROM `2025_renewals`;

-- -----------------------------------------
-- 3. Identify Churned Customers
-- Customers who renewed in 2024 but did NOT
-- renew in 2025
-- -----------------------------------------
SELECT 
    r24.DATE,
    r24.SACCO,
    r24.REGISTRATION,
    r24.NAME,
    r24.CONTACT
FROM `2024_renewals` r24
WHERE NOT EXISTS (
    SELECT 1
    FROM `2025_renewals` r25
    WHERE r25.REGISTRATION = r24.REGISTRATION
);

-- -----------------------------------------
-- 4. Classify Customers as Returned or Churned
-- -----------------------------------------
SELECT 
    CASE 
        WHEN r25.REGISTRATION IS NOT NULL THEN 'Returned'
        ELSE 'Churned'
    END AS customer_status,
    COUNT(*) AS total_vehicles
FROM `2024_renewals` r24
LEFT JOIN `2025_renewals` r25
    ON r24.REGISTRATION = r25.REGISTRATION
GROUP BY customer_status;

-- -----------------------------------------
-- 5. Retention & Churn Rate Calculation
-- -----------------------------------------
SELECT
    COUNT(DISTINCT r24.REGISTRATION) AS total_2024,
    COUNT(DISTINCT r25.REGISTRATION) AS returned_2025,
    ROUND(
        COUNT(DISTINCT r25.REGISTRATION) 
        / COUNT(DISTINCT r24.REGISTRATION) * 100, 2
    ) AS retention_rate_percent,
    ROUND(
        (1 - COUNT(DISTINCT r25.REGISTRATION) 
        / COUNT(DISTINCT r24.REGISTRATION)) * 100, 2
    ) AS churn_rate_percent
FROM `2024_renewals` r24
LEFT JOIN `2025_renewals` r25
    ON r24.REGISTRATION = r25.REGISTRATION;
