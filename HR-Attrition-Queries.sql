-- ============================================================
-- HR ATTRITION ANALYTICS — SQL QUERIES
-- Database: hr_analytics.db | Table: employees
-- ============================================================

-- 1. Overall attrition rate
SELECT
    COUNT(*) AS total_employees,
    SUM(CASE WHEN Attrition = 'Yes' THEN 1 ELSE 0 END) AS employees_left,
    ROUND(100.0 * SUM(CASE WHEN Attrition = 'Yes' THEN 1 ELSE 0 END) / COUNT(*), 2) AS attrition_rate_pct
FROM employees;

-- 2. Attrition rate by department
SELECT
    Department,
    COUNT(*) AS headcount,
    SUM(CASE WHEN Attrition = 'Yes' THEN 1 ELSE 0 END) AS left_count,
    ROUND(100.0 * SUM(CASE WHEN Attrition = 'Yes' THEN 1 ELSE 0 END) / COUNT(*), 2) AS attrition_rate_pct
FROM employees
GROUP BY Department
ORDER BY attrition_rate_pct DESC;

-- 3. Attrition rate by job role (top risk roles)
SELECT
    JobRole,
    COUNT(*) AS headcount,
    ROUND(100.0 * SUM(CASE WHEN Attrition = 'Yes' THEN 1 ELSE 0 END) / COUNT(*), 2) AS attrition_rate_pct
FROM employees
GROUP BY JobRole
ORDER BY attrition_rate_pct DESC;

-- 4. Attrition rate by overtime status
SELECT
    OverTime,
    COUNT(*) AS headcount,
    ROUND(100.0 * SUM(CASE WHEN Attrition = 'Yes' THEN 1 ELSE 0 END) / COUNT(*), 2) AS attrition_rate_pct
FROM employees
GROUP BY OverTime;

-- 5. Average monthly income: stayed vs. left
SELECT
    Attrition,
    ROUND(AVG(MonthlyIncome), 0) AS avg_monthly_income,
    ROUND(AVG(YearsAtCompany), 1) AS avg_years_at_company,
    ROUND(AVG(DistanceFromHome), 1) AS avg_distance_from_home
FROM employees
GROUP BY Attrition;

-- 6. Attrition rate by job satisfaction level (1=Low ... 4=Very High)
SELECT
    JobSatisfaction,
    COUNT(*) AS headcount,
    ROUND(100.0 * SUM(CASE WHEN Attrition = 'Yes' THEN 1 ELSE 0 END) / COUNT(*), 2) AS attrition_rate_pct
FROM employees
GROUP BY JobSatisfaction
ORDER BY JobSatisfaction;

-- 7. Attrition rate by work-life balance rating
SELECT
    WorkLifeBalance,
    COUNT(*) AS headcount,
    ROUND(100.0 * SUM(CASE WHEN Attrition = 'Yes' THEN 1 ELSE 0 END) / COUNT(*), 2) AS attrition_rate_pct
FROM employees
GROUP BY WorkLifeBalance
ORDER BY WorkLifeBalance;

-- 8. Tenure buckets vs attrition (new joiners vs veterans)
--    Uses a CTE so this runs on both SQLite and SQL Server
--    (SQL Server doesn't allow GROUP BY on a SELECT-list alias)
WITH tenure_data AS (
    SELECT
        CASE
            WHEN YearsAtCompany < 2 THEN '0-1 yrs'
            WHEN YearsAtCompany < 5 THEN '2-4 yrs'
            WHEN YearsAtCompany < 10 THEN '5-9 yrs'
            ELSE '10+ yrs'
        END AS tenure_bucket,
        YearsAtCompany,
        Attrition
    FROM employees
)
SELECT
    tenure_bucket,
    COUNT(*) AS headcount,
    ROUND(100.0 * SUM(CASE WHEN Attrition = 'Yes' THEN 1 ELSE 0 END) / COUNT(*), 2) AS attrition_rate_pct
FROM tenure_data
GROUP BY tenure_bucket
ORDER BY MIN(YearsAtCompany);

-- 9. High-risk segment: frequent travelers working overtime with low satisfaction
SELECT
    EmployeeID, Department, JobRole, MonthlyIncome, JobSatisfaction,
    WorkLifeBalance, OverTime, BusinessTravel, Attrition
FROM employees
WHERE OverTime = 'Yes'
  AND BusinessTravel = 'Travel_Frequently'
  AND JobSatisfaction <= 2
ORDER BY MonthlyIncome ASC;

-- 10. Estimated cost of attrition by department
--     (assumption: replacement cost = 50% of one employee's annual salary)
SELECT
    Department,
    SUM(CASE WHEN Attrition = 'Yes' THEN MonthlyIncome * 12 * 0.5 ELSE 0 END) AS estimated_replacement_cost
FROM employees
GROUP BY Department
ORDER BY estimated_replacement_cost DESC;