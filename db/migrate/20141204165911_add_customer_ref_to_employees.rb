class AddCustomerRefToEmployees < ActiveRecord::Migration
  def change
  	add_reference :employees, :customer, index: true, null: false
  end
end
