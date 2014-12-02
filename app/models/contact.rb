class Contact < ActiveRecord::Base
	include Filterable
	include Importable
	include Exportable

		
	# Validations
			# validates :run, <validations>
			# validates :names, <validations>
			# validates :lastnames, <validations>
			# validates :email, <validations>
			# validates :birthdate, <validations>
	
	# Scopes (used for search form)
	#   To search by full text use { where("attribute like ?", "%#{attribute}%") }
	#   To search by string use { where attribute: attribute }
		scope :run, -> (run) { where run: run }
		scope :names, -> (names) { where names: names }
		scope :lastnames, -> (lastnames) { where lastnames: lastnames }
		scope :email, -> (email) { where email: email }
		scope :birthdate, -> (birthdate) { where birthdate: birthdate }
	
end
