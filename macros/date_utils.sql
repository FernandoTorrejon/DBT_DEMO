--{% macro function1(x) %}

--CASE WHEN to_timestamp({{x}}) < CURRENT_DATE THEN 'Past' 
--     ELSE 'FUTURE' END

--{% endmacro%}

{% macro get_season(date) %}

 CASE 
      WHEN MONTH(to_timestamp({{ date }})) IN (12,1,2) THEN 'WINTER'
      WHEN MONTH(to_timestamp({{ date }})) IN (3,4,5) THEN 'SPRING'
      WHEN MONTH(to_timestamp({{ date }})) IN (6,7,8) THEN 'SUMMER'
      WHEN MONTH(to_timestamp({{ date }})) IN (9,10,11) THEN 'AUTUMN'
      ELSE 'Not recognized' END

{% endmacro %}

{% macro day_type(date) %}

 CASE
      WHEN dayname(to_timestamp({{ date }})) IN ('Sat','Sun') THEN 'WEEKEND' 
      ELSE 'BUSINESSDAY' 
 END

{% endmacro %}