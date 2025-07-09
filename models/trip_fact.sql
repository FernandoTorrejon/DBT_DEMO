WITH TRIPS as (
    select 
        RIDE_ID,
	    RIDEABLE_TYPE,
	    STARTED_AT,
        DATE(STARTED_AT) as TRIP_DATE,
	    START_STATION_ID,
    	END_STATION_ID,
    	MEMBER_CSUAL,   
        TIMESTAMPDIFF(SECONDS, STARTED_AT, ENDED_AT) as TRIP_DURATION_SECONDS
        
    from {{ source('demo', 'bike') }}
    limit 10
)

select *
from TRIPS