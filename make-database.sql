-- Create an SQLite database containing Toronto COVID-19 data.

-- Read data from CSV files.
.mode csv

-- Census data giving population by postal code prefix.
DROP TABLE IF EXISTS Census;
CREATE TABLE Census(
  geocode TEXT NOT NULL,
  geoname TEXT NOT NULL,
  region TEXT NOT NULL,
  reserves INTEGER,
  population INTEGER NOT NULL,
  dwellings INTEGER NOT NULL,
  occupied INTEGER NOT NULL,
  CONSTRAINT region_known CHECK(region in (
    "Alberta", "British Columbia", "Manitoba", "New Brunswick",
    "Newfoundland and Labrador", "Nova Scotia", "Nunavut/Northwest Territories",
    "Ontario", "Prince Edward Island", "Quebec", "Saskatchewan", "Yukon")),
  CONSTRAINT population_positive CHECK(population >= 0),
  CONSTRAINT dwellings_positive CHECK(dwellings >= 0),
  CONSTRAINT occupied_positive CHECK(occupied >= 0)
);

-- skip two lines to get rid of titles and summary for all of Canada
.import canada-census-data-2016.csv Census --skip 2

-- Get rid of unneeded columns in census data.
ALTER TABLE Census DROP COLUMN geoname;
ALTER TABLE Census DROP COLUMN reserves;

-- Raw City of Toronto data.
DROP TABLE IF EXISTS Covid_Temp;
.import toronto-covid19-2021-04-19.csv Covid_Temp

-- Translate.
DROP TABLE IF EXISTS Covid;
CREATE TABLE Covid AS SELECT
  CAST(_id AS INTEGER) AS event_id,
  CAST("Outbreak Associated" AS TEXT) AS outbreak_associated,
  CAST("Age Group" AS TEXT) AS age_group,
  CAST("FSA" AS TEXT) AS geocode,
  CAST("Source of Infection" AS TEXT) AS source,
  CAST("Classification" AS TEXT) AS classification,
  DATE("Episode Date") AS episode_date,
  DATE("Reported Date") AS reported_date,
  CAST("Client Gender" AS TEXT) AS gender,
  CAST("Outcome" AS TEXT) AS outcome,
  CAST(IIF("Currently Hospitalized" = "Yes", 1, 0) AS INTEGER) AS hospitalized_current,
  CAST(IIF("Currently in ICU" = "Yes", 1, 0) AS INTEGER) AS icu_current,
  CAST(IIF("Currently Intubated" = "Yes", 1, 0) AS INTEGER) AS intubated_current,
  CAST(IIF("Ever Hospitalized" = "Yes", 1, 0) AS INTEGER) AS hospitalized_ever,
  CAST(IIF("Ever in ICU" = "Yes", 1, 0) AS INTEGER) AS icu_ever,
  CAST(IIF("Ever Intubated" = "Yes", 1, 0) AS INTEGER) AS intubated_ever
FROM Covid_Temp;

-- Tidy up sub-categorization of outbreak types.
UPDATE Covid SET source = CASE
  WHEN source = "Outbreaks, Congregate Settings" THEN "Congregate Settings"
  WHEN source = "Outbreaks, Healthcare Institutions" THEN "Healthcare Institutions"
  WHEN source = "Outbreaks, Other Settings" THEN "Other Settings"
  ELSE source
END;

-- Create table of neighborhoods.
DROP TABLE IF EXISTS Neighborhood;
CREATE TABLE Neighborhood AS SELECT DISTINCT
  CAST("Neighbourhood Name" AS TEXT) AS name,
  CAST("FSA" AS TEXT) AS geocode
FROM Covid_Temp
WHERE "Neighbourhood Name" != "";

-- Get rid of temporary table.
DROP TABLE Covid_Temp;
