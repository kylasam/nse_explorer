select 
        investment_code,
        property_type,
        area_in_cents,
        district,
        town,
        latitude,
        longitude,
        CONCAT(latitude, ",", longitude) as geo_loca
FROM
{{ ref("investment_lands") }}
order by 1
