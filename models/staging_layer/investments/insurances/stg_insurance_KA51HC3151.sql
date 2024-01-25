select 
       6 as investment_code,
       107 as src_sys_id,
       md.month_start_date,
       CASE
           WHEN  md.month_start_date >= '2023-01-01' and md.month_start_date <= '2026-08-01' then 'MW898400'
           ELSE '0000000000'
           END as policy_number,
       'IffcoTokio 3 years Bike insurance' as plan_name,
       coalesce(sc.premium_amount, 0) as amount,
       current_timestamp() as edw_publn_id
from {{ source("MONTHLY_EXPENSES_SOURCE", "dates_mnthly") }} md
left join
    (
        select 
            dates as premium_dates, 
            1700 as premium_amount
        from
            unnest(
                generate_date_array('2019-05-01', '2071-12-01', interval 12 month)
            ) dates
    ) sc
    on md.month_start_date = sc.premium_dates
order by 2

