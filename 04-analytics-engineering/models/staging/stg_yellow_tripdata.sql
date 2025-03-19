with 

source as (
    select * from {{source('staging','yellow_tripdata')}}
)