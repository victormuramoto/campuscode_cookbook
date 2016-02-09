class RecipePresenter < SimpleDelegator
  include ActionView::Helpers::UrlHelper
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
      button_to t('recipes.buttons.destroy_recipe'), { action: "destroy", id: @recipe.id },
                                      method: :delete, data: { confirm: "Are you sure?" }

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
