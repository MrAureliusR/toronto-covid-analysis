# COVID-19 Analysis for the City of Toronto

This repository holds data files, scripts, and other material used to
teach database operations by analyzing COVID-19 data from the City of
Toronto.

This was updated on February 16th, 2022 with the latest data from the
City of Toronto Open Data website.

# USAGE

To use this project, you must have sqlite3 installed. This is available
from almost all distro's repos. Run `sqlite3 toronto-covid19.db` and then
issue `.read make-database.sql`. This will take at least 5-10 seconds, depending
on the speed of your CPU & disk. 

## Querying

To query, for example, all cases in the postal code 'M1L', issue
`SELECT * FROM Covid WHERE geocode LIKE 'M1L';`

The real power of having this data in a SQLite database is connecting
it to other software that can analyze & visualize the data in a
meaningful way.

## Table `census`

| Field      | Type    | Units | Key?  | Null? | Meaning |
| ---------- | ------- | ----- | ----- | ----- | ------- |
| geocode    | text    | -     | true  | false | Postal code prefix |
| region     | text    | enum  | false | false | Province/territory name |
| population | integer | >= 0  | false | false | Head count |
| dwellings  | integer | >= 0  | false | false | Homes |
| occupied   | integer | >= 0  | false | false | Occupied by residents |

## Table `covid`

| Field                 | Type    | Units | Key?  | Null? | Meaning |
| --------------------- | ------- | ----- | ----- | ----- | ------- |
| event_id              | integer | -     | true  | false | unique event ID |
| outbreak_associated   | text    | enum  | false | false | associated with larger outbreak |
| age_group             | text    | enum  | false | false | patient age group |
| neighborhood          | text    | enum  | false | false | neighborhood name |
| geocode               | text    | -     | false | false | foreign key to `geocode` in `census` |
| source                | text    | enum  | false | false | source of infection |
| classification        | text    | enum  | false | false | classification of infection |
| episode_date          | date    | date  | false | false | when infected |
| reported_date         | date    | date  | false | false | when reported |
| gender                | text    | enum  | false | false | patient gender |
| outcome               | text    | enum  | false | false | result at time of report |
| hospitalized_current  | boolean | 0/1   | false | false | in hospital at time of report |
| icu_current           | boolean | 0/1   | false | false | in ICU at time of report |
| intubated_current     | boolean | 0/1   | false | false | intubated at time of report |
| hospitalized_ever     | boolean | 0/1   | false | false | ever in hospital |
| icu_ever              | boolean | 0/1   | false | false | ever in ICU |
| intubated_ever        | boolean | 0/1   | false | false | ever intubated |
