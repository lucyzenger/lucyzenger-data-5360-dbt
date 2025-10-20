{{
    config(
        materialized = "table"
    )
}}

select
    STORE_ID as store_key,
    STORE_NAME,
    STREET,
    CITY,
    STATE
from {{ source('oliver_fivetran', 'store') }}
