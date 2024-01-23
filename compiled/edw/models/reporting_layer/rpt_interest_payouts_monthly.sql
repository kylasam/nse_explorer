select 
        Date as interest_payput_dt,
        issurer,
        sum(total_amount) as amount
FROM
`kylash-edw`.`raw_layer`.`interest_payouts_monthly`
group by 1,2 
order by 1