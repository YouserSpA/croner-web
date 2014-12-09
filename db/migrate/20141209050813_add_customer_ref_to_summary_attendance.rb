class AddCustomerRefToSummaryAttendance < ActiveRecord::Migration
  def change
    add_reference :summary_attendances, :customer, index: true
  end
end
