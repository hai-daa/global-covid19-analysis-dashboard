--- Is there a correlation b/w countries's wealth (gdp) and vaccination rate

SELECT
    location,
    MAX(gdp_per_capita) AS gdp,
    MAX(people_fully_vaccinated_per_hundred) AS vaccination_rate
FROM
    owid_covid_data
WHERE
    continent IS NOT NULL
    AND population > 1000000 -- Let's look at countries with over 1 million people
GROUP BY
    location
HAVING
    MAX(people_fully_vaccinated_per_hundred) IS NOT NULL AND MAX(gdp_per_capita) IS NOT NULL
ORDER BY
    gdp DESC;