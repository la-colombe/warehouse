select 
  md5('lct' || invoiceno || headerseqno) as unique_invoice_id,
  'lct' as source_mas_instance,
  transactiondate as transaction_date, 
  coalesce(customer_code, customerno) as customer_code,
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

from saleslogix.lct_ar_invoicehistoryheader i
left join google_sheets.lct_customer_mapping cm on cm.old_customer_code = i.customerno
where transactiondate < '2014-11-01'

union

select 
  md5('lcg' || invoiceno || headerseqno) as unique_invoice_id,
  'lcg' as source_mas_instance,
  transactiondate as transaction_date, 
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

from saleslogix.lcg_ar_invoicehistoryheader i
where transactiondate >= '2014-11-01' and transactiondate < '2015-05-01'

union

select 
  md5('lch' || invoiceno || headerseqno) as unique_invoice_id,
  'lch' as source_mas_instance,
  transactiondate as transaction_date, 
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

from saleslogix.ar_invoicehistoryheader i
where transactiondate >= '2015-05-01'
and comment != 'LCT AR Import'
