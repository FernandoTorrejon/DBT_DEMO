WITH CTE AS (
    select 
    trip.*,
    daily.*
    from {{ ref('trip_fact') }} trip
    LEFT JOIN {{ ref('daily_weather') }} daily
    on trip.TRIP_DATE = daily.DAILY_WEATHER
    WHERE trip.TRIP_DATE = '2016-11-21'
    ORDER BY TRIP_DATE DESC
)

select * from CTE