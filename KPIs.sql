---KPIs---
SELECT
    SUM(total_cases) AS `Total Global Cases`,
    SUM(total_deaths) AS `Total Global Deaths`,
    SUM(total_vaccinations) AS `Total Doses Administered`
FROM owid_covid_data
