json.array!(@branch_offices) do |branch_office|
  json.extract! branch_office, :id, :name, :country, :region, :address, :customer_id
  json.url branch_office_url(branch_office, format: :json)
end
