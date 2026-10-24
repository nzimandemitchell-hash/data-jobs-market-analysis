
-- Query 1: Most In-Demand Data Job Roles
-- Purpose: Identify the top 10 job categories with the most postings.


UsE DataJobsMarketAnalysis;
GO

SELECT TOP 10
    job_title_short,
    COUNT(*) AS total_job_postings
FROM dbo.data_jobs
WHERE job_title_short IS NOT NULL
GROUP BY job_title_short
ORDER BY total_job_postings DESC;