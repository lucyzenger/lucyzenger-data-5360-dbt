{{
    config(
        materialized = "table"
    )
}}

select
    ORDER_LINE_ID as sales_key,
    ORDER_ID,
    PRODUCT_ID,
    QUANTITY,
    UNIT_PRICE,
    QUANTITY * UNIT_PRICE as sales_amount
from {{ source('oliver_fivetran', 'orderline') }}
