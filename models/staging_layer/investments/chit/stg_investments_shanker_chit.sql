select 
       5 as investment_code,
       104 as src_sys_id,
       md.month_start_date, 
       'investment' as expenses_portfolio,
       'chit' as investment_type,
       'Shanker_Jayashree' as investment_with,
       coalesce(sc.amount, 0) as amount,
       current_timestamp() as edw_publn_id
from {{ source("MONTHLY_EXPENSES_SOURCE", "dates_mnthly") }} md
left join
    (
        select 
            dates as chit_dates, 
            50000 as amount
        from
            unnest(
                generate_date_array('2021-05-01', '2026-06-01', interval 5 month)
            ) dates
    ) sc
    on md.month_start_date = sc.chit_dates
order by 1

