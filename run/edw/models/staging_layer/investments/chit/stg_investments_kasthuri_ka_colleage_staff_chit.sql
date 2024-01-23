
  
    

    create or replace table `kylash-edw`.`staging_layer`.`stg_investments_kasthuri_ka_colleage_staff_chit`
      
    
    

    OPTIONS()
    as (
      select 
       5 as investment_code,
       101 as src_sys_id,
       md.month_start_date, 
       coalesce(sc.chit_amount, 0) as chit_amount,
       current_timestamp() as edw_publn_id
from `kylash-edw`.`raw_layer`.`dates_mnthly` md
left join
    (
        select 
            dates as chit_dates, 
            25000 as chit_amount
        from
            unnest(
                generate_date_array('2018-11-01', '2023-05-01', interval 6 month)
            ) dates
    ) sc
    on md.month_start_date = sc.chit_dates
order by 1
    );
  