class FavoritesController < ApplicationController

  def create
    @article = Article.find(params[:article_id])
    @favoritee = Favorite.find_by(user_id: current_user.id, article_id: @article.id )
    if @article.user_id != current_user.id
      if @favoritee.nil?
        @favorite = Favorite.create(user_id: current_user.id, article_id: @article.id)
      else  
        @favoritee.destroy
        @favorite = Favorite.find_by(user_id: current_user.id, article_id: @article.id )
      end  
    else
      @comments = @article.comments.includes(:user)
      redirect_to articles_path
    end  
    render json:{ article: @article, favorite: @favorite }
  end

end
