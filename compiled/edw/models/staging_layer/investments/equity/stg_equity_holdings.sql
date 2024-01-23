

with deduplicated_raw_data as (
  select
    row_number() over (partition by  CAST(avgrate AS STRING),CAST(currentprice AS STRING),
        bsecode,
        dpqty,
        exch,
        exchtype,
        fullname,
        nsecode,
        poasigned,
        poolqty,
        quantity,
        scripmultiplier,
        symbol
        order by edw_publn_id desc) as row_num,
        *
  from `kylash-edw`.`raw_layer`.`equity_holdings_5paisa`
)

select * from deduplicated_raw_data  order by edw_publn_id desc