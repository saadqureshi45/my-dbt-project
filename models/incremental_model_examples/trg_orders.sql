{{
    config(
        materialized='incremental',
     
    )
}}



SELECT *
FROM DBT_DB.PROD.ORDERS

