-- Count of cases reported by neighborhood.
.mode csv
.headers on

SELECT covid.neighborhood as neighborhood, count(*) as "count"
FROM covid
GROUP BY covid.neighborhood
ORDER BY covid.neighborhood ASC;
