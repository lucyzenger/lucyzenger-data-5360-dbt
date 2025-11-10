{{ config(
    materialized = 'table',
    database = 'GROUP4',
    schema = 'dw_ecoessentials'
)}}
 
select
    c.customer_key,
    e.email_key,
    pc.promotional_campaign_key,
    d.date_key,
    eme.eventtype,
    eme.eventtimestamp
from {{ ref('stg_email_marketing_events') }} eme
join {{ ref('dim_customer') }} c
    on eme.subscriberemail = c.email
join {{ ref('dim_email') }} e
    on eme.emailname = e.emailname
join {{ ref('dim_promotional_campaign') }} pc
    on eme.campaignname = pc.campaign_name
join {{ ref('dim_date') }} d
    on cast(eme.eventtimestamp as date) = d.date_value