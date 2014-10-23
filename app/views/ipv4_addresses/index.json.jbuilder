json.array!(@ipv4_addresses) do |ipv4_address|
  json.extract! ipv4_address, :id, :ipv4_address, :mac_address, :ptr_record
  json.url ipv4_address_url(ipv4_address, format: :json)
end
