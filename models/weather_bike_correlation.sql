WITH CTE AS (
    select 

        trip.*,
        dailyweather.*

    from {{ ref('trip_fact') }} trip
    LEFT JOIN {{ ref('daily_weather') }} dailyweather
    on trip.TRIP_DATE = dailyweather.DAILY_WEATHER
    WHERE trip.TRIP_DATE = '2016-11-21' -- Date verified in both tables
    ORDER BY TRIP_DATE DESC
)

select * from CTE