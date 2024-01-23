with 

source as (

    select * from `kylash-edw`.`raw_layer`.`thangamayil_gold_rates`

),

renamed as (

    select distinct
        web_last_updated_ts,
        g_price_18k_gram,
        g_price_22k_gram,
        g_price_24k_gram,
        silver_price_gram,
        edw_publn_id

    from source

)

select * from renamed