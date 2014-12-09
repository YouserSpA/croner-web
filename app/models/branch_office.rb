class BranchOffice < ActiveRecord::Base
	include Filterable
	include Importable
	include Exportable

	belongs_to :customer
	has_many :workplaces
	has_many :employees, :through => :workplaces
	has_many :summary_attendances
		
	# Validations
			# validates :name, <validations>
			# validates :country, <validations>
			# validates :region, <validations>
			# validates :address, <validations>
			# validates :customer, <validations>
	
	# Scopes (used for search form)
	#   To search by full text use { where("attribute like ?", "%#{attribute}%") }
	#   To search by string use { where attribute: attribute }
		scope :byname, -> (name) { where("name like ?", "%#{name}%") }
		scope :country, -> (country) { where country: country }
		scope :region, -> (region) { where region: region }
		scope :address, -> (address) { where address: address }
		scope :customer, -> (customer_name) { where("customer.name like ?", "%#{customer_name}%") }
	
end
