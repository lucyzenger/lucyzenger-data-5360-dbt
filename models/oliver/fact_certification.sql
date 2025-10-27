{{ config(
    materialized = 'table',
    schema = 'oliver_dw_source'
) }}

select
    EMPLOYEE_ID as employee_key,
    certification_awarded_date as date_key,
    certification_name,
    certification_cost
from {{ ref('stg_employee_certifications') }}
