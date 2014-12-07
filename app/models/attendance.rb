class Attendance < ActiveRecord::Base
	include Filterable
	include Importable
	include Exportable

	belongs_to :employee
		
	# Validations
			# validates :event, <validations>
			# validates :location, <validations>
			# validates :marked_at, <validations>
			# validates :employee, <validations>
	
	# Scopes (used for search form)
	#   To search by full text use { where("attribute like ?", "%#{attribute}%") }
	#   To search by string use { where attribute: attribute }
		scope :event, -> (event) { where event: event }
		scope :location, -> (location) { where location: location }
		scope :marked_at, -> (marked_at) { where marked_at: marked_at }
		scope :employee, -> (employee_name) { where("employee.name like ?", "%#{employee_name}%") }
	
end
