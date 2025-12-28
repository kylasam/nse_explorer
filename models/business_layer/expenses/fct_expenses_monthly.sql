select 
       10 as investment_code,
       md.month_start_date,
       CASE WHEN md.month_start_date >= '2022-10-01'
            THEN 500 
            ELSE 0
        End as
            expense_amt,
       'Pournami Poojai' as expense_type
from {{ source("MONTHLY_EXPENSES_SOURCE", "dates_mnthly") }} md
UNION ALL
select 
       10 as investment_code,
       md.month_start_date,
       CASE WHEN md.month_start_date >= '2022-10-01'
            THEN 500 
            ELSE 0
        End as
            expense_amt,
       'Pournami Poojai Karuchikumara swamy temple' as expense_type
from {{ source("MONTHLY_EXPENSES_SOURCE", "dates_mnthly") }} md
UNION ALL
select 
       11 as investment_code,
       md.month_start_date,
       CASE WHEN md.month_start_date >= '2022-04-01'
            THEN 1000 
            ELSE 0
        End as
            expense_amt,
       'Mother Kind Trust' as expense_type
from {{ source("MONTHLY_EXPENSES_SOURCE", "dates_mnthly") }} md
UNION ALL
select 
       11 as investment_code,
       md.month_start_date,
       CASE WHEN md.month_start_date >= '2019-02-01' and md.month_start_date <= '2019-06-01'
                THEN 2000 
            WHEN md.month_start_date >= '2019-06-01' 
                THEN 4000
            ELSE 0
        End as
            expense_amt,
       'Mutual Funds SIP' as expense_type
from {{ source("MONTHLY_EXPENSES_SOURCE", "dates_mnthly") }} md
UNION ALL
select
   5 as investment_code,
   month_start_date,
   amount as expense_amt,
   'kasthuri ka arruchamy chit' as expense_type
FROM {{ ref("stg_investments_kasthuri_ka_arruchamy_chit") }}
UNION ALL
select
   5 as investment_code,
   month_start_date,
   amount as expense_amt,
   'manjula chit' as expense_type
FROM {{ ref("stg_investments_manjula_chit") }}
UNION ALL
select
   5 as investment_code,
   month_start_date,
   amount as expense_amt,
   'kasthuri ka colleage staff chit' as expense_type
FROM {{ ref("stg_investments_kasthuri_ka_colleage_staff_chit") }}
UNION ALL
select
   5 as investment_code,
   month_start_date,
   amount as expense_amt,
   'kasthuri ka komala mam chit' as expense_type
FROM {{ ref("stg_investments_kasthuri_ka_komala_mam_chit") }}
UNION ALL
select
   5 as investment_code,
   month_start_date,
   amount as expense_amt,
   'shanker chit' as expense_type
FROM {{ ref("stg_investments_shanker_chit") }}
UNION ALL
select
   5 as investment_code,
   month_start_date,
   amount as expense_amt,
   'sharath chit' as expense_type
FROM {{ ref("stg_investments_sharath_chit") }}
UNION ALL
select
   6 as investment_code,
   month_start_date,
   amount as expense_amt,
   'Bike Insurance KA51HC3151' as expense_type
FROM {{ ref("stg_insurance_KA51HC3151") }}
UNION ALL
select
   6 as investment_code,
   month_start_date,
   amount as expense_amt,
   'edelweisstokio' as expense_type
FROM {{ ref("stg_investments_edelweisstokio") }}
UNION ALL
select
   6 as investment_code,
   month_start_date,
   amount as expense_amt,
   'lic' as expense_type
FROM {{ ref("stg_investments_lic") }}
UNION ALL
select
   6 as investment_code,
   month_start_date,
   amount as expense_amt,
   'maxlife_term_insurance' as expense_type
FROM {{ ref("stg_maxlife_term_insurance") }}
UNION ALL
select 
       12 as investment_code,
       md.month_start_date,
       CASE WHEN md.month_start_date >= '2023-07-01'
            THEN 15000
            ELSE 0
        End as
            expense_amt,
       'Gobi Home Expenses' as expense_type
from {{ source("MONTHLY_EXPENSES_SOURCE", "dates_mnthly") }} md
UNION ALL
select
   6 as investment_code,
   month_start_date,
   amount as expense_amt,
   'aviva' as expense_type
FROM {{ ref("stg_investments_aviva") }}
UNION ALL
select
   5 as investment_code,
   month_start_date,
   amount as expense_amt,
   'Velusamy Shakti chit' as expense_type
FROM {{ ref("stg_investments_velusamy_shakti_chit") }}
UNION ALL
select
   6 as investment_code,
   month_start_date,
   amount as expense_amt,
   'pnbmetlife' as expense_type
FROM {{ ref("stg_investments_pnbmetlife") }}