class FoodPreferencesController < ApplicationController
  before_action :set_food_preference, only: [:show]
  before_action :authenticate_admin!, only: [:new, :create]

  def show
  end

  def new
    @food_preference = FoodPreference.new
  end

  def create
    @food_preference = FoodPreference.create(food_preference_params)
    respond_with @food_preference
  end

  private

  def set_food_preference
    @food_preference = FoodPreference.find(params[:id])
  end

  def food_preference_params
    params.require(:food_preference).permit(:name)
  end
end
