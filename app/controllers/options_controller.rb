class OptionsController < ApplicationController
  before_action :find_option, except: [:index, :create]

  def show
    if @option.blank?
      render json: {errors: [not_found_error("Option")]}, status: 404
    else
      render json: @option
    end
  end

  def index
    render json: Option.order(created_at: :desc).page(params[:page])
  end

  def create
    @option = Option.new(option_params)
    if @option.save
      render json: @option
    else
      render json: validation_errors(@option), status: 400
    end
  end

  def update
    if @option.blank?
      render json: not_found_error("Option"), status: 404 and return
    end

    if @option.update_attributes(option_params)
      render json: @option
    else
      render json: validation_errors(@option), status: 400
    end
  end

  def destroy
    if @option.blank?
      render json: not_found_error("Option"), status: 404
    else
      @option.destroy
      render json: @option
    end
  end

  private

  def find_option
    @option = Option.find_by_id(params[:id])
  end

  def option_params
    params.require(:option).permit(:name, model_ids: [], vehicle_ids: [])
  end
end