
SELECT 
    SEQ4() as order_id,
    UNIFORM(1, 1000, RANDOM()) as customer_id,
    UNIFORM(10, 500, RANDOM()) as order_amount,
    DATEADD('day', -UNIFORM(1, 365, RANDOM()), CURRENT_DATE()) as order_date
FROM TABLE(GENERATOR(ROWCOUNT => 50000))