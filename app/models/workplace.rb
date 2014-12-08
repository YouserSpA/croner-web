class Workplace < ActiveRecord::Base
	include Filterable
	include Importable
	include Exportable

	belongs_to :employee
	belongs_to :branch_office
		
	# Validations
	
	# Scopes (used for search form)
	#   To search by full text use { where("attribute like ?", "%#{attribute}%") }
	#   To search by string use { where attribute: attribute }
	scope :working_since, -> (working_since) { where working_since: working_since }
end
