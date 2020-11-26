class RunnersController < ApplicationController

  def index
    @articles = Article.all
    @meals = Meal.all
  end
    
end
