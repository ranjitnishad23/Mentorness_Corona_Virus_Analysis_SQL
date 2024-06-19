
-- Q1. Write a code to check NULL values
SELECT * 
FROM corona_virus_data 
WHERE Province IS NULL OR 
Country_Region IS NULL OR 
Latitude IS NULL OR 
Longitude IS NULL OR 
Date IS NULL OR 
Confirmed IS NULL OR 
Deaths IS NULL OR 
Recovered IS NULL;

-- Q3. check total number of rows    

SELECT COUNT(*) AS total_rows 
FROM corona_virus_data;

-- Q4. Check what is start_date and end_date
SELECT MIN(Date) AS start_date, MAX(Date) AS end_date 
FROM corona_virus_data;

-- Q5. Number of month present in dataset
SELECT 
    DATE_FORMAT(Date, '%Y-%m') AS month, 
    AVG(Confirmed) AS avg_confirmed, 
    AVG(Deaths) AS avg_deaths, 
    AVG(Recovered) AS avg_recovered 
FROM corona_virus_data 
GROUP BY month;


-- Q6. Find monthly average for confirmed, deaths, recovered
SELECT 
    DATE_FORMAT(Date, '%Y-%m') AS month, 
    AVG(Confirmed) AS avg_confirmed, 
    AVG(Deaths) AS avg_deaths, 
    AVG(Recovered) AS avg_recovered 
FROM corona_virus_data 
GROUP BY month;

-- Q7. Find most frequent value for confirmed, deaths, recovered each month
SELECT 
    month, 
    confirmed, 
    deaths, 
    recovered 
FROM (
    SELECT 
        DATE_FORMAT(Date, '%Y-%m') AS month,
        Confirmed,
        Deaths,
        Recovered,
        ROW_NUMBER() OVER (PARTITION BY DATE_FORMAT(Date, '%Y-%m') ORDER BY COUNT(*) DESC) AS row_num
    FROM corona_virus_data
    GROUP BY month, Confirmed, Deaths, Recovered
) AS subquery
WHERE row_num = 1;


-- Q8. Find minimum values for confirmed, deaths, recovered per year
SELECT 
    YEAR(Date) AS year, 
    MIN(Confirmed) AS min_confirmed, 
    MIN(Deaths) AS min_deaths, 
    MIN(Recovered) AS min_recovered 
FROM corona_virus_data 
GROUP BY year;

-- Q9. Find maximum values of confirmed, deaths, recovered per year
SELECT 
    YEAR(Date) AS year, 
    MAX(Confirmed) AS max_confirmed, 
    MAX(Deaths) AS max_deaths, 
    MAX(Recovered) AS max_recovered 
FROM corona_virus_data 
GROUP BY year;

-- Q10. The total number of case of confirmed, deaths, recovered each month
SELECT 
    DATE_FORMAT(Date, '%Y-%m') AS month, 
    SUM(Confirmed) AS total_confirmed, 
    SUM(Deaths) AS total_deaths, 
    SUM(Recovered) AS total_recovered 
FROM corona_virus_data 
GROUP BY month;

-- Q11. Check how corona virus spread out with respect to confirmed case
--      (Eg.: total confirmed cases, their average, variance & STDEV )
SELECT 
    SUM(Confirmed) AS total_confirmed, 
    AVG(Confirmed) AS avg_confirmed, 
    VARIANCE(Confirmed) AS var_confirmed, 
    STDDEV(Confirmed) AS stddev_confirmed 
FROM corona_virus_data;

-- Q12. Check how corona virus spread out with respect to death case per month
--      (Eg.: total confirmed cases, their average, variance & STDEV )
SELECT 
    DATE_FORMAT(Date, '%Y-%m') AS month, 
    SUM(Deaths) AS total_deaths, 
    AVG(Deaths) AS avg_deaths, 
    VARIANCE(Deaths) AS var_deaths, 
    STDDEV(Deaths) AS stddev_deaths 
FROM corona_virus_data 
GROUP BY month;

-- Q13. Check how corona virus spread out with respect to death case per month
--      (Eg.: total confirmed cases, their average, variance & STDEV )
SELECT 
    DATE_FORMAT(Date, '%Y-%m') AS month, 
    SUM(Deaths) AS total_deaths, 
    AVG(Deaths) AS avg_deaths, 
    VARIANCE(Deaths) AS var_deaths, 
    STDDEV(Deaths) AS stddev_deaths 
FROM corona_virus_data 
GROUP BY month;

-- Q14. Check how corona virus spread out with respect to recovered case
--      (Eg.: total confirmed cases, their average, variance & STDEV )
SELECT 
    SUM(Recovered) AS total_recovered, 
    AVG(Recovered) AS avg_recovered, 
    VARIANCE(Recovered) AS var_recovered, 
    STDDEV(Recovered) AS stddev_recovered 
FROM corona_virus_data;

-- Q15. Find Country having lowest number of the death case
SELECT 
    Country_Region, 
    SUM(Deaths) AS total_deaths 
FROM corona_virus_data 
GROUP BY Country_Region 
ORDER BY total_deaths ASC 
LIMIT 1;

-- Q16. Find top 5 countries having highest recovered case
SELECT 
    Country_Region, 
    SUM(Recovered) AS total_recovered 
FROM corona_virus_data 
GROUP BY Country_Region 
ORDER BY total_recovered DESC 
LIMIT 5;
use abc;