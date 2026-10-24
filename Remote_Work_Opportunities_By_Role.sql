-- Query 4: Remote Work Opportunities by Job Role
-- Purpose: Calculate the percentage of job postings offering remote work by role.

SELECT
    job_title_short,
    COUNT(*) AS total_postings,
    SUM(CASE
        WHEN job_work_from_home = 1 THEN 1
        ELSE 0
    END) AS remote_postings,
    ROUND(
        100.0 * SUM(CASE
            WHEN job_work_from_home = 1 THEN 1
            ELSE 0
        END) / COUNT(*), 2
    ) AS remote_percentage
FROM dbo.data_jobs
WHERE job_title_short IS NOT NULL
GROUP BY job_title_short
ORDER BY remote_percentage DESC;