class VehiclesController < ApplicationController
  before_action :authenticate_user!
  before_action :set_vehicle, only: [:show, :edit, :update, :destroy]
  helper_method :sort_column, :sort_direction

  # GET /vehicles
  # GET /vehicles.json
  def index
    #@vehicles = Vehicle.all
    #@vehicles = Vehicle.order(params[:sort])
    @vehicles = Vehicle.paginate(:page => params[:page], :per_page => 10).order(sort_column + ' ' + sort_direction)
    @marks_index = Mark.all
  end

  # GET /vehicles/1
  # GET /vehicles/1.json
  def show
  end

  # GET /vehicles/new
  def new
    @vehicle = Vehicle.new
  end

  # GET /vehicles/1/edit
  def edit
  end

  # POST /vehicles
  # POST /vehicles.json
  def create
    @vehicle = Vehicle.new(vehicle_params)

    respond_to do |format|
      if @vehicle.save
        format.html { redirect_to @vehicle, notice: 'Vehicle was successfully created.' }
        format.json { render :show, status: :created, location: @vehicle }
      else
        format.html { render :new }
        format.json { render json: @vehicle.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /vehicles/1
  # PATCH/PUT /vehicles/1.json
  def update
    respond_to do |format|
      if @vehicle.update(vehicle_params)
        format.html { redirect_to @vehicle, notice: 'Vehicle was successfully updated.' }
        format.json { render :show, status: :ok, location: @vehicle }
      else
        format.html { render :edit }
        format.json { render json: @vehicle.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /vehicles/1
  # DELETE /vehicles/1.json
  def destroy
    @vehicle.destroy
    respond_to do |format|
      format.html { redirect_to vehicles_url, notice: 'Vehicle was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  ########################## MÉTODOS CRIADOS ##############################
  def mostrar
    @marks_index = Mark.all
    @vehicles = Vehicle.where("mark_id = ?",params[:mark_id])
  end

  def mostrar_modelo
    @marks_index = Mark.all
    @vehicles = Vehicle.where("model_car_id = ?",params[:model_car_id])
  end
  #########################################################################
  private
    # Use callbacks to share common setup or constraints between actions.
    def set_vehicle
      @vehicle = Vehicle.find(params[:id])
    end

    def sort_column
      Vehicle.column_names.include?(params[:sort]) ? params[:sort] : "nome"
    end
  
    def sort_direction
      %w[asc desc].include?(params[:direction]) ?  params[:direction] : "asc"
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def vehicle_params
      params.require(:vehicle).permit(
        :nome,
        :preco_loc,
        :qtd_loc,
        :status,
        :photo,
        :mark_id,
        :model_car_id,
        marks_attributes:[:mark_id, :marca_desc],
        model_cars_attributes:[:model_car_id, :modelo_desc])
    end
end
