

  create or replace view `kylash-edw`.`reporting_layer`.`rpt_5paisa_equity_holdings`
  OPTIONS()
  as WITH _unique_records as
(
    select DISTINCT
              fullname,
              quantity,
              symbol,
              date(edw_publn_id) as edw_publn_id
        FROM 
            `kylash-edw`.`staging_layer`.`stg_equity_holdings`
)



select 
        *
        FROM _unique_records order by edw_publn_id desc;

