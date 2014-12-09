class SummaryAttendance < ActiveRecord::Base
	include Filterable
	include Importable
	include Exportable

	  		belongs_to :employee
	  		belongs_to :branch_office
	  		belongs_to :customer
		
	# Validations
			# validates :attendace_date, <validations>
			# validates :check_in_at, <validations>
			# validates :check_out_at, <validations>
			# validates :worked_hours, <validations>
			# validates :contracted_hours, <validations>
			# validates :difference, <validations>
			# validates :delay, <validations>
			# validates :permission, <validations>
			# validates :medical_licence, <validations>
			# validates :employee, <validations>
			# validates :branch_office, <validations>
	
	# Scopes (used for search form)
	#   To search by full text use { where("attribute like ?", "%#{attribute}%") }
	#   To search by string use { where attribute: attribute }
		scope :attendace_date, -> (attendace_date) { where attendace_date: attendace_date }
		scope :check_in_at, -> (check_in_at) { where check_in_at: check_in_at }
		scope :check_out_at, -> (check_out_at) { where check_out_at: check_out_at }
		scope :worked_hours, -> (worked_hours) { where worked_hours: worked_hours }
		scope :contracted_hours, -> (contracted_hours) { where contracted_hours: contracted_hours }
		scope :difference, -> (difference) { where difference: difference }
		scope :delay, -> (delay) { where delay: delay }
		scope :permission, -> (permission) { where permission: permission }
		scope :medical_licence, -> (medical_licence) { where medical_licence: medical_licence }
		scope :employee, -> (employee_name) { where("employee.name like ?", "%#{employee_name}%") }
		scope :branch_office, -> (branch_office_name) { where("branch_office.name like ?", "%#{branch_office_name}%") }
	
end
