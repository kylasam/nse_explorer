select 
    month_start_date as expenses_month,
    expense_amt,
    expense_type 
    FROM {{ ref("fct_expenses_monthly") }}
where expense_amt >0
