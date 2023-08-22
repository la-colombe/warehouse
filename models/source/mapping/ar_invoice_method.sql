select

	udf_invoice_method_code as invoice_method_code,
	udf_invoice_method as invoice_method

from {{source('sage','ar_udt_invoice_method')}}