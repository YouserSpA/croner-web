json.array!(@customers) do |customer|
  json.extract! customer, :id, :name, :clientType, :status, :rut, :email
  json.url customer_url(customer, format: :json)
end
