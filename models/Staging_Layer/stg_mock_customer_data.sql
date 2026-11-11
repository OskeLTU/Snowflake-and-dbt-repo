SELECT
    SEQ4() as customer_id,
    CASE
        WHEN UNIFORM(1, 10, RANDOM()) = 1 THEN 'VIP'
        ELSE 'Standard'
    end as customer_tier,
    DATEADD('day', -UNIFORM(365, 730, RANDOM()), CURRENT_DATE()) as signup_date
FROM TABLE(GENERATOR(ROWCOUNT => 1000))