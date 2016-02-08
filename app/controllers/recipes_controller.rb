class RecipesController < ApplicationController
  before_action :authenticate_user!,
                only: [:new, :create, :edit, :update]
  before_action :set_recipe, only: [:edit, :show, :update]
  before_action :set_collections, only: [:new, :create, :edit, :update]

  def show
  end

  def new
    @recipe = Recipe.new
  end

  def create
    @recipe = Recipe.create(recipe_params.merge(user: current_user))
    respond_with @recipe
  end

  def edit
  end

  def update
    @recipe.update(recipe_params)
    respond_with @recipe
  end

  private

  def set_collections
    @food_types = FoodType.all
    @food_preferences = FoodPreference.all
    @kitchens = Kitchen.all
    @difficulties = %w(Facil Medio Dificil)
  end

  def set_recipe
    @recipe = Recipe.find(params[:id])
  end

  def recipe_params
    params.require(:recipe)
          .permit(:name, :number_people, :time_prepare, :difficult,
                  :ingredients, :description, :food_type_id,
                  :food_preference_id, :kitchen_id, :user_id, :image)
  end
end
