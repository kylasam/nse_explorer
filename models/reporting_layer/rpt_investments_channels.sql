select 
investment_code, 
description, 
is_active
from {{ ref("investment_channels_codes") }} chnl_codes
where is_active
order by 1
