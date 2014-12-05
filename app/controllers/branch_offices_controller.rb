class BranchOfficesController < ApplicationController
  before_action :set_branch_office, only: [:show, :edit, :update, :destroy]

  # GET /branch_offices
  def index
    @branch_offices = BranchOffice.all
  end

  # GET /branch_offices/1
  def show
  end

  # GET /branch_offices/new
  def new
    @branch_office = BranchOffice.new
  end

  # GET /branch_offices/1/edit
  def edit
  end

  # POST /branch_offices
  def create
    @branch_office = @customer.branch_offices.new(branch_office_params)

    if @branch_office.save
      redirect_to @branch_office, notice: 'Branch office was successfully created.'
    else
      render :new
    end
  end

  # PATCH/PUT /branch_offices/1
  def update
    if @branch_office.update(branch_office_params)
      redirect_to @branch_office, notice: 'Branch office was successfully updated.'
    else
      render :edit
    end
  end

  # DELETE /branch_offices/1
  def destroy
    @branch_office = @customer.branch_offices.find(params[:id])
    @branch_office.destroy
    redirect_to branch_offices_url, notice: 'Branch office was successfully destroyed.'
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_branch_office
      @branch_office = BranchOffice.find(params[:id])
    end

    # Only allow a trusted parameter "white list" through.
    def branch_office_params
      params.require(:branch_office).permit(:name, :country, :region, :address, :customer_id)
    end
end
