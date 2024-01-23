
    
    

with dbt_test__target as (

  select policy_number as unique_field
  from `kylash-edw`.`staging_layer`.`stg_investments_edelweisstokio`
  where policy_number is not null

)

select
    unique_field,
    count(*) as n_records

from dbt_test__target
group by unique_field
having count(*) > 1


