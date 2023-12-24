WITH _unique_records as
(
    select
              symbol,
              fullname,
              avgrate,
              currentprice,
              edw_publn_id
        FROM 
            {{ ref('stg_equity_holdings') }}
            where row_num=1
)



select 
        *
        FROM _unique_records order by edw_publn_id desc