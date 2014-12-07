class CreateAttendances < ActiveRecord::Migration
  def change
    create_table :attendances do |t|
      t.string :event
      t.string :location
      t.timestamp :marked_at
      t.references :employee, index: true, null: false

      t.timestamps
    end
  end
end
