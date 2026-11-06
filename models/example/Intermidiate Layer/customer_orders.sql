
with customers as (
    select 1 as customer_id, 'Alice' as customer_name, '2025-01-15' as signup_date
    union all
    select 2 as customer_id, 'Bob' as customer_name, '2025-02-20' as signup_date
),

transformed as (
    select
        customer_id,
        upper(customer_name) as customer_uppercase_name,
        signup_date::date as signup_date
    from customers
)

select * from transformed