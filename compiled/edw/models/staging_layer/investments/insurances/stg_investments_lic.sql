select 
       6 as investment_code,
       109 as src_sys_id,
       md.month_start_date, 
       767955225 as policy_number,
       04117765 as agency_code,
       coalesce(sc.premium_amount, 0) as premium_amount,
       current_timestamp() as edw_publn_id
from `kylash-edw`.`raw_layer`.`dates_mnthly` md
left join
    (
        select 
            dates as premium_dates, 
            25000 as premium_amount
        from
            unnest(
                generate_date_array('2016-03-01', '2035-03-01', interval 12 month)
            ) dates
    ) sc
    on md.month_start_date = sc.premium_dates
order by 2