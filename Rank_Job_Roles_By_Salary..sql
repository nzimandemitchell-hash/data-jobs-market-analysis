-- Query 6: Ranking Data Job Roles by Salary
-- Purpose: Rank job categories by average annual salary using a CTE and window functions.

WITH SalaryAnalysis AS (
    SELECT
        job_title_short,
        AVG(salary_year_avg) AS average_salary,
        COUNT(*) AS salary_records
    FROM dbo.data_jobs
    WHERE salary_year_avg IS NOT NULL
    GROUP BY job_title_short
    HAVING COUNT(*) >= 10
),
RankedRoles AS (
    SELECT
        job_title_short,
        ROUND(average_salary, 2) AS average_salary,
        salary_records,
        RANK() OVER (ORDER BY average_salary DESC) AS salary_rank,
        SUM(salary_records) OVER () AS total_salary_records
    FROM SalaryAnalysis
)
SELECT *
FROM RankedRoles
ORDER BY salary_rank;