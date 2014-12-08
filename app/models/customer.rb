class Customer < ActiveRecord::Base
	include Filterable
	include Importable
	include Exportable

	has_many :employees
	has_many :branch_offices
		
	# Validations
			validates :name, presence: true
			# validates :clientType, <validations>
			# validates :status, <validations>
			validates :rut, presence: true
			# validates :email, <validations>
	
	# Scopes (used for search form)
	#   To search by full text use { where("attribute like ?", "%#{attribute}%") }
	#   To search by string use { where attribute: attribute }
		scope :byname, -> (name) { where("name like ?", "%#{name}%") }
		scope :clientType, -> (clientType) { where clientType: clientType }
		scope :status, -> (status) { where status: status }
		scope :rut, -> (rut) { where rut: rut }
		scope :email, -> (email) { where email: email }
	
end
