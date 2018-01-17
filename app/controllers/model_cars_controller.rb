class ModelCarsController < ApplicationController
  before_action :authenticate_user!
  before_action :set_model_car, only: [:show, :edit, :update, :destroy]

  # GET /model_cars
  # GET /model_cars.json
  def index
    @model_cars = ModelCar.all
  end

  # GET /model_cars/1
  # GET /model_cars/1.json
  def show
  end

  # GET /model_cars/new
  def new
    @model_car = ModelCar.new
  end

  # GET /model_cars/1/edit
  def edit
  end

  # POST /model_cars
  # POST /model_cars.json
  def create
    @model_car = ModelCar.new(model_car_params)

    respond_to do |format|
      if @model_car.save
        format.html { redirect_to @model_car, notice: 'Model car was successfully created.' }
        format.json { render :show, status: :created, location: @model_car }
      else
        format.html { render :new }
        format.json { render json: @model_car.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /model_cars/1
  # PATCH/PUT /model_cars/1.json
  def update
    respond_to do |format|
      if @model_car.update(model_car_params)
        format.html { redirect_to @model_car, notice: 'Model car was successfully updated.' }
        format.json { render :show, status: :ok, location: @model_car }
      else
        format.html { render :edit }
        format.json { render json: @model_car.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /model_cars/1
  # DELETE /model_cars/1.json
  def destroy
    @model_car.destroy
    respond_to do |format|
      format.html { redirect_to model_cars_url, notice: 'Model car was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_model_car
      @model_car = ModelCar.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def model_car_params
      params.require(:model_car).permit(:modelo_desc, :photo)
    end
end
