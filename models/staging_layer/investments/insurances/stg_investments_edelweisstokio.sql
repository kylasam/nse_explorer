select 
       6 as investment_code,
       108 as src_sys_id,
       md.month_start_date, 
       '400158915E' as policy_number,
       'Edelweiss Tokio Life - Smart Lifestyle V1.0' as plan_name,
       CASE 
           WHEN md.month_start_date > '2025-08-01' then 0
           ELSE coalesce(sc.premium_amount, 0) 
        END as premium_amount,
        current_timestamp() as edw_publn_id
from {{ source("MONTHLY_EXPENSES_SOURCE", "dates_mnthly") }} md
left join
    (
        select 
            dates as premium_dates, 
            51000 as premium_amount
        from
            unnest(
                generate_date_array('2018-08-01', '2028-08-01', interval 12 month)
            ) dates
    ) sc
    on md.month_start_date = sc.premium_dates
order by 2
