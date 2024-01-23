
  
    

    create or replace table `kylash-edw`.`staging_layer`.`stg_investments_shanker_chit`
      
    
    

    OPTIONS()
    as (
      select 
       5 as investment_code,
       104 as src_sys_id,
       md.month_start_date, 
       coalesce(sc.chit_amount, 0) as chit_amount,
       current_timestamp() as edw_publn_id
from `kylash-edw`.`raw_layer`.`dates_mnthly` md
left join
    (
        select 
            dates as chit_dates, 
            50000 as chit_amount
        from
            unnest(
                generate_date_array('2021-05-01', '2026-06-01', interval 5 month)
            ) dates
    ) sc
    on md.month_start_date = sc.chit_dates
order by 1
    );
  