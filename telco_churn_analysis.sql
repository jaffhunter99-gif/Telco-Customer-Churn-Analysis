-- Telco Customer Churn Analysis
-- Hansi musteri seqmenti daha cox terk edir ve niye
-- Cedvel: customers (Telco Customer Churn dataset, 7043 setir)


-- 1. Muqavile tipi uzre churn deyeri
SELECT 
    Contract,
    COUNT(*) AS TOTAL_CUSTOMERS,
    SUM(CASE WHEN Churn = 'Yes' THEN 1 ELSE 0 END) AS CHURNED_CUSTOMERS,
    ROUND(100.0 * SUM(CASE WHEN Churn = 'Yes' THEN 1 ELSE 0 END) / COUNT(*), 1) AS CHURN_RATE_PCT
FROM customers
GROUP BY Contract
ORDER BY CHURN_RATE_PCT DESC;


-- 2. Internet xidmeti tipi uzre churn deyeri
SELECT 
    InternetService,
    COUNT(*) AS TOTAL_CUSTOMERS,
    SUM(CASE WHEN Churn = 'Yes' THEN 1 ELSE 0 END) AS CHURNED_CUSTOMERS,
    ROUND(100.0 * SUM(CASE WHEN Churn = 'Yes' THEN 1 ELSE 0 END) / COUNT(*), 1) AS CHURN_RATE_PCT
FROM customers
GROUP BY InternetService
ORDER BY CHURN_RATE_PCT DESC;


-- 3. Churn statusuna gore orta tenure (ay) ve aylıq odenis
SELECT 
    Churn,
    COUNT(*) AS TOTAL_CUSTOMERS,
    ROUND(AVG(tenure), 1) AS AVG_TENURE_MONTHS,
    ROUND(AVG(MonthlyCharges), 2) AS AVG_MONTHLY_CHARGES
FROM customers
GROUP BY Churn;


-- 4. Muqavile + Internet xidmeti birlikde (segmentasiya ucun)
SELECT 
    Contract,
    InternetService,
    COUNT(*) AS TOTAL_CUSTOMERS,
    ROUND(100.0 * SUM(CASE WHEN Churn = 'Yes' THEN 1 ELSE 0 END) / COUNT(*), 1) AS CHURN_RATE_PCT,
    ROUND(AVG(MonthlyCharges), 2) AS AVG_MONTHLY_CHARGES
FROM customers
GROUP BY Contract, InternetService
ORDER BY CHURN_RATE_PCT DESC;
