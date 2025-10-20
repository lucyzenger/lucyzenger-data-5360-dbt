{{
    config(
        materialized = "table"
    )
}}

select
    f.sales_key,
    f.order_id,
    f.product_id,
    f.quantity,
    f.unit_price,
    f.sales_amount,
    c.first_name,
    c.last_name,
    p.product_name
from {{ ref('fact_sales') }} f
join {{ ref('oliver_dim_customer') }} c
    on f.order_id = c.customer_key  -- Change this if you have a CUSTOMER_ID in fact_sales!
join {{ ref('oliver_dim_product') }} p
    on f.product_id = p.product_key
