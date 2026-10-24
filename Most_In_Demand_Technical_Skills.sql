-- Query 3: Most In-Demand Technical Skills
-- Purpose: Identify the most frequently requested skills in job postings.

SELECT TOP 10
    LTRIM(RTRIM(value)) AS skill,
    COUNT(*) AS skill_demand
FROM dbo.data_jobs
CROSS APPLY STRING_SPLIT(
    REPLACE(REPLACE(job_skills, '[', ''), ']', ''),
    ','
)
WHERE job_skills IS NOT NULL
GROUP BY LTRIM(RTRIM(value))
ORDER BY skill_demand DESC;