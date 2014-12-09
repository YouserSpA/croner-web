class CreateSummaryAttendances < ActiveRecord::Migration
  def change
    create_table :summary_attendances do |t|
      t.date :attendace_date, index: true
      t.datetime :check_in_at
      t.datetime :check_out_at
      t.string :worked_hours
      t.string :contracted_hours
      t.string :difference
      t.string :delay
      t.boolean :permission
      t.text :medical_licence
      t.references :employee, index: true
      t.references :branch_office, index: true

      t.timestamps
    end
    add_index :summary_attendances, :attendace_date
  end
end
