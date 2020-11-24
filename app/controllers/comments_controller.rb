class CommentsController < ApplicationController

  def create
    @comment = Comment.new(comment_params)
    if @comment.save
      redirect_to article_path(@comment.article.id)
    else
      @article = @comment.article
      render "articles/show"
    end  
  end
  

  private

  def comment_params
    params.require(:comment).permit(:comment).merge(user_id: current_user.id, article_id: params[:article_id])
  end  
end
