-- Count the percentage of population reported as infected by neighborhood.
.mode csv
.headers on

-- The mapping from geocodes to neighborhoods appears redundantly in the COVID data,
-- so extract a table of unique mappings.
CREATE TEMPORARY TABLE gc_nbhd AS
SELECT DISTINCT covid.geocode AS geocode, covid.neighborhood AS neighborhood
FROM covid
WHERE covid.neighborhood != '';

-- Construct a table of population by neighborhood.  Again, the result is
-- suspect: Toronto had about 6M people in 2016, but this query seems to
-- show a total population of 9.5M.
CREATE TEMPORARY TABLE pop_nbhd AS
SELECT gc_nbhd.neighborhood AS neighborhood, SUM(census.population) AS population
FROM gc_nbhd INNER JOIN census
ON gc_nbhd.geocode = census.geocode
GROUP BY gc_nbhd.neighborhood;

-- Calculate the percentage of people reported as infected by neighborhood.
SELECT pop_nbhd.neighborhood AS neighborhood,
       COUNT(*) AS "count",
       pop_nbhd.population AS population,
       ROUND(100 * CAST(COUNT(*) AS real) / pop_nbhd.population, 2) AS frequency
FROM covid JOIN pop_nbhd
ON covid.neighborhood = pop_nbhd.neighborhood
GROUP BY covid.neighborhood
ORDER BY frequency;
