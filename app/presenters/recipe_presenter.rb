class RecipePresenter < SimpleDelegator
  include Rails.application.routes.url_helpers
  attr_reader :recipe

  def initialize(recipe)
    @recipe = recipe
    __setobj__(recipe)
  end

  def eql?(target)
    target == self || recipe.eql?(target)
  end

  def check_destroy(user)
    if user == @recipe.user
      helpers.link_to t('recipes.buttons.destroy_recipe'),
                      recipe_path(recipe),
                      method: :delete, data: { confirm: 'Are you sure?' }
    end
  end

  def inject_favorite_option(user)
    unless user.nil?
      if @recipe.check_like?(user)
        helpers.link_to t('recipes.buttons.like_recipe'),
                        like_recipe_path(recipe),
                        method: :post, data: { confirm: 'Are you sure?' }
      else
        helpers.link_to t('recipes.buttons.unlike_recipe'),
                        unlike_recipe_path(recipe),
                        method: :post, data: { confirm: 'Are you sure?' }
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
