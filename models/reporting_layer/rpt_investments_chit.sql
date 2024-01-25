select
     chitters,
     amount,
     chit_end_dt
     from(
select 
      'kasthuri_Arruchamy' as chitters,
      amount,
      max(month_start_date) as chit_end_dt
       from 
            {{ ref("stg_investments_kasthuri_ka_arruchamy_chit") }}
            where amount > 0
        group by 1,2
UNION ALL
select 
      'kasthuri_colleage_staff' as chitters,
      amount,
      max(month_start_date) as chit_end_dt
       from 
            {{ ref("stg_investments_kasthuri_ka_colleage_staff_chit") }}
            where amount > 0
        GROUP BY 1,2
UNION ALL
select 
      'kasthuri_komala_mam' as chitters,
      amount, 
      max(month_start_date) as chit_end_dt
       from 
            {{ ref("stg_investments_kasthuri_ka_komala_mam_chit") }}
            where amount >0
        GROUP BY 1,2
UNION ALL
select 
      'Shanker_Jayashree' as chitters,
      amount,
      max(month_start_date) as chit_end_dt
       from 
            {{ ref("stg_investments_shanker_chit") }}
            where amount >0
        GROUP BY 1,2
UNION ALL
select 
      'Sharath_kylash' as chitters,
      amount,
      max(month_start_date) as chit_end_dt
       from 
            {{ ref("stg_investments_sharath_chit") }}
            where amount >0 
        GROUP BY 1,2 ) where chit_end_dt >= CURRENT_DATE()
