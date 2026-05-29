-- Take preference over properties.yml and dbt_project.yml

{#
{{
   config(
        materialized = 'table',
        schema = 'gold'
   )
}}
#}


SELECT
    order.order_date,
    product.product_name,
    product.category,
    product.vendor,
    user.city,
    user.state,
    user.sales_channel,
    sum(order.order_amount) as total_revenue
FROM
{{ ref('silver_orders') }} order 
LEFT JOIN {{ ref('silver_products') }} product 
ON order.product_id = product.id
LEFT JOIN {{ ref('silver_users') }} user
ON order.user_id = user.id
group by all