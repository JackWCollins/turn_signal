class ModelsController < ApplicationController
  before_action :find_model, except: [:index, :create]

  def show
    if @model.blank?
      render json: {errors: [not_found_error("Model")]}, status: 404
    else
      render json: @model
    end
  end

  def index
    render json: Model.order(created_at: :desc).page(params[:page])
  end

  def create
    @model = Model.new(model_params)
    if @model.save
      render json: @model
    else
      render json: validation_errors(@model), status: 400
    end
  end

  def update
    if @model.blank?
      render json: not_found_error("Model"), status: 404 and return
    end

    if @model.update_attributes(model_params)
      render json: @model
    else
      render json: validation_errors(@model), status: 400
    end
  end

  def destroy
    if @model.blank?
      render json: not_found_error("Model"), status: 404
    else
      @model.destroy
      render json: @model
    end
  end

  private

  def find_model
    @model = Model.find_by_id(params[:id])
  end

  def model_params
    params.require(:model).permit(:name, :make_id)
  end
end