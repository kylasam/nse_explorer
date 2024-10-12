select
    start_dt,
    premium_amount,
    insurer_type,
    end_dt
from (
    select 
        min(month_start_date) as start_dt,
        sum(amount) as premium_amount,
        'edelweisstokio' as insurer_type,
        max(month_start_date) as end_dt
    from {{ ref("stg_investments_edelweisstokio") }}
    where amount > 0
    group by insurer_type

    UNION ALL

    select 
        min(month_start_date) as start_dt,
        sum(amount) as premium_amount,
        'lic' as insurer_type,
        max(month_start_date) as end_dt
    from {{ ref("stg_investments_lic") }}
    where amount > 0
    group by insurer_type

    UNION ALL

    select 
        min(month_start_date) as start_dt,
        sum(amount) as premium_amount,
        'aviva' as insurer_type,
        max(month_start_date) as end_dt
    from {{ ref("stg_investments_aviva") }}
    where amount > 0
    group by insurer_type

    UNION ALL

    select 
        min(month_start_date) as start_dt,
        sum(amount) as premium_amount,
        'pnbmetlife' as insurer_type,
        max(month_start_date) as end_dt
    from {{ ref("stg_investments_pnbmetlife") }}
    where amount > 0
    group by insurer_type
)
