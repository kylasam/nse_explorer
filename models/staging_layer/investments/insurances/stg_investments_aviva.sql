select 
       6 as investment_code,
       111 as src_sys_id,
       md.month_start_date, 
       '10553866' as policy_number,
       'Aviva Signature Investment Pln' as plan_name,
       CASE 
           WHEN md.month_start_date > '2025-08-01' then 0
           ELSE coalesce(sc.premium_amount, 0) 
        END as amount,
        current_timestamp() as edw_publn_id
from {{ source("MONTHLY_EXPENSES_SOURCE", "dates_mnthly") }} md
left join
    (
        select 
            dates as premium_dates, 
            156000 as premium_amount
        from
            unnest(
                generate_date_array('2024-03-01', '2044-03-01', interval 12 month)
            ) dates
    ) sc
    on md.month_start_date = sc.premium_dates
order by 3

