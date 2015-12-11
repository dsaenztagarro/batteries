class BatterySizesController < ApplicationController
  before_action :set_battery_size, only: [:show, :edit, :update, :destroy]

  # GET /battery_sizes
  # GET /battery_sizes.json
  def index
    @battery_sizes = BatterySize.all
  end

  # GET /battery_sizes/1
  # GET /battery_sizes/1.json
  def show
  end

  # GET /battery_sizes/new
  def new
    @battery_size = BatterySize.new
  end

  # GET /battery_sizes/1/edit
  def edit
  end

  # POST /battery_sizes
  # POST /battery_sizes.json
  def create
    @battery_size = BatterySize.new(battery_size_params)

    respond_to do |format|
      if @battery_size.save
        format.html { redirect_to @battery_size, notice: 'Battery size was successfully created.' }
        format.json { render :show, status: :created, location: @battery_size }
      else
        format.html { render :new }
        format.json { render json: @battery_size.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /battery_sizes/1
  # PATCH/PUT /battery_sizes/1.json
  def update
    respond_to do |format|
      if @battery_size.update(battery_size_params)
        format.html { redirect_to @battery_size, notice: 'Battery size was successfully updated.' }
        format.json { render :show, status: :ok, location: @battery_size }
      else
        format.html { render :edit }
        format.json { render json: @battery_size.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /battery_sizes/1
  # DELETE /battery_sizes/1.json
  def destroy
    @battery_size.destroy
    respond_to do |format|
      format.html { redirect_to battery_sizes_url, notice: 'Battery size was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private

  # Use callbacks to share common setup or constraints between actions.
  def set_battery_size
    @battery_size = BatterySize.find(params[:id])
  end

  # Never trust parameters from the scary internet, only allow the white list through.
  def battery_size_params
    params[:battery_size]
  end
end
