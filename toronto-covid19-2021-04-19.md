# City of Toronto COVID-19 Data, April 2021

-   Downloaded from: https://open.toronto.ca/dataset/covid-19-cases-in-toronto/

-   Download date: 2021-04-19

## _id	

Unique row identifier for Open Data database.

## Assigned_ID	

A unique ID assigned to cases by Toronto Public Health for the
purposes of posting to Open Data, to allow for tracking of specific
cases.

Please note, cases may be reclassified or removed from posted datasets
over time. This can occur due to duplicate resolution, or other
ongoing data cleaning initiatives. In such instances, the Assigned ID
of that case will no longer appear on the list and will not get
assigned to another case.

## Outbreak Associated	

Outbreak associated cases are associated with outbreaks of COVID-19 in
Toronto healthcare institutions and healthcare settings (e.g.
long-term care homes, retirement homes, hospitals, etc.) and other
Toronto congregate settings (such as homeless shelters).

## Age Group	

Age at time of illness. Age groups (in years): ≤19, 20-29, 30-39,
40-49, 50-59, 60-69, 70-79, 80-89, 90+, unknown (blank)

## Neighbourhood Name	

Toronto is divided into 140 geographically distinct neighborhoods that
were established to help government and community agencies with local
planning by providing socio-economic data for a meaningful geographic
area. Please note that client postal code information is mapped to the
most up-to-date census tract (CT) and neighbourhood information
available from the city. As a result, neighbourhood information is not
available for those with missing postal code or when postal code could
not be mapped/linked to a CT.  FSA

Forward sortation area (i.e. first three characters of postal code)
based on the case's primary home address. FSA values are generated
from client postal codes. One FSA can span multiple neighbourhoods.

## Source of Infection	

The most likely way that cases acquired their COVID-19 infection is
determined by examining several data fields including:

-   A public health investigator's assessment of the most likely source
    of infection.

-   Being associated with a confirmed COVID-19 outbreak

-   Reported risk factors such as contact with a known case or travel

If the public health investigator's assessment is absent, then the
other data fields are used to infer source of acquisition using the
following hierarchy:

-   Cases with episode dates before April 1 2020:

    -   Travel
    -   Outbreak (settings described below)
    -   Household Contact > Close Contact
    -   Community
    -   No information

-   Cases with episode dates on or after April 1 2020:

    -   Outbreak (settings described below)
    -   Household Contact
    -   Close Contact
    -   Travel
    -   Community
    -   No information

Descriptions:

-   Household contact: Case who acquired infection from a household
    contact with a confirmed or probable COVID-19 case (e.g. family
    member, roommate).

-   Close contact with a case: Case who acquired infection from a close
    contact with a confirmed or probable COVID-19 case
    (e.g. co-worker).

-   Outbreaks: Cases linked to known confirmed COVID-19 outbreaks. These
    could include the index case who may have acquired the infection
    elsewhere. Outbreaks settings include:

    -   Outbreaks, Congregate Settings: confirmed outbreaks in Toronto
        in shelters, correctional facilities, group homes, or other
        congregate settings such as hostels or rooming houses.

    -   Outbreaks, Healthcare Institutions: confirmed outbreaks in
        Toronto in long-term care homes, retirement homes, hospitals,
        chronic care hospitals, or other institutional settings.

    -   Outbreaks, Other Settings: confirmed outbreaks in Toronto in
        workplaces, schools, day cares, or outbreaks outside of
        Toronto. We do not validate outbreaks that occur in other
        health units, as such these cases may not be linked to
        confirmed outbreaks.

-   Travel: Case that travelled outside of Ontario in the 14 days prior
    to their symptom onset or test date, whichever is the earliest.

-   Community: Cases who did not travel outside of Ontario, did not
    identify being a close contact with a COVID-19 case, and were not
    part of a known confirmed COVID-19 outbreak.

-   No information: Cases with no information on the source of infection

## Classification	

The application of the provincial case definition to categorize the
cases as confirmed or probable, according to standard criteria. Please
refer to the Ontario Ministry of Health website for Ontario's current
provincial case definitions.

## Episode Date

The episode date is a derived variable that best estimates when the
disease was acquired, and refers to the earliest available date from:
symptom onset (the first day that COVID-19 symptoms occurred),
laboratory specimen collection date, or reported date.

## Reported Date

The date on which the case was reported to Toronto Public Health.

## Client Gender

Self-reported gender. Gender is a system that operates in a social
context and generally classifies people based on their assigned
biological sex.

## Outcome	

-   Fatal: Cases with a fatal outcome reported.

-   Resolved: Cases not reported as deceased, and who are either:

    -   Reported as 'recovered' OR

    -   Where the report date is more than 14 days from symptom onset
        AND the case is not currently hospitalized.

    This number is underreported due to a lag in data entry.

-   Active: All other cases

## Currently Hospitalized	

Cases that are currently admitted to hospital (i.e., no discharge date
reported).

## Currently in ICU

Cases that are currently admitted to the intensive care unit (ICU)
(i.e. no discharge date reported).

## Currently Intubated

Cases that were intubated related to their COVID-19 infection
(includes cases that are currently intubated and those that have been
discharged or deceased).

## Ever Hospitalized

Cases that were hospitalized related to their COVID-19 infection
(includes cases that are currently hospitalized and those that have
been discharged or are deceased).

## Ever in ICU

Cases that were admitted to the intensive care unit (ICU) related to
their COVID-19 infection (includes cases that are currently in ICU and
those that have been discharged or are deceased).

## Ever Intubated

Cases that were intubated related to their COVID-19 infection
(includes cases that are currently intubated and those that have been
discharged or deceased).
