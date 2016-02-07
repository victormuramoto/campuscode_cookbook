class HomeController < ApplicationController
  def index
    @recipes = Recipe.all.order('id DESC').limit(20)
    @kitchens = Kitchen.all
    @food_preferences = FoodPreference.all
    @food_types = FoodType.all
  end
end
