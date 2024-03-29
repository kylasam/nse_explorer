WITH _unique_records as
(
    select
        DISTINCT
              AvailableMargin,
              Mgn4Position,
              max(edw_publn_id) as edw_publn_id
        FROM 
            {{ source('MONTHLY_EXPENSES_SOURCE', 'equity_wallet_balance_5paisa') }}
            group by 1,2
)



select 
        u.AvailableMargin as AvailableMargin,
        abs(u.Mgn4Position) as Mgn4Position,
        u.edw_publn_id as edw_publn_id
FROM
_unique_records u
JOIN
   {{ source('MONTHLY_EXPENSES_SOURCE', 'equity_wallet_balance_5paisa') }} _raw_tbl
   ON u.edw_publn_id = _raw_tbl.edw_publn_id
order by 1
