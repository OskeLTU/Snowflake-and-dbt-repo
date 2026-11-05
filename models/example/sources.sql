version: 2

sources:
  - name: raw_shop
    database: pc_dbt_db
    schema: dbt_odauneckas
    tables:
      - name: customer_orders