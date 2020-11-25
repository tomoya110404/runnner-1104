class CommentsController < ApplicationController

  def create
    @comment = Comment.new(comment_params)
    @comment.save
    render json:{ comment: @comment, user: current_user }
  end
  
  def destroy
    @article = Article.find(params[:id])
    @comment = Comment.find(params[:article_id])
    @comment.destroy
    redirect_to article_path(@article.id)
  end

  private

  def comment_params
    params.require(:comment).permit(:comment).merge(user_id: current_user.id, article_id: params[:article_id])
  end  
end
