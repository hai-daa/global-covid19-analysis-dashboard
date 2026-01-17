--- GLOBAL WEEKLY CASE GROWTH RATE (NO FILTER)


WITH WeeklyGlobalCases AS (
  SELECT
  
    DATE_TRUNC('WEEK', date) AS week_start_date,
  
    SUM(new_cases) AS weekly_new_cases
  FROM
    owid_covid_data
  WHERE

    continent IS NOT NULL
  GROUP BY
    week_start_date
),


WeeklyGlobalComparison AS (
  SELECT
    week_start_date,
    weekly_new_cases,
    
    LAG(weekly_new_cases, 1, 0) OVER (ORDER BY week_start_date) AS previous_week_cases
  FROM
    WeeklyGlobalCases
)

SELECT
  week_start_date,
  weekly_new_cases,
  previous_week_cases,
  CASE
    WHEN previous_week_cases = 0 THEN NULL
    ELSE (weekly_new_cases - previous_week_cases) * 100.0 / previous_week_cases
  END AS weekly_growth_rate_percent
FROM
  WeeklyGlobalComparison
WHERE
  week_start_date >= '2020-03-01'
ORDER BY
  week_start_date;