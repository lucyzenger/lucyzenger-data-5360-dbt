{{ config(
    materialized = 'table',
    database = 'GROUP4',
    schema = 'dw_ecoessentials'
) }}
 
-- =========================================================
-- Date Dimension for Eco Essentials
-- Grain: One row per calendar date
-- Covers years 2020–2030 (you can adjust if needed)
-- =========================================================
 
with date_generator as (
    select
        dateadd(day, row_number() over (order by seq4()) - 1, '2020-01-01') as date_value
    from table(generator(rowcount => 4000))
)
 
select
    to_varchar(date_value, 'YYYYMMDD')::number(8,0) as date_key,
    date_value,
    year(date_value) as year,
    month(date_value) as month,
    day(date_value) as day,
    dayofweek(date_value) as day_of_week,
    dayname(date_value) as day_name,
    monthname(date_value) as month_name,
    week(date_value) as week_of_year,
    quarter(date_value) as quarter
from date_generator