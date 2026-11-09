SELECT DISTINCT 
    customer_id,
    customer_tier,
    signup_date
FROM {{ ref('int_mock_customer_orders')}}
GROUP BY 
    customer_id,
    customer_tier,
    signup_date