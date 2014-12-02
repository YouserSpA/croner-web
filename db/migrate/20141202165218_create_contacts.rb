class CreateContacts < ActiveRecord::Migration
  def change
    create_table :contacts do |t|
      t.string :run
      t.string :names
      t.string :lastnames
      t.string :email
      t.date :birthdate

      t.timestamps
    end
  end
end
