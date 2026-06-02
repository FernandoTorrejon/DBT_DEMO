-- Common Table Expression (CTE)
-- with reviews as (
--    SELECT * FROM {# {{ source('landing', 'reviews') }} #} 
-- ),
--     products as (
--    SELECT
--    id,
--    created_at,
--    title as product_name,
--    category,
--    ean,
--    vendor,
--    price
--    FROM
--    {# {{ source('landing', 'products') }} #}
-- )

SELECT
    date(date_format(review.created_at, 'yyyy-MM-dd')) as review_date,
    review.product_id,
    product.product_name,
    avg(review.rating) as avg_rating
FROM {{ ref('bronze_reviews') }} review
LEFT JOIN {{ ref('silver_products') }} product
-- FROM reviews review
--     LEFT JOIN products product 
ON review.product_id = product.id
group by all
