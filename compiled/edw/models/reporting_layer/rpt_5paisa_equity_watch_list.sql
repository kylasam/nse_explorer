WITH _unique_records as
(
    select
              AverageTradePrice,
              Close,
              High,
              Low,
              NetChange,
              _cd.Name as Name,
              edw_publn_id
        FROM 
            `kylash-edw`.`raw_layer`.`equity_marketdepth_5paisa` _raw
            JOIN `kylash-edw`.`dbt_kna`.`equity_5paisa_script_codes`_cd
            ON _cd.Scripcode = _raw.Scripcode
)



select 
        *
        FROM _unique_records order by edw_publn_id desc