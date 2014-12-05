class CreateDevices < ActiveRecord::Migration
  def change
    create_table :devices do |t|
      t.string :meid
      t.string :esn
      t.string :imei
      t.string :wlanMacAddress
      t.references :employee, index: true, null: false

      t.timestamps
    end
  end
end
