class MakesController < ApplicationController
  before_action :find_make, except: [:index, :create]

  def show
    if @make.blank?
      render json: {errors: [not_found_error("Make")]}, status: 404
    else
      render json: @make
    end
  end

  def index
    render json: Make.order(created_at: :desc).page(params[:page])
  end

  def create
    @make = Make.new(make_params)
    if @make.save
      render json: @make
    else
      render json: validation_errors(@make), status: 400
    end
  end

  def update
    if @make.blank?
      render json: not_found_error("Make"), status: 404 and return
    end

    if @make.update_attributes(make_params)
      render json: @make
    else
      render json: validation_errors(@make), status: 400
    end
  end

  def destroy
    if @make.blank?
      render json: not_found_error("Make"), status: 404
    else
      @make.destroy
      render json: @make
    end
  end

  private

  def find_make
    @make = Make.find_by_id(params[:id])
  end

  def make_params
    params.require(:make).permit(:name)
  end
end