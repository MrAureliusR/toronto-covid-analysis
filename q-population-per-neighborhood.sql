-- Count the number of people living in each neighborhood.
-- This result is suspicious: there were only 6 million people living in Toronto in 2016,
-- but this query seems to find 9.5 million.
.mode csv
.headers on

CREATE TEMPORARY TABLE geocode_neighborhood AS
SELECT DISTINCT covid.geocode, covid.neighborhood
FROM covid
WHERE covid.neighborhood != '';

SELECT geocode_neighborhood.neighborhood AS neighborhood, SUM(census.population) AS population
FROM geocode_neighborhood INNER JOIN census
ON geocode_neighborhood.geocode = census.geocode
GROUP BY geocode_neighborhood.neighborhood
ORDER BY geocode_neighborhood.neighborhood;
