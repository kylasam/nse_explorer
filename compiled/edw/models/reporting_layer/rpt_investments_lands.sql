select 
        investment_code,
        property_type,
        area_in_cents,
        district,
        town,
        latitude,
        longitude
FROM
`kylash-edw`.`dbt_kna`.`investment_lands`
order by 1