{{
    config(
        materialized='incremental',
        unique_key='ORDER_ID',
        incremental_strategy='merge'
    )
}}




{% if is_incremental() %}

WHERE UPDATED_AT >
(
    SELECT MAX(UPDATED_AT)
    FROM {{ this }}
)

{% endif %}