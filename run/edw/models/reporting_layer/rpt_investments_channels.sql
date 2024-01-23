

  create or replace view `kylash-edw`.`reporting_layer`.`rpt_investments_channels`
  OPTIONS()
  as select 
investment_code, 
description, 
is_active
from `kylash-edw`.`dbt_kna`.`investment_channels_codes` chnl_codes
where is_active
order by 1;

