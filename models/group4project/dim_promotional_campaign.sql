{{ config(
    materialized = 'table',
    database = 'GROUP4',
    schema = 'dw_ecoessentials'
)}}
 
with unified as (
    select
        campaign_id,
        campaign_name,
        campaign_discount
    from {{ source('ecoessentials_sales_transactional_db', 'promotional_campaign') }}
 
    union all
 
    select
        campaignid as campaign_id,
        campaignname as campaign_name,
        null as campaign_discount
    from {{ ref('stg_email_marketing_events') }}
)
 
select distinct
    {{ dbt_utils.generate_surrogate_key(['campaign_name']) }} as promotional_campaign_key,
    *
from unified