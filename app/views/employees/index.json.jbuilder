json.array!(@employees) do |employee|
  json.extract! employee, :id, :worker_id, :contract_type, :weekly_hours, :run, :names, :lastnames, :email, :addres, :birthdate
  json.url employee_url(employee, format: :json)
end
