class FavoriteCountsController < ApplicationController

  def create
    binding.pry
    if @article.user.id != current_user.id   # 投稿者本人以外に限定
      @favorite = FavoriteCount.create(user_id: current_user.id, article_id: @article.id)

    end
  end

  # お気に入り削除
  def destroy
    @favorite = FavoriteCount.find_by(user_id: current_user.id, article_id: @article.id)
    @favorite.destroy
  end

  private
  def set_post
    @article = Article.find(params[:article_id])
  end

end
