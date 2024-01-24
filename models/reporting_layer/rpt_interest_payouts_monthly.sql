select 
        Date as interest_payput_dt,
        issurer,
        sum(total_amount) as amount
FROM
{{ source('MONTHLY_EXPENSES_SOURCE', 'interest_payouts_monthly') }}
group by 1,2 
order by 1
