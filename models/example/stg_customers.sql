select
    customer_id,
    customer_uppercase_name as customer_name,
    signup_date
from {{source('raw_shop', 'customer_orders')}}