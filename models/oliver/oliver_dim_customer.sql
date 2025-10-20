{{
    config(
        materialized = "table"
    )
}}

select
    customer_id as customer_key, -- or your chosen name
    first_name,
    last_name,
    email,
    -- add other columns you want in your dimension
from {{ source('oliver_fivetran', 'customer') }}
