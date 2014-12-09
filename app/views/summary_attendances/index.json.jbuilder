json.array!(@summary_attendances) do |summary_attendance|
  json.extract! summary_attendance, :id, :attendace_date, :check_in_at, :check_out_at, :worked_hours, :contracted_hours, :difference, :delay, :permission, :medical_licence, :employee_id, :branch_office_id
  json.url summary_attendance_url(summary_attendance, format: :json)
end
