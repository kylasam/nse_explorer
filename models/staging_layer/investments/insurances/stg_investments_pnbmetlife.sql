select 
       6 as investment_code,
       108 as src_sys_id,
       md.month_start_date, 
       '25681151' as policy_number,
       'PNB MetLife GOAL ENSURING MULTIPLIER' as plan_name,
       CASE 
           WHEN md.month_start_date > '2024-08-15' then 0
           ELSE coalesce(sc.premium_amount, 0) 
        END as amount,
        current_timestamp() as edw_publn_id
from {{ source("MONTHLY_EXPENSES_SOURCE", "dates_mnthly") }} md
left join
    (
        select 
            dates as premium_dates, 
            260000 as premium_amount
        from
            unnest(
                generate_date_array('2024-08-01', '2025-08-01', interval 12 month)
            ) dates
    ) sc
    on md.month_start_date = sc.premium_dates
order by 3

