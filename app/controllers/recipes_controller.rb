class RecipesController < ApplicationController
  before_action :set_recipe, only:[:show]
  before_action :set_collections, only:[:new]

  def show
  end

  def new
    @recipe = Recipe.new
  end

  def create
    @recipe = Recipe.new(recipe_params)
    if @recipe.save
      redirect_to @recipe
    else
      render :new
    end
  end

  private

  def set_collections
    @food_types = FoodType.all
    @food_preferences = FoodPreference.all
    @kitchens = Kitchen.all
    @difficulties = [['Fácil'],['Médio'],['Difícil']]
  end

  def set_recipe
    @recipe = Recipe.find(params[:id])
  end

  def recipe_params
    params.require(:recipe)
          .permit(:name,:number_people,:time_prepare,:difficult,:ingredients,
                  :description,:food_type_id,:food_preference,:kitchen)
  end

end
