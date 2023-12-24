select
    src_sys_id,
    sum(premium_amount) as premium_amount
    from(
select 
        src_sys_id,
        premium_amount,

FROM
{{ ref("stg_investments_edelweisstokio") }}
where current_date() >= month_start_date
UNION ALL
select 
        src_sys_id,
        premium_amount,

FROM
{{ ref("stg_investments_lic") }}
where current_date() >= month_start_date)
group by 1
