
    
    

with dbt_test__target as (

  select month_start_date as unique_field
  from `kylash-edw`.`staging_layer`.`stg_investments_edelweisstokio`
  where month_start_date is not null

)

select
    unique_field,
    count(*) as n_records

from dbt_test__target
group by unique_field
having count(*) > 1


