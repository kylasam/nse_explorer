select 
       10 as investment_code,
       111 as src_sys_id,
       md.month_start_date, 
       CASE
           WHEN md.month_start_date >= '2022-03-01' THEN 1000
           ELSE 0
        END as expenses_amount,
        current_timestamp() as edw_publn_id
from `kylash-edw`.`raw_layer`.`dates_mnthly` md
UNION ALL
select 
       9 as investment_code,
       md.month_start_date, 
       CASE
           WHEN md.month_start_date >= '2022-10-01' THEN 500
           ELSE 0
        END as expenses_amount
from `kylash-edw`.`raw_layer`.`dates_mnthly` md
order by 2