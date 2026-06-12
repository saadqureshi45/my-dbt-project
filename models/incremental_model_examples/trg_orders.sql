{{
    config(
        materialized='incremental',
        unique_key='ORDER_ID',
        incremental_strategy='merge'
    )
}}


Merge into 
SELECT *
FROM DBT_DB.PROD.ORDERS

{% if is_incremental() %}

WHERE UPDATED_AT >
(
    SELECT MAX(UPDATED_AT)
    FROM {{ this }}
)

{% endif %}