SELECT
    date(date_format(review.created_at, 'yyyy-MM-dd')) as review_date,
    review.product_id,
    product.product_name,
    avg(review.rating) as avg_rating
FROM {{ ref('bronze_reviews') }} review
LEFT JOIN {{ ref('silver_products') }} product
ON review.product_id = product.id
group by all