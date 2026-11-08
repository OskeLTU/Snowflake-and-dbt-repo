
SELECT
    customer_id,
    customer_tier,
    COUNT(order_id) as total_orders,
    SUM(order_amount) as total_spend,
    AVG(order_amount) as avg_order_amount,
    MAX(order_date) as last_order_date
FROM {{ ref('int_mock_customer_orders')}}
GROUP BY customer_id, customer_tier
ORDER BY total_spend DESC