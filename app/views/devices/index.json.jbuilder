json.array!(@devices) do |device|
  json.extract! device, :id, :hostname, :domain, :os
  json.url device_url(device, format: :json)
end
