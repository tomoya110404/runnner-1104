class MealsController < ApplicationController
  before_action :authenticate_user!, only: [:new, :edit]
  before_action :meal_find, only: [:show, :edit, :update, :destroy]
  before_action :not_meal_user, only: [:edit]

  def index
    @meals = Meal.all.page(params[:page]).per(2)
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
    @meals_comment = MealsComment.new
    @meals_comments = @meal.meals_comments.includes(:user)
    @favorite_new = MealFavorite.new
  end

  def edit
  end

  def update
    if @meal.update(meals_params)
      redirect_to meal_path
    else  
      render :edit
    end    
  end


  def destroy
    @meal.destroy
    redirect_to meals_path
  end

  def search
    @meal = Meal.search(params[:kondate])
  end


  private

  def meal_find
    @meal = Meal.find(params[:id])
  end

  def meals_params
    params.require(:meal).permit(:name, :kondate, :recipe, :recipe2, :recipe3, :image).merge(user_id: current_user.id)
  end

  def not_meal_user
    unless user_signed_in? && current_user.id == @meal.user.id
      redirect_back(fallback_location: meal_path(@meal.id))
    end  
  end
  
end
