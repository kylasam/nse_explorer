select
     chitters,
     total_chit_amt,
     chit_start_dt,
     chit_end_dt
     from(
select 
      'kasthuri_Arruchamy' as chitters,
      sum(amount) as total_chit_amt,
      min(month_start_date) as chit_start_dt,
      max(month_start_date) as chit_end_dt
       from 
            {{ ref("stg_investments_kasthuri_ka_arruchamy_chit") }}
            where amount > 0
        group by 1
UNION ALL
select 
      'kasthuri_colleage_staff' as chitters,
      sum(amount) as total_chit_amt,
      min(month_start_date) as chit_start_dt,
      max(month_start_date) as chit_end_dt
       from 
            {{ ref("stg_investments_kasthuri_ka_colleage_staff_chit") }}
            where amount > 0
        GROUP BY 1
UNION ALL
select 
      'kasthuri_komala_mam' as chitters,
      sum(amount) as total_chit_amt,
      min(month_start_date) as chit_start_dt,
      max(month_start_date) as chit_end_dt
       from 
            {{ ref("stg_investments_kasthuri_ka_komala_mam_chit") }}
            where amount >0
        GROUP BY 1
UNION ALL
select 
      'Shanker_Jayashree' as chitters,
      sum(amount) as total_chit_amt,
      min(month_start_date) as chit_start_dt,
      max(month_start_date) as chit_end_dt
       from 
            {{ ref("stg_investments_shanker_chit") }}
            where amount >0
        GROUP BY 1
UNION ALL
select 
      'Sharath_kylash' as chitters,
      sum(amount) as total_chit_amt,
      min(month_start_date) as chit_start_dt,
      max(month_start_date) as chit_end_dt
       from 
            {{ ref("stg_investments_sharath_chit") }}
            where amount >0 
        GROUP BY 1  where chit_end_dt >= CURRENT_DATE()
UNION ALL
select 
      'veluchamy_shakti' as chitters,
      sum(amount) as total_chit_amt,
      min(month_start_date) as chit_start_dt,
      max(month_start_date) as chit_end_dt
       from 
            {{ ref("stg_investments_velusamy_shakti_chit") }}
            where amount >0 
        GROUP BY 1 ) where chit_end_dt >= CURRENT_DATE()