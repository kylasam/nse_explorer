

  create or replace view `kylash-edw`.`reporting_layer`.`rpt_investments_gold`
  OPTIONS()
  as select 
        investment_code,				
        investment_type,				
        shop_name,				
        total_investment,				
        deposit_period_days,				
        start_date,				
        end_date,				
        total_gms	
FROM
`kylash-edw`.`raw_layer`.`investments_gold`

order by 1;

