class UsersController < ApplicationController

  def show
    @user = User.find(params[:id])
    @article = @user.articles
    @meal = @user.meals
  end

end
