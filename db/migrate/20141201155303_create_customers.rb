class CreateCustomers < ActiveRecord::Migration
  def change
    create_table :customers do |t|
      t.string :name
      t.string :clientType
      t.integer :status
      t.string :rut
      t.string :email

      t.timestamps
    end
  end
end
