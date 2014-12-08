class AttendancesController < ApplicationController
  before_action :set_attendance, only: [:show, :edit, :update, :destroy]

  # GET /attendances
  def index
    @attendances = Attendance.all
    @employee = Employee.find(params[:employee_id])
  end

  # GET /attendances/1
  def show
    @employee = Employee.find(params[:employee_id])
  end

  # GET /attendances/new
  def new
    @attendance = Attendance.new
    @employee = Employee.find(params[:employee_id])
  end

  # GET /attendances/1/edit
  def edit
    @employee = Employee.find(params[:employee_id])
    @attendance = @employee.attendances.find(params[:id])
  end

  # POST /attendances
  def create
    @employee = Employee.find(params[:employee_id])
    @attendance = @employee.attendances.new(attendance_params)

    if @attendance.save
      redirect_to [@employee, @employee.attendances.build], notice: 'Attendance was successfully created.'
    else
      render :new
    end
  end

  # PATCH/PUT /attendances/1
  def update
    @employee = Employee.find(params[:employee_id])
    @attendance = @employee.attendances.find(params[:id])

    if @@employee.attendances.find(params[:id]).update(attendance_params)
      redirect_to @employee, notice: 'Attendance was successfully updated.'
    else
      render :edit
    end
  end

  # DELETE /attendances/1
  def destroy
    @employee = Employee.find(params[:employee_id])
    @attendance = @employee.attendances.find(params[:id])

    @attendance.destroy
    redirect_to attendances_url, notice: 'Attendance was successfully destroyed.'
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_attendance
      @attendance = Attendance.find(params[:id])
    end

    # Only allow a trusted parameter "white list" through.
    def attendance_params
      params.require(:attendance).permit(:event, :latitude, :longitude, :marked_at)
    end
end
