-- Add a tag
{{
    config(
        tags='contains_pii'
    )
}}

SELECT 
*
FROM {{ source('landing', 'orders') }}