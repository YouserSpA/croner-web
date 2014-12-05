class Device < ActiveRecord::Base
	include Filterable
	include Importable
	include Exportable

	  		belongs_to :employee
		
	# Validations
			# validates :meid, <validations>
			# validates :esn, <validations>
			# validates :imei, <validations>
			# validates :wlanMacAddress, <validations>
			# validates :employee, <validations>
	
	# Scopes (used for search form)
	#   To search by full text use { where("attribute like ?", "%#{attribute}%") }
	#   To search by string use { where attribute: attribute }
		scope :meid, -> (meid) { where meid: meid }
		scope :esn, -> (esn) { where esn: esn }
		scope :imei, -> (imei) { where imei: imei }
		scope :wlanMacAddress, -> (wlanMacAddress) { where wlanMacAddress: wlanMacAddress }
		scope :employee, -> (employee_name) { where("employee.name like ?", "%#{employee_name}%") }
	
end
