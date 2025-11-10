{{ config(

    materialized = 'table',

    database = 'GROUP4',

    schema = 'dw_ecoessentials'

) }}
 
select

    o.order_id,

    c.customer_key,

    p.product_id,

    d.date_key,

    pc.promotional_campaign_key,

    ol.quantity,

    ol.discount,

    ol.price_after_discount
 
from LUCYZENGER.ECOESSENTIALS_SALES_TRANSACTIONAL_DB.order_line ol
 
join LUCYZENGER.ECOESSENTIALS_SALES_TRANSACTIONAL_DB."ORDER" o

    on try_to_number(ol.order_id) = try_to_number(o.order_id)
 
left join GROUP4.dw_ecoessentials.dim_customer c

    on try_to_number(o.customer_id) = try_to_number(c.customer_id)
 
left join LUCYZENGER.ECOESSENTIALS_SALES_TRANSACTIONAL_DB.product p

    on try_to_number(ol.product_id) = try_to_number(p.product_id)
 
left join GROUP4.dw_ecoessentials.dim_promotional_campaign pc

    on try_to_number(ol.campaign_id) = try_to_number(pc.campaign_id)
 
left join GROUP4.dw_ecoessentials.dim_date d

    on cast(o.order_timestamp as date) = d.date_value

 