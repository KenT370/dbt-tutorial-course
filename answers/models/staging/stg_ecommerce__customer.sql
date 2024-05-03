{{
	config(
		materialized='incremental',
		unique_key='event_id',
		on_schema_change='sync_all_columns',
		partition_by={
			"field": "C_BIRTH_YEAR",
			"data_type": "number"
		}
	)
}}

WITH source AS (
	SELECT *
	FROM {{ source('snowflake_sample_data', 'CUSTOMER') }}
)

SELECT
*
FROM source


-- {# Only runs this filter on an incremental run #}
-- {% if is_incremental() %}

-- {# The {{ this }} macro is essentially a {{ ref('') }} macro that allows for a circular reference #}
-- WHERE created_at > (SELECT MAX(created_at) FROM {{ this }})

-- {% endif %}
