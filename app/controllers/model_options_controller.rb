class ModelOptionsController < ApplicationController

  def create
    model_option = ModelOption.create(model_option_params)
    if model_option.update_attributes(model_option_params)
      render json: model_option
    else
      render json: validation_errors(model_option), status: 400
    end
  end

  def destroy
    if params[:model_id].blank?
      render json: {errors: ["Please specify the model ID."]}, status: 400
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
    model = Model.find_by_id(params[:model_id])
    if model.blank?
      render json: {errors: ["We couldn't find a model with ID #{params[:model_id]}"]}, status: 404
      return
    end

    model_option = model.model_options.where(option_id: option.id).first
    if model_option.blank?
      render json: not_found_error("Model Option"), status: 404
    else
      model_option.destroy
      render json: model_option
    end
  end

  private

  def model_option_params
    params.require(:model_option).permit(:model_id, :option_id)
  end
end