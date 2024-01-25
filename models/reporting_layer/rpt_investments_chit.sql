select
     chitters,
     sum(amount) as total_chit_amount
     from(
select 
      'kasthuri_Arruchamy' as chitters,
      amount
       from 
            {{ ref("stg_investments_kasthuri_ka_arruchamy_chit") }}
            where current_date() <=(select 
        max(month_start_date) as last_date_of_chit
                                        FROM
                                        {{ ref("stg_investments_kasthuri_ka_arruchamy_chit") }}
                                        where amount >0)
                                        and month_start_date <= current_date()
UNION ALL
select 
      'kasthuri_colleage_staff' as chitters,
      amount
       from 
            {{ ref("stg_investments_kasthuri_ka_colleage_staff_chit") }}
            where current_date() <=(select 
        max(month_start_date) as last_date_of_chit
                                        FROM
                                        {{ ref("stg_investments_kasthuri_ka_colleage_staff_chit") }}
                                        where amount >0)
                                        and month_start_date <= current_date()
UNION ALL
select 
      'kasthuri_komala_mam' as chitters,
      amount
       from 
            {{ ref("stg_investments_kasthuri_ka_komala_mam_chit") }}
            where current_date() <=(select 
        max(month_start_date) as last_date_of_chit
                                        FROM
                                        {{ ref("stg_investments_kasthuri_ka_komala_mam_chit") }}
                                        where amount >0)
                                        and month_start_date <= current_date()
UNION ALL
select 
      'Shanker_Jayashree' as chitters,
      amount
       from 
            {{ ref("stg_investments_shanker_chit") }}
            where current_date() <=(select 
        max(month_start_date) as last_date_of_chit
                                        FROM
                                        {{ ref("stg_investments_shanker_chit") }}
                                        where amount >0)
                                        and month_start_date <= current_date()
UNION ALL
select 
      'Sharath_kylash' as chitters,
      amount
       from 
            {{ ref("stg_investments_sharath_chit") }}
            where current_date() <=(select 
        max(month_start_date) as last_date_of_chit
                                        FROM
                                        {{ ref("stg_investments_sharath_chit") }}
                                        where amount >0)
                                        and month_start_date <= current_date()
     )
     group by 1
