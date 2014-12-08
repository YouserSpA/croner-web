class EmployeesController < ApplicationController
  before_action :set_employee, only: [:show, :edit, :update, :destroy]

  # GET /employees
  def index
    # @employees = Employee.all
  end

  # GET /employees/1
  def show
  end

  # GET /employees/new
  def new
    @employee = Employee.new
  end

  # GET /employees/1/edit
  def edit
  end

  # POST /employees
  def create
    # @branch_office = @customer.branch_offices.find(params[:branch_office_id])
    
    @employee = @customer.employees.new(employee_params)

    # @workerplace = Workplace.new
    # @workerplace.employee = @employee
    # @workerplace.branch_office = @branch_office

     if @employee.save # and @workerplace.save
      redirect_to @employee, notice: 'Empleado registrado satisfactoriamente.'
    else
      render :new, notice: 'No se pudo registrar el empleado.'
    end
  end

  # PATCH/PUT /employees/1
  def update
    if @employee.update(employee_params)
      redirect_to @employee, notice: 'Employee was successfully updated.'
    else
      render :edit
    end
  end

  # DELETE /employees/1
  def destroy
    @employee = @customer.employees.find(params[:id])
    @employee.destroy
    redirect_to employees_url, notice: 'Employee was successfully destroyed.'
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_employee
      @employee = Employee.find(params[:id])
    end

    # Only allow a trusted parameter "white list" through.
    def employee_params
      params.require(:employee).permit(:worker_id, :run, :names, :lastnames, :email, :addres, :birthdate, :contract_type, :weekly_hours, :avatar, :branch_office_id)
    end
end
