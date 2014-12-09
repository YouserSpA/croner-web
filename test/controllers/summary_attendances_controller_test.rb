require 'test_helper'

class SummaryAttendancesControllerTest < ActionController::TestCase
  setup do
    @summary_attendance = summary_attendances(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:summary_attendances)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create summary_attendance" do
    assert_difference('SummaryAttendance.count') do
      post :create, summary_attendance: { attendace_date: @summary_attendance.attendace_date, branch_office_id: @summary_attendance.branch_office_id, check_in_at: @summary_attendance.check_in_at, check_out_at: @summary_attendance.check_out_at, contracted_hours: @summary_attendance.contracted_hours, delay: @summary_attendance.delay, difference: @summary_attendance.difference, employee_id: @summary_attendance.employee_id, medical_licence: @summary_attendance.medical_licence, permission: @summary_attendance.permission, worked_hours: @summary_attendance.worked_hours }
    end

    assert_redirected_to summary_attendance_path(assigns(:summary_attendance))
  end

  test "should show summary_attendance" do
    get :show, id: @summary_attendance
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @summary_attendance
    assert_response :success
  end

  test "should update summary_attendance" do
    patch :update, id: @summary_attendance, summary_attendance: { attendace_date: @summary_attendance.attendace_date, branch_office_id: @summary_attendance.branch_office_id, check_in_at: @summary_attendance.check_in_at, check_out_at: @summary_attendance.check_out_at, contracted_hours: @summary_attendance.contracted_hours, delay: @summary_attendance.delay, difference: @summary_attendance.difference, employee_id: @summary_attendance.employee_id, medical_licence: @summary_attendance.medical_licence, permission: @summary_attendance.permission, worked_hours: @summary_attendance.worked_hours }
    assert_redirected_to summary_attendance_path(assigns(:summary_attendance))
  end

  test "should destroy summary_attendance" do
    assert_difference('SummaryAttendance.count', -1) do
      delete :destroy, id: @summary_attendance
    end

    assert_redirected_to summary_attendances_path
  end
end
