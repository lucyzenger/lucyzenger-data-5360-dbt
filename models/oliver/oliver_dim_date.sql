{{
    config(
        materialized = "table"
    )
}}

with date_spine as (
    select
        dateadd(day, seq4(), '2020-01-01') as date_day
    from table(generator(rowcount => 1825))
)

select
    date_day as date_key,
    year(date_day) as year,
    month(date_day) as month,
    day(date_day) as day,
    dayofweek(date_day) as day_of_week
from date_spine
