class CreateBranchOffices < ActiveRecord::Migration
  def change
    create_table :branch_offices do |t|
      t.string :name
      t.string :country
      t.string :region
      t.string :address
      t.references :customer, index: true, null:false

      t.timestamps
    end
  end
end
