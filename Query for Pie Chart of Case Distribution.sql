-- Query for Pie Chart of Case Distribution
WITH CountryCases AS (
  SELECT
    location,
    MAX(total_cases) AS total_cases
  FROM
    owid_covid_data
  WHERE
    continent IS NOT NULL
  GROUP BY
    location
),
RankedCases AS (
  SELECT
    location,
    total_cases,
    RANK() OVER (ORDER BY total_cases DESC) as rnk
  FROM CountryCases
)
SELECT
  CASE WHEN rnk <= 5 THEN location ELSE 'Rest of the World' END as country,
  SUM(total_cases) as cases
FROM RankedCases
GROUP BY country
ORDER BY cases DESC