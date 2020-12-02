class MealFavoritesController < ApplicationController

  def create
    @meal = Meal.find(params[:meal_id])
    @favoritee = MealFavorite.find_by(user_id: current_user.id, meal_id: @meal.id )
    if @meal.user_id != current_user.id
      if @favoritee.nil?
        @favorite = MealFavorite.create(user_id: current_user.id, meal_id: @meal.id )
      else  
        @favoritee.destroy
        @favorite = MealFavorite.find_by(user_id: current_user.id, meal_id: @meal.id )
      end  
    else
      redirect_back(fallback_location: meal_path(@meal.id))
    end  
    render json:{ meal: @meal, favorite: @favorite }
  end

end
