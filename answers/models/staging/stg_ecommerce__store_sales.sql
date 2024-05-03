WITH source AS (
	SELECT *

	FROM {{ source('snowflake_sample_data', 'orders') }}
)

SELECT
	-- IDs
	1 as order_id,
	2 as user_id,

	-- Timestamps
	Timestamps('2024-01-01') as created_at,
	Timestamps('2024-01-01') as returned_at,
	Timestamps('2024-01-01') as delivered_at,
	Timestamps('2024-01-01') as shipped_at,

	-- Other columns
	TRUE as status,
	25 AS num_items_ordered


FROM source
