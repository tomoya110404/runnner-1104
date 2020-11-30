class FavoritesController < ApplicationController

  def create
    @article = Article.find(params[:article_id])
    @favoritee = Favorite.find_by(user_id: current_user.id, article_id: @article.id )
    if @article.user_id != current_user.id
      if @favoritee.nil?
        @favorite = Favorite.create(user_id: current_user.id, article_id: @article.id)
        render json:{ article: @article, favorite: @favorite }
      else  
        @favoritee.destroy
        @favorite = Favorite.find_by(user_id: current_user.id, article_id: @article.id )
        render json:{ article: @article, favorite: @favorite }
      end  
    else
      @comments = @article.comments.includes(:user)
      redirect_to articles_path
    end  
  end

  private

  def favorite_params
    params.require(:favorite).permit(:article_id).merge(user_id: current_user.id)
  end  


end
