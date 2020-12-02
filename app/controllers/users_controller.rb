class UsersController < ApplicationController
  before_action :user_find, only: [:show]
  before_action :not_user, only: [:show]

  def show
    @article = @user.articles
    @meal = @user.meals
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


end
