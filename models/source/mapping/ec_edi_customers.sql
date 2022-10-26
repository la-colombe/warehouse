select
  ardivisionno as division,
  customerno as customer_code,
  tradpartname as edi_customer_name,
  inbound850id as inbound_850_id,
  outbound810id as outbound_810_id
from {{source('sage','ec_customertradingpartner')}}