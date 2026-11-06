select
    customer_name,
    signup_date,
    count(*) as total_records
from {{ref("stg_customers")}}
group by 1, 2