-- Add a tag
{{
    config(
        tags='contains_pii'
    )
}}

-- *** unique_key *** -> Configured DBT model to upsert rows into target (this or current model) based on same ID columns to avoid duplicated rows with same id.
--
-- /target/run/models/bronze/bronze_orders folder
-- merge
--    into
--        `dbt_project_catalog`.`bronze`.`bronze_orders` as DBT_INTERNAL_DEST
--    using
--        `bronze_orders__dbt_tmp` as DBT_INTERNAL_SOURCE
--    on      
--              DBT_INTERNAL_SOURCE.`id` <=> DBT_INTERNAL_DEST.`id`   
--    when matched
--        then update set
--            *
--    when not matched
--        then insert
--            *
{{
    config(
        materialized='incremental',
        unique_key = 'id'
    )
}}

SELECT 
*
FROM {{ source('landing', 'orders') }}
-- FROM {# {{ source('landing', 'orders_incremental') }} #}

{# 

To prevent duplicates rows in incremental load in DBT tables 
Only be processed records that arrive into landing.orders_incremental after this date "max(created_at) from `dbt_project_catalog`.`bronze`.`bronze_orders`" based on created_at value

*** this *** indicates current model, in this case bronze_orders.sql
#}
{% if is_incremental() %}

where created_at > (select coalesce(max(created_at),'1900-01-01') from {{ this }}) 

{% endif %}