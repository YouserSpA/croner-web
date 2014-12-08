class DevicesController < ApplicationController
  before_action :set_device, only: [:show, :edit, :update, :destroy]

  # GET /devices
  def index
    @employee = Employee.find(params[:employee_id])
    @devices = Device.all
  end

  # GET /devices/1
  def show
    @employee = Employee.find(params[:employee_id])
  end

  # GET /devices/new
  def new
    @employee = Employee.find(params[:employee_id])
    @device = Device.new
  end

  # GET /devices/1/edit
  def edit
    @employee = Employee.find(params[:employee_id])
  end

  # POST /devices
  def create
    @employee = Employee.find(params[:employee_id])
    @device = @employee.devices.new(device_params)

    if @device.save
      redirect_to @employee, notice: 'Dispositivo registrado exitosamente.'
    else
      render :new
    end
  end

  # PATCH/PUT /devices/1
  def update
    if @device.update(device_params)
      redirect_to [@employee, @employee.devices.build], notice: 'Device was successfully updated.'
    else
      render :edit
    end
  end

  # DELETE /devices/1
  def destroy
    @employee = Employee.find(params[:employee_id])
    @device = @employee.devices.find(params[:id])
    @device.destroy
    redirect_to @employee, notice: 'Device was successfully destroyed.'
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_device
      @device = Device.find(params[:id])
    end

    # Only allow a trusted parameter "white list" through.
    def device_params
      params.require(:device).permit(:meid, :esn, :imei, :wlanMacAddress, :employee_id)
    end
end
