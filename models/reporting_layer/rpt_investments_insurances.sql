select
    start_dt,
    sum(amount) as premium_amount,
    insurer_type,
    end_dt
    from(
select 
        min(month_start_date) as start_dt,
        amount,
        'edelweisstokio' as insurer_type,
        max(month_start_date) as end_dt,

FROM
{{ ref("stg_investments_edelweisstokio") }}
where amount > 0
group by 2,3
UNION ALL
select 
        min(month_start_date) as start_dt,
        amount,
        'lic' as insurer_type,
        max(month_start_date) as end_dt,

FROM
{{ ref("stg_investments_lic") }}
where amount > 0
group by 2,3)
group by 1,3,4
