select 
       2 as investment_code,
       106 as src_sys_id,
       md.month_start_date,
       CASE 
           WHEN md.month_start_date >= '2019-02-01' and md.month_start_date <= '2019-08-01' then 6000
           WHEN md.month_start_date >= '2020-09-01' and md.month_start_date <= '2021-07-01' then 25000
           WHEN md.month_start_date >= '2021-08-01' and md.month_start_date <= '2022-06-01' then 35000
           WHEN md.month_start_date >= '2023-02-01' and md.month_start_date <= '2023-12-01' then 40000
           ELSE 0 
        END as chit_amount,
        current_timestamp() as edw_publn_id
from {{ source("MONTHLY_EXPENSES_SOURCE", "dates_mnthly") }} md
left join
    (
        select 
            dates as chit_dates, 
            0 as chit_amount
        from
            unnest(
                generate_date_array('2019-01-01', '2071-01-01', interval 1 month)
            ) dates
    ) sc
    on md.month_start_date = sc.chit_dates
order by 2
