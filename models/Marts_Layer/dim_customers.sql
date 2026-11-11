WITH latest_customer_data AS (
    SELECT
        customer_id,
        customer_tier,
        signup_date,
        ROW_NUMBER() OVER (
            PARTITION BY customer_id
            ORDER BY
                CASE
                    WHEN customer_tier = 'VIP' THEN 2
                    ELSE 1
                END DESC
        ) AS lcd
    FROM {{ref('int_mock_customer_orders')}}
)

SELECT
    customer_id,
    customer_tier,
    signup_date
FROM latest_customer_data
