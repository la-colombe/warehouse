select

    pdf_id,
    customer_code,
    invoice_number,
    pdf_sent,
    pdf_created_at

from {{ref('ar_customer_pdf')}}