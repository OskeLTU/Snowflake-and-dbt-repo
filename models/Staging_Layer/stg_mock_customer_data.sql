SELECT
    SEQ4() + 1 AS customer_id,
    CASE
        WHEN SEQ4() + 1 = 2 THEN 'VIP'
        WHEN MOD(SEQ4(), 10) = 0 THEN 'VIP'
        ELSE 'Standard'
    END AS customer_tier,
    DATEADD('day', -MOD(SEQ4(), 365), '2026-01-01'::DATE) AS signup_date
FROM TABLE(GENERATOR(ROWCOUNT => 1000))