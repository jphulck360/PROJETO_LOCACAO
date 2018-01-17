class LocationsController < ApplicationController
  before_action :authenticate_user!
  before_action :set_location, only: [:show, :edit, :update, :destroy]

  ################## VARIÁVEIS GLOBAIS ######################
  
  ###########################################################

  require "date"

  # GET /locations
  # GET /locations.json
  def index
    @locations = Location.all.paginate(:page => params[:page], :per_page => 20)
  end

  # GET /locations/1
  # GET /locations/1.json
  def show
  end

  # GET /locations/new
  def new
    @location = Location.new
    @marks = Mark.all
    @vehicles = Vehicle.all
    @model_cars = ModelCar.all

    # o código abaixo permite fazer a busca por 'MODELO' ou 'MARCA'
    if params[:mark_id].nil? && params[:model_car_id].nil?
      @v = @vehicles.paginate(:page => params[:page], :per_page => 4).where("mark_id = 1").where("status = 'DISPONÍVEL'")
    elsif params[:mark_id].nil?
      @v = @vehicles.paginate(:page => params[:page], :per_page => 4).where("model_car_id = #{params[:model_car_id]}").where("status = 'DISPONÍVEL'")
    else
      @v = @vehicles.paginate(:page => params[:page], :per_page => 4).where("mark_id = ?",params[:mark_id]).where("status = 'DISPONÍVEL'")
    end

    #@v = Vehicle.where("mark_id = ?",params[:mark_id]) # forma_1
    #@v = Vehicle.where("mark_id = #{params[:mark_id]}") # forma_2
    #@v = Vehicle.where("mark_id = '#{params[:mark_id]}' AND model_car_id = '#{params[:model_car_id]}' ",) # forma_3
  end

  # GET /locations/1/edit
  def edit
    @marks = Mark.all
    @vehicles = Vehicle.all
    @model_cars = ModelCar.all

    # o código abaixo permite fazer a busca por 'MODELO' ou 'MARCA'
    if params[:mark_id].nil? && params[:model_car_id].nil?
      #@v = Vehicle.where("mark_id = 1")
      @v = Vehicle.where("id = #{@location.vehicle_id}")
    elsif params[:mark_id].nil?
      @v = Vehicle.where("model_car_id = #{params[:model_car_id]}")
    else
      @v = Vehicle.where("mark_id = ?",params[:mark_id])
    end

    #@v = Vehicle.where("mark_id = ?",params[:mark_id]) # forma_1
    #@v = Vehicle.where("mark_id = #{params[:mark_id]}") # forma_2
    #@v = Vehicle.where("mark_id = '#{params[:mark_id]}' AND model_car_id = '#{params[:model_car_id]}' ",) # forma_3
  end

  # POST /locations
  # POST /locations.json
  def create
    @location = Location.new(location_params)
    @vehicle = Vehicle.find_by(id: @location.vehicle_id)
    @client = Client.find_by(id: @location.client_id)
    #@location.valor_loc = @vehicle.preco_loc

    @taxa_km = 2.4

    respond_to do |format|
      if @location.save

        if @location.tipo_loc == "LIVRE"
          valor_locacao = (@vehicle.preco_loc * params[:dia_loc].to_f)
          @location.update_attribute(:valor_loc, valor_locacao)
        elsif @location.tipo_loc == "KM"
          valor_locacao = @location.valor_loc = (@taxa_km * params[:qtd_km].to_f)
          @location.update_attribute(:valor_loc, valor_locacao)
        end

        # troca status veículo
        @vehicle.update_attribute(:status, 'INDISPONÍVEL')
        @client.update_attribute(:status, 'INDISPONÍVEL')
        # Atualiza quantidade de locações do carro
        if @vehicle.qtd_loc == 0
          @vehicle.update_attribute(:qtd_loc, 1)
        else
          qtd_nova = @vehicle.qtd_loc + 1
          @vehicle.update_attribute(:qtd_loc, qtd_nova)
        end

        format.html { redirect_to @location, notice: 'Location was successfully created.' }
        format.json { render :show, status: :created, location: @location }
      else
        format.html { render :new }
        format.json { render json: @location.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /locations/1
  # PATCH/PUT /locations/1.json
  def update
    respond_to do |format|
      if @location.update(location_params)
        if @location.dt_devolucao.nil?
        else
          @vehicle = Vehicle.find_by(id: @location.vehicle_id)
          @client = Client.find_by(id: @location.client_id)
          
          @vehicle.update_attribute(:status, 'DISPONÍVEL')
          @client.update_attribute(:status, 'DISPONÍVEL')
        end
        format.html { redirect_to @location, notice: 'Location was successfully updated.' }
        format.json { render :show, status: :ok, location: @location }
      else
        format.html { render :edit }
        format.json { render json: @location.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /locations/1
  # DELETE /locations/1.json
  def destroy
    @location.destroy
    respond_to do |format|
      format.html { redirect_to locations_url, notice: 'Location was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  ####################### INÍCIO MÉTODOS CRIADOS ###########################
  def relatorio

    t = Time.now
    dia = t.strftime("%d")
    mes = t.strftime("%m")
    ano = t.strftime("%Y")
    #Date.today.year

    if params[:dt_cadastro].nil?
      #flash[:notice] = "Não preenchido!"
      @locations = Location.all.paginate(:page => params[:page], :per_page => 30)
    elsif params[:dt_cadastro] == dia and params[:dt_mes] == mes and params[:dt_ano] == ano
      #flash[:notice] = "Mostrando o dia!"
      @locations = Location.paginate(:page => params[:page], :per_page => 20).where(
      'extract(day from dt_cadastro) = ? and extract(month from dt_cadastro) = ? and extract(Year from dt_cadastro) = ?', 
      params[:dt_cadastro],params[:dt_mes],params[:dt_ano])

    elsif params[:dt_mes] == mes and params[:dt_ano] == ano and params[:dt_cadastro] == ''
      #flash[:notice] = "Mostrando o mês"
      #@locations = Location.where('extract(month from dt_cadastro) = ?', params[:dt_cadastro])
      @locations = Location.paginate(:page => params[:page], :per_page => 20).where('extract(month from dt_cadastro) = ? and extract(Year from dt_cadastro) = ?', params[:dt_mes],params[:dt_ano])

    elsif params[:dt_mes] == '' and params[:dt_ano] == ano
      #flash[:notice] = "Mostrando o ano"
      @locations = Location.paginate(:page => params[:page], :per_page => 20).where('extract(Year from dt_cadastro) = ?', params[:dt_cadastro])
    end
  end
  ####################### FIM MÉTODOS CRIADOS    ###########################

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_location
      @location = Location.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def location_params
      params.require(:location).permit(
        :tipo_loc, 
        :qtd_km,
        :dia_loc,
        :valor_loc, 
        :dt_cadastro,
        :dt_devolucao,
        :dt_dia,
        :dt_mes,
        :dt_ano,
        :client_id,
        :vehicle_id, 
        vehicles_attributes:[:vehicle_id, :nome],
        clients_attributes:[:client_id, :nome, :idade, :telefone, :pais, :uf, :cidade, :endereco]
      )
    end
end
