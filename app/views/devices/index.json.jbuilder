json.array!(@devices) do |device|
  json.extract! device, :id, :hostname, :domain, :os, :ipv4_address, :creator, :owner, :updated_ad
  json.url device_url(device, format: :json)
end
