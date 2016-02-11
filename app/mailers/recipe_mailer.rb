class RecipeMailer < ApplicationMailer
  default from: 'cookbook@mailer.com'

  def recipe_email(recipe,destination)
    @recipe = recipe
    mail(to: destination,
         subject: "Cookbook - #{@recipe.name}")
  end
end
