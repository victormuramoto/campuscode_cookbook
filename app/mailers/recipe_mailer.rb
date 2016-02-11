class RecipeMailer < ApplicationMailer
  default from: 'cookbook@mailer.com'

  def recipe_email(recipe,destination)
    @recipe = recipe
    byebug
    mail(to: destination,
         subject: "Cookbook - #{@recipe.name}")
  end
end
