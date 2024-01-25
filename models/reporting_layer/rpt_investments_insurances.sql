select
    src_sys_id,
    sum(amount) as premium_amount
    from(
select 
        src_sys_id,
        amount,

FROM
{{ ref("stg_investments_edelweisstokio") }}
where current_date() >= month_start_date
UNION ALL
select 
        src_sys_id,
        amount,

FROM
{{ ref("stg_investments_lic") }}
where current_date() >= month_start_date)
group by 1
