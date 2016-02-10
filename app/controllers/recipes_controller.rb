class RecipesController < ApplicationController
  before_action :authenticate_user!,
                only: [:new, :create, :edit, :update, :destroy, :like, :unlike]
  before_action :set_recipe, only: [:edit,
                                    :update,
                                    :destroy,
                                    :like,
                                    :unlike]
  before_action :set_recipe_presenter, only: [:show]
  before_action :add_user_recipe, only: [:like]
  before_action :remove_user_recipe, only: [:unlike]
  before_action :set_collections, only: [:new, :create, :edit, :update]
  before_action :check_user, only: [:edit, :update]

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
    respond_with @recipe, location: root_path
  end

  def like
    @recipe.likes = @recipe.likes + 1
    @recipe.save
    respond_with @recipe
  end

  def unlike
    @recipe.likes = @recipe.likes - 1
    @recipe.save
    respond_with @recipe
  end

  def favorite
    @liked_recipes = Recipe.all.joins(
      'INNER JOIN user_recipes ON recipes.id = user_recipes.recipe_id
       INNER JOIN users ON user_recipes.user_id = users.id')
                           .where("users.id = #{current_user.id}")
  end

  def email
    destination = params[:destination]
  end

  private

  def set_recipe_presenter
    @recipe = RecipePresenter.new(Recipe.find(params[:id]))
  end

  def add_user_recipe
    @user_recipe = UserRecipe.new
    @user_recipe.user_id = current_user.id
    @user_recipe.recipe_id = @recipe.id
    @user_recipe.save
  end

  def remove_user_recipe
    @user_recipe = UserRecipe.find_by_recipe_id(@recipe.id)
    @user_recipe.destroy
  end

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
