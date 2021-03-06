class VehiclesController < ApplicationController
  before_action :find_vehicle, except: [:index, :create]

  def show
    if @vehicle.blank?
      render json: {errors: [not_found_error("Vehicle")]}, status: 404
    else
      render json: @vehicle, include: 'make,model,options'
    end
  end

  def index
    render json: Vehicle.order(created_at: :desc).page(params[:page]), include: 'make,model,options'
  end

  def create
    @vehicle = Vehicle.new(vehicle_params)
    if @vehicle.save
      options = Option.where(id: params[:vehicle][:option_ids])
      @vehicle.options << options
      render json: @vehicle, include: 'make,model,options'
    else
      render json: validation_errors(@vehicle), status: 400
    end
  end

  def update
    if @vehicle.blank?
      render json: not_found_error("Vehicle"), status: 404 and return
    end

    if @vehicle.update_attributes(vehicle_params)
      @vehicle.options.destroy_all
      options = Option.where(id: params[:vehicle][:option_ids])
      @vehicle.options << options
      render json: @vehicle, include: 'make,model,options'
    else
      render json: validation_errors(@vehicle), status: 400
    end
  end

  def destroy
    if @vehicle.blank?
      render json: not_found_error("Vehicle"), status: 404
    else
      @vehicle.destroy
      render json: @vehicle
    end
  end

  private

  def find_vehicle
    @vehicle = Vehicle.find_by_id(params[:id])
  end

  def vehicle_params
    params.require(:vehicle).permit(:year, :description, :make_id, :model_id)
  end
end