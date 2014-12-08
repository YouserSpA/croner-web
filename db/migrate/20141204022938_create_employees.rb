class CreateEmployees < ActiveRecord::Migration
  def change
    create_table :employees do |t|
      t.string :worker_id
      t.string :run
      t.string :names
      t.string :lastnames
      t.string :email
      t.string :addres
      t.date :birthdate

      t.timestamps
    end
  end
end
