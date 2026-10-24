-- Query 2: Highest-Paying Data Job Roles
-- Purpose: Identify job categories with the highest average annual salary.

SELECT TOP 10
    job_title_short,
    ROUND(AVG(salary_year_avg), 2) AS average_annual_salary,
    COUNT(*) AS salary_records
FROM dbo.data_jobs
WHERE salary_year_avg IS NOT NULL
GROUP BY job_title_short
HAVING COUNT(*) >= 10
ORDER BY average_annual_salary DESC;