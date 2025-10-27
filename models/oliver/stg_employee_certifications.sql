{{ config(
    materialized = 'table',
    schema = 'oliver_dw_source'
) }}

select
    EMPLOYEE_ID,
    FIRST_NAME,
    LAST_NAME,
    EMAIL,
    PARSE_JSON(CERTIFICATION_JSON):certification_name::string as certification_name,
    PARSE_JSON(CERTIFICATION_JSON):certification_cost::float as certification_cost,
    PARSE_JSON(CERTIFICATION_JSON):certification_awarded_date::date as certification_awarded_date
from {{ source('employee_certifications', 'employee_certifications') }}
