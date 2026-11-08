SELECT
    o.order_id,
    o.customer_id,
    c.customer_tier,
    c.signup_date,
    o.order_amount,
    o.order_date
FROM {{ ref('stg_mock_orders') }} AS o
LEFT JOIN {{ ref('stg_mock_customer_data') }} AS c
    ON o.customer_id = c.customer_id