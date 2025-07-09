WITH BIKE as (
    select distinct
    START_STATION_ID,
    START_STATION_NAME,
    START_LAT,
    START_LNG
    from {{ source('demo', 'bike') }}
)

select *
from BIKE