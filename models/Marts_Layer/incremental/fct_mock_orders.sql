SELECT
    order_id,
    customer_id,
    order_amount,
    order_date
FROM {{ ref('stg_mock_orders') }}

{% if is_incremental() %}
WHERE order_date > (SELECT MAX(order_date) FROM {{ this }})
{% endif %}