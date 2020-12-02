class RunnersController < ApplicationController

  def index
    @articles = Article.all
    @meals = Meal.all
    @favorites = Favorite.all
    @user = User.left_joins(:favorites)
    @b_articles = Article.find(Favorite.group(:article_id).order('count(article_id) desc').limit(3).pluck(:article_id))
    @b_meals = Meal.find(MealFavorite.group(:meal_id).order('count(meal_id) desc').limit(3).pluck(:meal_id))
  end
    
end
