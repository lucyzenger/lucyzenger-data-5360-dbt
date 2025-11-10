{{ config(
    materialized = 'table',
    database = 'GROUP4',
    schema = 'dw_ecoessentials'
) }}
 
with db_source as (
    select
        cast(customer_id as text) as customer_id,
        customer_first_name,
        customer_last_name,
        customer_phone,
        customer_address,
        customer_city,
        customer_state,
        customer_zip,
        customer_country
    from {{ source('ecoessentials_sales_transactional_db', 'customer') }}
),
 
marketing_source as (
    select distinct
        cast(customerid as text) as customer_id,
        subscriberfirstname,
        subscriberlastname,
        subscriberemail
    from {{ ref('stg_email_marketing_events') }}
),
 
final as (
    select
        coalesce(db.customer_id, m.customer_id) as customer_id,
        coalesce(db.customer_first_name, m.subscriberfirstname) as first_name,
        coalesce(db.customer_last_name, m.subscriberlastname) as last_name,
        db.customer_phone,
        db.customer_address,
        db.customer_city,
        db.customer_state,
        db.customer_zip,
        db.customer_country,
        m.subscriberemail as email
    from db_source db
    full join marketing_source m
        on db.customer_first_name = m.subscriberfirstname
        and db.customer_last_name = m.subscriberlastname
)
 
select
    {{ dbt_utils.generate_surrogate_key(['first_name', 'last_name', 'email']) }} as customer_key,
    *
from final