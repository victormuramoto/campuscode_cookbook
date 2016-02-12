class RecipePresenter < SimpleDelegator
  include Rails.application.routes.url_helpers
  attr_reader :recipe

  def initialize(recipe)
    @recipe = recipe
    __setobj__(recipe)
  end

  def check_edit(user)
    if user == @recipe.user
      helpers.link_to t('recipes.buttons.edit_recipe'),
                      edit_recipe_path(recipe),
                      method: :get,
                      class: 'btn btn-default'
    end
  end

  def check_destroy(user)
    if user == @recipe.user
      helpers.link_to t('recipes.buttons.destroy_recipe'),
                      recipe_path(recipe),
                      method: :delete, data: { confirm: 'Are you sure?' },
                      class: 'btn btn-danger'
    end
  end

  def inject_favorite_option(user)
    unless user.nil?
      if @recipe.check_like?(user)
        helpers.link_to t('recipes.buttons.like_recipe'),
                        like_recipe_path(recipe),
                        method: :post, class: 'btn btn-warning'
      else
        helpers.link_to t('recipes.buttons.unlike_recipe'),
                        unlike_recipe_path(recipe),
                        method: :post, class: 'btn btn-warning'
      end
    end
  end

  private

  def helpers
    ApplicationController.helpers
  end

  def t(*args)
    I18n.translate(*args)
  end
end
