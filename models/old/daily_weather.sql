WITH daily_weather as (
    select 

        date(time) as daily_weather,
        weather,
        temp,
        pressure, 
        humidity,
        clouds

    from {{ source('demo', 'weather') }}
),

daily_weather_aggregate as (
    select daily_weather,
        weather,
        round(avg(temp),2) as avg_temperature,
        round(avg(pressure), 2) as avg_pressure, 
        round(avg(humidity), 2) as avg_humidity,
        round(avg(clouds), 2) as avg_clouds
        --ROW_NUMBER() OVER (PARTITION BY daily_weather ORDER BY count(weather) DESC) as row_number
    from daily_weather
    group by daily_weather, weather

    -- qualify is like a WHERE statement that you use after a GROUP BY statement
    qualify ROW_NUMBER() OVER (PARTITION BY daily_weather ORDER BY count(weather) DESC) = 1

)

select * from daily_weather_aggregate