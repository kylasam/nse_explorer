SELECT
    start_dt,
    premium_amount,
    insurer_type,
    end_dt
FROM (
    SELECT 
        MIN(month_start_date) AS start_dt,
        SUM(amount) AS premium_amount,
        'edelweisstokio' AS insurer_type,
        MAX(month_start_date) AS end_dt
    FROM
        {{ ref("stg_investments_edelweisstokio") }}
    WHERE amount > 0
    GROUP BY insurer_type

    UNION ALL

    SELECT 
        MIN(month_start_date) AS start_dt,
        SUM(amount) AS premium_amount,
        'lic' AS insurer_type,
        MAX(month_start_date) AS end_dt
    FROM
        {{ ref("stg_investments_lic") }}
    WHERE amount > 0
    GROUP BY insurer_type

    UNION ALL

    SELECT 
        MIN(month_start_date) AS start_dt,
        SUM(amount) AS premium_amount,
        'aviva' AS insurer_type,
        MAX(month_start_date) AS end_dt
    FROM
        {{ ref("stg_investments_aviva") }}
    WHERE amount > 0
    GROUP BY insurer_type

    UNION ALL

    SELECT 
        MIN(month_start_date) AS start_dt,
        SUM(amount) AS premium_amount,
        'pnbmetlife' AS insurer_type,
        MAX(month_start_date) AS end_dt
    FROM
        {{ ref("stg_investments_pnbmetlife") }}
    WHERE amount > 0
    GROUP BY insurer_type
) AS combined_results;  -- Added an alias for the inner query
