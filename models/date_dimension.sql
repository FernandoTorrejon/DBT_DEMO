WITH CTE AS (
    select to_timestamp(started_at) as started_at, 
    date(to_timestamp(started_at)) as date_started_at,
    lpad(hour(to_timestamp(started_at)), 2, '0') as hour_started_at,
    CASE
      WHEN dayname(to_timestamp(started_at)) IN ('Sat','Sun') THEN 'Weekend' else 'BusinessDay' END as day_of_week,
    CASE 
      WHEN MONTH(to_timestamp(started_at)) IN (12,1,2) THEN 'Winter'
      WHEN MONTH(to_timestamp(started_at)) IN (3,4,5) THEN 'Spring'
      WHEN MONTH(to_timestamp(started_at)) IN (6,7,8) THEN 'Summer'
      WHEN MONTH(to_timestamp(started_at)) IN (9,10,11) THEN 'Autumn'
      ELSE 'Not exist' END
      AS STATION_OF_YEAR
    from
    {{ source('demo', 'bike') }}
)

select *
from CTE