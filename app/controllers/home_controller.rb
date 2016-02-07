class HomeController < ApplicationController
  def index
    @recipes = Recipe.all.order('id DESC').limit(20)
  end
end
