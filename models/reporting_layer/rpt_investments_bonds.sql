select 
        invest_platform, 
        issurer,
        sector,
        total_investment,
        deposit_period_days,
        start_date,
        end_date,
        rate_of_interest,
        maturity_amt
FROM
{{ source('MONTHLY_EXPENSES_SOURCE', 'investments_bonds') }}
where current_date() <= end_date
order by 1
