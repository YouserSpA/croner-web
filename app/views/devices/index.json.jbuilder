json.array!(@devices) do |device|
  json.extract! device, :id, :meid, :esn, :imei, :wlanMacAddress, :employee_id
  json.url device_url(device, format: :json)
end
