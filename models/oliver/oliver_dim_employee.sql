{{
    config(
        materialized = "table"
    )
}}

select
    EMPLOYEE_ID as employee_key,
    FIRST_NAME,
    LAST_NAME,
    EMAIL
from {{ source('oliver_fivetran', 'employee') }}
