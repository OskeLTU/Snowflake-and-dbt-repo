SELECT
    customer_id,
    signup_date
FROM {{ref("dim_customers")}}
WHERE signup_date > CURRENT_DATE()