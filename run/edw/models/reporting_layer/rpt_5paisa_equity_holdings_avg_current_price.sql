

  create or replace view `kylash-edw`.`reporting_layer`.`rpt_5paisa_equity_holdings_avg_current_price`
  OPTIONS()
  as WITH _unique_records as
(
    select
              symbol,
              fullname,
              avgrate,
              currentprice,
              edw_publn_id
        FROM 
            `kylash-edw`.`staging_layer`.`stg_equity_holdings`
            where row_num=1
)



select 
        *
        FROM _unique_records order by edw_publn_id desc;

