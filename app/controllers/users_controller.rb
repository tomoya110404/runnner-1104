class UsersController < ApplicationController
  before_action :user_find, only: [:show, :editsub, :update, :updatesub, :following, :followers]
  before_action :not_user, only: [:update, :updatesub]

  def show
    @article = @user.articles
    @meal = @user.meals
  end

  def editsub
  end

  def update
    if @user.update(user_params)
      redirect_to user_path(@user.id)
    else  
      render :show
    end
  end

  def updatesub
    @user_distance = @user.distance.to_i - user_params[:distance].to_i
    goal_calc(@user_distance)
  end

  def following
    @users = @user.following
  end

  def followers
    @users = @user.followers
  end

  def new

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
    params.require(:user).permit(:distance)
  end

  def goal_calc(today_distance)
    if  today_distance >= 0
      if @user.update(distance: today_distance)
        if @user.distance == 0
          redirect_to new_user_path
        else
          redirect_to user_path(@user.id)
        end
      else 
        redirect_to user_path(@user.id)
      end  
    else  
      flash.now[:alert] = '目標の数字を超えています。'
      render :show
    end  
  end
  
end
