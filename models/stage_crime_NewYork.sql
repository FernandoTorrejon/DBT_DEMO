WITH CTE AS (
    SELECT *
    FROM {{ source('us_crime', 'URBAN_CRIME_INCIDENT_LOG') }}
    where CITY = 'New York' and OFFENSE_CATEGORY in ('Theft', 'Driving Under The Influence')
)
SELECT 

    OFFENSE_CATEGORY,
    {{day_type('DATE')}} as DAY_TYPE,      -- Invoke a macro function
    {{get_season('DATE')}} as SEASON, -- Invoke a macro function
    count(OFFENSE_CATEGORY) AS NUMBER_OFFENSE

FROM CTE
GROUP BY OFFENSE_CATEGORY, DAY_TYPE, SEASON
ORDER BY OFFENSE_CATEGORY DESC