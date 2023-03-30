select

	id,
	full_account_number,
	create_date,
	full_account_name,
	account_type_desc,
	account_group_desc,
	account_category_desc,
	main_account_code,
	account_group_code,
	account_category_code,
	account_type_code

from {{ref('gl_account')}}