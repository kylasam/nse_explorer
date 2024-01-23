

  create or replace view `kylash-edw`.`reporting_layer`.`rpt_investments_bonds`
  OPTIONS()
  as select 
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
`kylash-edw`.`raw_layer`.`investments_bonds`
where current_date() <= end_date
order by 1;

