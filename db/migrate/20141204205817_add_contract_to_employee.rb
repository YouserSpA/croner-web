class AddContractToEmployee < ActiveRecord::Migration
  def change
  	add_column :employees, :weekly_hours, :integer
  	add_column :employees, :contract_type, :text
  end
end
