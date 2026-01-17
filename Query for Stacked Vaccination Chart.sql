-- Query for Stacked Vaccination Chart
WITH LatestVaccinationData AS (
  SELECT
    location,
    MAX(people_vaccinated_per_hundred) as total_vaccinated_per_hundred,
    MAX(people_fully_vaccinated_per_hundred) as fully_vaccinated_per_hundred,
    MAX(population) as population
  FROM
    owid_covid_data
  WHERE
    continent IS NOT NULL
  GROUP BY
    location
)
SELECT
  location,
  fully_vaccinated_per_hundred,
  (total_vaccinated_per_hundred - fully_vaccinated_per_hundred) AS partially_vaccinated_only_per_hundred
FROM
  LatestVaccinationData
WHERE
  fully_vaccinated_per_hundred IS NOT NULL
ORDER BY
  population DESC
LIMIT 10;

