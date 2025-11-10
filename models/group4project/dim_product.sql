{{ config(
    materialized = 'table',
    database = 'GROUP4',
    schema = 'dw_ecoessentials'
) }}
 
-- Product Dimension for Eco Essentials
-- Grain: One row per unique product_id
 
select
    product_id,
    product_type,
    product_name,
    price
from {{ source('ecoessentials_sales_transactional_db', 'product') }}