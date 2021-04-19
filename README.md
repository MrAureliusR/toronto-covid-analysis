# COVID-19 Analysis for the City of Toronto

This repository holds data files, scripts, and other material used to
teach database operations by analyzing COVID-19 data from the City of
Toronto.

For details on the raw census data see toronto-covid19-2021-04-19.md.
For details on the raw COVID-19 data see toronto-covid19-2021-04-19.md.

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
