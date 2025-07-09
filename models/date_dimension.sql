WITH CTE AS (
    select to_timestamp(started_at) as started_at, 
    date(to_timestamp(started_at)) as date_started_at,
    lpad(hour(to_timestamp(started_at)), 2, '0') as hour_started_at,
    {{day_type('STARTED_AT')}} as DAY_OF_WEEK, -- Invoke a macro function
    {{get_season('STARTED_AT')}} as STATION_OF_YEAR -- Invoke a macro function
    --  {{function1('STARTED_AT')}} as TIME
    
    from {{ ref('stage_bike') }}
)

select *
from CTE