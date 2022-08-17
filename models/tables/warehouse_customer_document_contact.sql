select

  customer_code,
  document,
  email,
  created_date

from {{ref('ar_customer_document_contact')}}