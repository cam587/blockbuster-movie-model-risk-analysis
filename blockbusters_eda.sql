select * from blockbuster_movies_2015_2025;
-- Financial Risk Questions

-- Are blockbuster production budgets increasing faster than worldwide grosses over time?
-- rounded numeric with no decimals (keeps numeric type)
WITH yearly AS (
    SELECT
        release_year,
        CAST(ROUND(AVG(CAST(production_budget AS DECIMAL(38,2))), 0) AS DECIMAL(12,0)) AS avg_production_budget,
        CAST(ROUND(AVG(CAST(worldwide_gross AS DECIMAL(38,2))), 0) AS DECIMAL(12,0)) AS avg_worldwide_gross
    FROM dbo.blockbuster_movies_2015_2025
    GROUP BY release_year
)
SELECT
    release_year,
    avg_production_budget,
    avg_worldwide_gross,
    -- Year-over-year % change for production budget
    CAST(
      ROUND(
        (avg_production_budget - LAG(avg_production_budget) OVER (ORDER BY release_year)) * 100.0
        / NULLIF(LAG(avg_production_budget) OVER (ORDER BY release_year), 0)
      , 2) AS DECIMAL(7,2)
    ) AS pct_change_prod,
    -- Year-over-year % change for worldwide gross
    CAST(
      ROUND(
        (avg_worldwide_gross - LAG(avg_worldwide_gross) OVER (ORDER BY release_year)) * 100.0
        / NULLIF(LAG(avg_worldwide_gross) OVER (ORDER BY release_year), 0)
      , 2) AS DECIMAL(7,2)
    ) AS pct_change_gross
FROM yearly
ORDER BY release_year;
-- This query calculates the average production budget and average worldwide gross 
-- for blockbuster movies from 2015 to 2025, grouped by release year. 
--The results are rounded to the nearest whole number for easier comparison. 
-- By analyzing the output, you can determine if production budgets are increasing faster than worldwide grosses over time.

-- Are mega-budget movies more likely to be Major hits, hits, break even, or misses?
SELECT
    budget_tier,
    hit_status,
    COUNT(*) AS movie_count
FROM blockbuster_movies_2015_2025
WHERE budget_tier like 'Mega%'
GROUP BY budget_tier, hit_status
ORDER BY movie_count;
-- This query counts the number of movies in the "Mega-budget" tier for each hit status (hit, borderline, miss).

-- Has the average profitability ratio changed over time?
SELECT
    release_year,
    CAST(ROUND(AVG(CAST(profitability_ratio AS DECIMAL(38,2))), 2) AS DECIMAL(12,2)) AS avg_profitability_ratio
FROM blockbuster_movies_2015_2025
GROUP BY release_year
ORDER BY release_year;
-- This query calculates the average profitability ratio for blockbuster movies from 2015 to 2025, grouped by release year.

-- Content and IP Strategy Questions

-- Which IP types have the highest average profitability ratios?
SELECT
    ip_type,
    CAST(ROUND(AVG(CAST(profitability_ratio AS DECIMAL(38,2))), 2) AS DECIMAL(12,2)) AS avg_profitability_ratio
FROM blockbuster_movies_2015_2025
GROUP BY ip_type
ORDER BY avg_profitability_ratio DESC;
-- This query calculates the average profitability ratio for each IP type and orders the results from highest to lowest.

-- Which IP types have the highest hit rates and lowest miss rates?
SELECT
    ip_type,
    SUM(CASE WHEN hit_status = 'Hit' OR hit_status = 'Major Hit' THEN 1 ELSE 0 END) AS Major_hit_or_hit_count,
    SUM(CASE WHEN hit_status = 'Miss' THEN 1 ELSE 0 END) AS miss_count,
    COUNT(*) AS total_movies,
    CAST(SUM(CASE WHEN hit_status = 'Hit' OR hit_status = 'Major Hit' THEN 1 ELSE 0 END) AS FLOAT) / NULLIF(COUNT(*), 0) AS Major_hit_or_hit_rate,
    CAST(SUM(CASE WHEN hit_status = 'Miss' THEN 1 ELSE 0 END) AS FLOAT) / NULLIF(COUNT(*), 0) AS miss_rate
FROM blockbuster_movies_2015_2025
GROUP BY ip_type
ORDER BY Major_hit_or_hit_rate DESC, miss_rate ASC;
-- This query calculates the major hit or hit rate and miss rate for each IP type and orders the results from highest major hit or hit rate to lowest miss rate.

-- Genre and Audience Preferences Questions
-- Which genres have the highest average profitability ratios? Which genres perform best at different budget levels?
WITH genre_profitability AS (
SELECT
    genre,
    budget_tier,
    CAST(ROUND(AVG(CAST(profitability_ratio AS DECIMAL(38,2))), 2) AS DECIMAL(12,2)) AS avg_profitability_ratio
FROM blockbuster_movies_2015_2025
WHERE genre LIKE '%Science Fiction%' -- plug in any genre you want to analyze
GROUP BY genre, budget_tier
)
SELECT
    genre,
    budget_tier,
    avg_profitability_ratio,
    CAST(ROUND(AVG(avg_profitability_ratio) OVER(), 2) AS DECIMAL(12,2)) AS avg_of_avg_profitability_ratio
FROM genre_profitability
GROUP BY avg_profitability_ratio, genre, budget_tier
ORDER BY avg_profitability_ratio DESC
;

-- Release Timing and Seasonality Questions
-- Do movies released in certain months or seasons have higher profitability ratios?
SELECT
    MONTH(release_date) AS release_month,
    CASE 
        WHEN MONTH(release_date) IN (12, 1, 2) THEN 'Winter'
        WHEN MONTH(release_date) IN (3, 4, 5) THEN 'Spring'
        WHEN MONTH(release_date) IN (6, 7, 8) THEN 'Summer'
        WHEN MONTH(release_date) IN (9, 10, 11) THEN 'Fall'
    END AS release_season,
CAST(ROUND(AVG(CAST(profitability_ratio AS DECIMAL(38,2))), 2) AS DECIMAL(12,2)) AS avg_profitability_ratio
FROM blockbuster_movies_2015_2025
GROUP BY release_date;