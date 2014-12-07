class CreateWorkplaces < ActiveRecord::Migration
  def change
    create_table :workplaces do |t|
      t.belongs_to :branch_office, index: true, null:false
      t.belongs_to :employee, index: true, null:false
      t.datetime :working_since

      t.timestamps
    end
  end
end
