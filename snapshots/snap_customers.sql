{% snapshot snap_customers %}

{{
    config(
        target_schema='snapshots',
        unique_key='customer_id',
        strategy='check',
        check_cols=['customer_tier', 'signup_date']
    )
}}

SELECT * FROM {{ ref('stg_mock_customer_data') }}

{% endsnapshot %}