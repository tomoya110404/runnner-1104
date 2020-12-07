class UsersController < ApplicationController
  before_action :user_find, only: [:show]
  before_action :not_user, only: [:show]

  def show
    @article = @user.articles
    @meal = @user.meals
    @user = User.find(params[:id])
  end

  def update
    @user = User.find(params[:id])
    if @user.update(user_params)
      redirect_to user_path(@user.id)
    else  
      render :show  
    end
  end

  private

  def user_find
    @user = User.find(params[:id])
  end

  def not_user
    unless current_user.id == @user.id
      redirect_to root_path
    end  
  end

  def user_params
    params.require(:user).peermit(:distance)
  end


end
