select *
from {{ ref('customer_orders') }}
where customer_id = 1