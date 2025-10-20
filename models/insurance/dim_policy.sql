{{config(
    materialized = 'table',
    schema = 'dw_insurance'
    )
}}

select
    policyid as policy_key,
    policyid,
    policytype
from {{ source('insurance_landing', 'policies')}}