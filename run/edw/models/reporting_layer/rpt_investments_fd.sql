

  create or replace view `kylash-edw`.`reporting_layer`.`rpt_investments_fd`
  OPTIONS()
  as select 
        investment_code,
        BANK_NAME,				
        DEPOSIT_AMOUNT,				
        DEPOSIT_PERIOD_DAYS,				
        start_date,				
        end_date,				
        rate_of_interest,				
        Maturity_amt
FROM
`kylash-edw`.`raw_layer`.`investments_fd`
where current_date() <= end_date
order by 1;

