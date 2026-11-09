SELECT
    d.customer_id,
    d.customer_tier,
    d.signup_date,
    f.total_orders,
    f.total_spend,
    f.avg_order_amount,
    f.last_order_date
FROM {{ref('dim_customers')}} AS d
LEFT JOIN {{ref('fct_customer_summary')}} as f
    ON d.customer_id = f.customer_id