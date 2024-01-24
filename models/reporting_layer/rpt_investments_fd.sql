select 
        investment_code,
        BANK_NAME,				
        DEPOSIT_AMOUNT,				
        DEPOSIT_PERIOD_DAYS,				
        start_date,				
        end_date,				
        rate_of_interest,				
        Maturity_amt
FROM
{{ source('MONTHLY_EXPENSES_SOURCE', 'investments_fd') }}
where current_date() <= end_date
order by 1
