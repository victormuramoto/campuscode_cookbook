class HomeController < ApplicationController
  def index
    @liked_recipes = Recipe.all.where('likes > 0').order('likes DESC').limit(5)
    @recipes = Recipe.all.order('id DESC').limit(20)
    @kitchens = Kitchen.all
    @food_preferences = FoodPreference.all
    @food_types = FoodType.all
  end
end
