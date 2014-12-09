class SummaryAttendancesController < ApplicationController
  before_action :set_summary_attendance, only: [:show, :edit, :update, :destroy]

  def generate_summaries
    # Borrando summary_attendances anteriores.
    @customer.employees.each do |employee|
      employee.summary_attendances.each do |sa|
        sa.destroy
      end
    end

    ## Teniendo en cuenta que en la logica de la aplicación móvil, se marcan eventos alternanados; 
    # Es decir, primero un ingreso y luego un egreso, se procede a generar los resumenes para cada jornada de trabajo.
    @customer.employees.each do |employee|
      employee.attendances.order(marked_at: :asc).each do |att|
        if att.event == "Ingreso"
          @check_in = Time.new
          @check_in = att.marked_at 

          # puts "Employee: "+employee.names
          # puts "Check_in class: "+@check_in.class.name
          # puts "Check_in: "+@check_in.to_s
        
        elsif att.event == "Egreso"
          @check_out = Time.new
          @check_out = att.marked_at
        
          # puts "Employee: "+employee.names
          # puts "Check_out class: "+@check_out.class.name
          # puts "Check_out: "+@check_out.to_s
        
          worked_hours = Time.new
          worked_hours = Time.diff(@check_out, @check_in)
          # weekly_hours es string. Generalmente ingresado como entero.
          contracted_hours = employee.weekly_hours
          # Faltan cálculos...  :(

          # Se establecen algunos parámetros.
          summary_attendance = @customer.summary_attendances.new
          summary_attendance.customer = @customer
          summary_attendance.attendace_date = @check_in
          summary_attendance.check_in_at = @check_in
          summary_attendance.check_out_at = @check_out
          summary_attendance.contracted_hours = employee.weekly_hours
          summary_attendance.worked_hours = worked_hours[:day].to_s + ' - ' + worked_hours[:hour].to_s + ':' + worked_hours[:minute].to_s + ':' + worked_hours[:second].to_s 
          summary_attendance.employee = employee
          # Se persiste el resumen asistencial.
          summary_attendance.save

        end
          
      end
    end

    # Finaliza proceso de generación
    redirect_to summary_attendances_path, notice: 'Resúmenes de asistencia generados exitosamente.'
  end

  def export_summaries

    Spreadsheet.client_encoding = 'UTF-8'
    
    @book = Spreadsheet::Workbook.new
    
    @num = @customer.employees.size
    @count = 0
    @sheets = Array.new(@num)
    @customer.employees.each do |employee|

      @sheets[@count] = @book.create_worksheet

      @sheets[@count].name = employee.run.to_s
      puts @sheets[@count].name

      @sheets[@count].row(0).concat ["HOJA DE ASISTENCIA"]
      @sheets[@count].row(2).concat ["DATOS EMPLEADO"]
      @sheets[@count].row(3).concat ["Nombres:", employee.names]
      @sheets[@count].row(4).concat ["Apellidos:", employee.lastnames]
      @sheets[@count].row(5).concat ["RUN:", employee.run]
      @sheets[@count].row(6).concat ["Email:", employee.email]
      @sheets[@count].row(7).concat ["Dirección:", employee.addres]

      @sheets[@count].row(9).concat ["RESUMEN DE ASISTENCIA"]
      @sheets[@count].row(10).concat %w{Fecha Hora_ingreso Hora_egreso Horas_trabajadas Horas_contratadas Diferencia Retraso Permiso}

      @cantAtt = 11
      employee.summary_attendances.each do |sa|
        @sheets[@count].row(@cantAtt).concat [sa.attendace_date, 
                                              sa.check_in_at.strftime("%H:%M:%S"), 
                                              sa.check_out_at.strftime("%H:%M:%S"),
                                              sa.worked_hours,
                                              sa.contracted_hours,
                                              sa.difference,
                                              sa.delay,
                                              sa.permission,
                                              sa.medical_licence]
        @cantAtt = @cantAtt + 1
      end

      bold = Spreadsheet::Format.new :weight => :bold
      6.times do |x| 
        @sheets[@count].row(x+2).set_format(0, bold) 
      end
      9.times do |x|
        @sheets[@count].row(0).set_format(x, bold) 
        @sheets[@count].row(9).set_format(x, bold)
        @sheets[@count].row(10).set_format(x, bold)
      end

      @count=@count+1
    end

    # @book.write 'excel-file.xls'
    date = Time.zone.now
    spreadsheet = StringIO.new 
    @book.write spreadsheet 
    send_data spreadsheet.string, :filename => "resumen-asistencia_"+@customer.name+"_"+date.strftime("%Y-%m-%d_%H-%M-%S")+".xls", :type =>  "application/vnd.ms-excel"

    # Finaliza proceso de exprtación
    # redirect_to summary_attendances_url, notice: 'Resúmenes de asistencia exportados exitosamente.'
  end

  # GET /summary_attendances
  def index
    @summary_attendances = SummaryAttendance.all
  end

  # GET /summary_attendances/1
  def show
  end

  # GET /summary_attendances/new
  def new
    @summary_attendance = SummaryAttendance.new
  end

  # GET /summary_attendances/1/edit
  def edit
  end

  # POST /summary_attendances
  def create
    @summary_attendance = SummaryAttendance.new(summary_attendance_params)

    if @summary_attendance.save
      redirect_to @summary_attendance, notice: 'Summary attendance was successfully created.'
    else
      render :new
    end
  end

  # PATCH/PUT /summary_attendances/1
  def update
    if @summary_attendance.update(summary_attendance_params)
      redirect_to @summary_attendance, notice: 'Summary attendance was successfully updated.'
    else
      render :edit
    end
  end

  # DELETE /summary_attendances/1
  def destroy
    @summary_attendance.destroy
    redirect_to summary_attendances_url, notice: 'Summary attendance was successfully destroyed.'
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_summary_attendance
      @summary_attendance = SummaryAttendance.find(params[:id])
    end

    # Only allow a trusted parameter "white list" through.
    def summary_attendance_params
      params.require(:summary_attendance).permit(:attendace_date, :check_in_at, :check_out_at, :worked_hours, :contracted_hours, :difference, :delay, :permission, :medical_licence, :employee_id, :branch_office_id)
    end
end
