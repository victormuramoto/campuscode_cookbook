class FoodTypesController < ApplicationController
  before_action :set_food_type, only: [:show]
  before_action :authenticate_admin!, only: [:new, :create]

  def show
  end

  def new
    @food_type = FoodType.new
  end

  def create
    @food_type = FoodType.create(food_type_params)
    respond_with @food_type
  end

  private

  def set_food_type
    @food_type = FoodType.find(params[:id])
  end

  def food_type_params
    params.require(:food_type).permit(:name)
  end
end
