class VehicleOptionsController < ApplicationController

  def create
    vehicle_option = VehicleOption.create(vehicle_option_params)
    if vehicle_option.update_attributes(vehicle_option_params)
      render json: vehicle_option
    else
      render json: validation_errors(vehicle_option), status: 400
    end
  end

  def destroy
    if params[:vehicle_id].blank?
      render json: {errors: ["Please specify the vehicle ID."]}, status: 400
      return
    end
    if params[:id].blank?
      render json: {errors: ["Please specify the option ID."]}, status: 400
      return
    end

    option = Option.find_by_id(params[:id])
    if option.blank?
      render json: {errors: ["We couldn't find an option with ID #{params[:id]}"]}, status: 404
      return
    end
    vehicle = Vehicle.find_by_id(params[:vehicle_id])
    if vehicle.blank?
      render json: {errors: ["We couldn't find a vehicle with ID #{params[:vehicle_id]}"]}, status: 404
      return
    end

    vehicle_option = vehicle.vehicle_options.where(option_id: option.id).first
    if vehicle_option.blank?
      render json: not_found_error("Vehicle Option"), status: 404
    else
      vehicle_option.destroy
      render json: vehicle_option
    end
  end

  private

  def vehicle_option_params
    params.require(:vehicle_option).permit(:vehicle_id, :option_id)
  end
end