WITH _unique_records as
(
    select
              fullname,
              quantity,
              symbol,
              edw_publn_id
        FROM 
            {{ ref('stg_equity_holdings') }}
            where row_num=1
)



select 
        distinct
        fullname,
              quantity,
              symbol,
              date(edw_publn_id) as edw_publn_id
        FROM _unique_records order by edw_publn_id desc