SELECT
    d.customer_id,
    d.customer_tier,
    d.signup_date,
    f.total_orders,
    f.total_spend,
    f.last_order_date,
    {{ safe_divide('total_spend', 'total_orders', 2) }} AS avg_order_value
FROM {{ref('dim_customers')}} AS d
LEFT JOIN {{ref('fct_customer_summary')}} as f
    ON d.customer_id = f.customer_id