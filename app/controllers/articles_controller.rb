class ArticlesController < ApplicationController

  def index
    @articles = Article.all
  end  

  def new
    @article = Article.new
  end

  def create
    @article = Article.new(article_params)
    if @article.save
      redirect_to articles_path
    else  
      render :new
    end    
  end

  private

  def article_params
    params.require(:article).permit(:title, :menu, :hapning, :free_text, :category_id, :image).merge(user_id: current_user.id)
  end
end
