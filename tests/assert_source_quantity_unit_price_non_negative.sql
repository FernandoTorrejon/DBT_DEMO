{{config(severity = 'warn')}}

-- Test will passes if results of this query return zero rows
SELECT
*
FROM
{{ source('landing','orders') }}
WHERE unit_price < 0 or quantity < 0