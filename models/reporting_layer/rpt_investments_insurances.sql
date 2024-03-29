select
    start_dt,
    premium_amount,
    insurer_type,
    end_dt
    from(
select 
        min(month_start_date) as start_dt,
        sum(amount) as premium_amount,
        'edelweisstokio' as insurer_type,
        max(month_start_date) as end_dt,

FROM
{{ ref("stg_investments_edelweisstokio") }}
where amount > 0
group by 3
UNION ALL
select 
        min(month_start_date) as start_dt,
        sum(amount) as premium_amount,
        'lic' as insurer_type,
        max(month_start_date) as end_dt,

FROM
{{ ref("stg_investments_lic") }}
where amount > 0
group by 3)
