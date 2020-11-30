class RunnersController < ApplicationController

  def index
    @articles = Article.all
    @meals = Meal.all
    @favorites = Favorite.all
    
  end
    
end
