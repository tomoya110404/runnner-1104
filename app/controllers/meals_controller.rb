class MealsController < ApplicationController

  def index
    @meals = Meal.all
  end

  def new
    @meal = Meal.new
  end

  def create
    @meal = Meal.new(meals_params)
    if @meal.save
      redirect_to meals_path
    else
      render :new
    end  
  end

  def show
    @meal = Meal.find(params[:id])
    @meals_comment = MealsComment.new
    @meals_comments = @meal.meals_comments.includes(:user)
  end

  private

  def meals_params
    params.require(:meal).permit(:name, :kondate, :recipe, :recipe2, :recipe3, :image).merge(user_id: current_user.id)
  end
  
end
