select

    documentkey as pdf_id,
    customerno as customer_code,
    invoiceno as invoice_number,
    sent = 'Y' as pdf_sent,
    datecreated as pdf_created_at

from dbo.AR_CustomerPDFLog
where invoiceno is not null and invoiceno != '' and sequence::int = 0