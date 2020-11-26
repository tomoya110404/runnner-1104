class MealsCommentsController < ApplicationController

  def create
    @meal_comment = MealsComment.new(meals_comment_params)
    @meal_comment.save
    render json:{ comment: @meal_comment, user: current_user }
  end
  
  def destroy
    @meal = Meal.find(params[:id])
    @meal_comment = MealsComment.find(params[:meal_id])
    @meal_comment.destroy
    redirect_to meal_path(@meal.id)
  end

  private

  def meals_comment_params
    params.require(:meals_comment).permit(:meal_comment).merge(user_id: current_user.id, meal_id: params[:meal_id])
  end  
end


