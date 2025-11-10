{{ config(
    materialized = 'table',
    database = 'GROUP4',
    schema = 'dw_ecoessentials'
)}}
 
select distinct
    {{ dbt_utils.generate_surrogate_key(['emailname', 'sendtimestamp']) }} as email_key,
    emailid,
    emailname,
    campaignid,
    campaignname,
    sendtimestamp
from {{ ref('stg_email_marketing_events') }}