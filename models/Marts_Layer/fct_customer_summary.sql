
SELECT
    customer_id,
    COUNT(order_id) as total_orders,
    SUM(order_amount) as total_spend,
    AVG(order_amount) as avg_order_amount,
    MAX(order_date) as last_order_date
FROM {{ ref('stg_mock_orders')}}
GROUP BY customer_id 