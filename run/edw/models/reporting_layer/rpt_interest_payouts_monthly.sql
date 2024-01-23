

  create or replace view `kylash-edw`.`reporting_layer`.`rpt_interest_payouts_monthly`
  OPTIONS()
  as select 
        Date as interest_payput_dt,
        issurer,
        sum(total_amount) as amount
FROM
`kylash-edw`.`raw_layer`.`interest_payouts_monthly`
group by 1,2 
order by 1;

