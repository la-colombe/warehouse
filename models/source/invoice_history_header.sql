SELECT

  invoicedate as transaction_date, 
  customerno as customer_code,
  billtoname as bill_to_name,
  invoiceno as invoice_number,
  headerseqno as header_number,
  invoicetype as invoice_type,
  invoiceno || '-' || invoicetype as invoice,
  shiptoname as ship_to_name,
  shiptoaddress1 as ship_to_address1,
  shiptoaddress2 as ship_to_address2,
  shiptoaddress3 as ship_to_address3,
  shiptocity as ship_to_city,
  shiptostate as ship_to_state,
  shiptozipcode as ship_to_zip,
  shiptocountrycode as ship_to_country,
  salestaxamt as sales_tax,
  freightamt as freight,
  comment

FROM saleslogix.AR_InvoiceHistoryHeader h