class RecipesController < ApplicationController
  before_action :authenticate_user!,
                only: [:new, :create, :edit, :update]
  before_action :set_recipe, only: [:edit, :show, :update, :destroy]
  before_action :set_collections, only: [:new, :create, :edit, :update]
  before_action :check_user, only:[:edit,:update]

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

  def destroy
    @recipe.destroy
    respond_with @recipe, location:root_path
  end
  private

  def check_user
     if @recipe.user != current_user
       flash[:notice] = t('recipes.permit.not_allowed')
       redirect_to root_path
     end
  end

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
