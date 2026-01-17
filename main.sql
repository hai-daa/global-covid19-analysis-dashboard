SELECT * FROM owid_covid_data LIMIT 10;
---What are the total cases and deaths for each continent?---
SELECT
  continent,
  MAX(total_cases) AS total_cases_count,
  MAX(total_deaths) AS total_deaths_count
FROM
  owid_covid_data
WHERE
  continent IS NOT NULL 
GROUP BY
  continent
ORDER BY
  total_cases_count DESC;

---Which 10 countries have the highest death count?---

SELECT
  location,
  MAX(total_deaths) AS total_death_count
FROM
  owid_covid_data
WHERE
  continent IS NOT NULL
GROUP BY
  location
ORDER BY
  total_death_count DESC
LIMIT 10;

---What percentage of the population got COVID in the United States?---

SELECT
  location,
  MAX(total_cases) AS total_cases,
  MAX(population) AS population,
  (MAX(total_cases) / MAX(population)) * 100 AS infection_percentage
FROM
  owid_covid_data
WHERE
  location = 'United States'
GROUP BY
  location;

--What percentage of each continent's population has been infected?--

-- What was the infection rate per continent?
SELECT
    continent,
    (MAX(total_cases) / MAX(population)) * 100 AS infection_percentage
FROM
    owid_covid_data
WHERE
    continent IS NOT NULL
GROUP BY
    continent
ORDER BY
    infection_percentage DESC;

-- What is the Case Fatality Rate for the top 20 countries by deaths?--
SELECT
    location,
    MAX(total_cases) as total_cases,
    MAX(total_deaths) as total_deaths,
    (MAX(total_deaths) / MAX(total_cases)) * 100 AS case_fatality_rate_percent
FROM
    owid_covid_data
WHERE
    continent IS NOT NULL AND total_cases > 100000 
GROUP BY
    location
ORDER BY
    total_deaths DESC
LIMIT 20;

-- How did new cases and deaths trend globally month-over-month?
SELECT
  DATE_TRUNC('MONTH', date) AS month,
  SUM(new_cases) AS total_monthly_cases,
  SUM(new_deaths) AS total_monthly_deaths
FROM
    owid_covid_data
WHERE
    continent IS NOT NULL
GROUP BY
    month
ORDER BY
    month;

-- What was the 7-day moving average of new cases in Italy?
SELECT
    date,
    new_cases,
    AVG(new_cases) OVER (ORDER BY date ROWS BETWEEN 6 PRECEDING AND CURRENT ROW) AS seven_day_moving_average
FROM
    owid_covid_data
WHERE
    location = 'Italy'
ORDER BY
    date;

-- What percentage of each continent's population is fully vaccinated?
SELECT
    continent,
    MAX(people_fully_vaccinated_per_hundred) AS percent_fully_vaccinated
FROM
    owid_covid_data
WHERE
    continent IS NOT NULL
GROUP BY
    continent
ORDER BY
    percent_fully_vaccinated DESC;





