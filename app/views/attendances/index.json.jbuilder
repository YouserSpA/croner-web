json.array!(@attendances) do |attendance|
  json.extract! attendance, :id, :event, :location, :marked_at, :employee_id
  json.url attendance_url(attendance, format: :json)
end
