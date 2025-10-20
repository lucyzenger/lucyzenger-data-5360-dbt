{{
    config(
        materialized = "table"
    )
}}

select
    PRODUCT_ID as product_key,
    PRODUCT_NAME,
    DESCRIPTION,
    UNIT_PRICE
from {{ source('oliver_fivetran', 'product') }}
