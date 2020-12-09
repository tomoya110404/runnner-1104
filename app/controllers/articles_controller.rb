class ArticlesController < ApplicationController
  before_action :authenticate_user!, only: [:new, :edit]
  before_action :article_find, only: [:show, :edit, :update, :destroy]
  before_action :not_article_user, only: [:edit]
  
  def index
    @articles = Article.all.includes(:user)
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

  def show
    @comment = Comment.new
    @comments = @article.comments.includes(:user)
    @favorite_new = Favorite.new
  end

  def edit
    unless user_signed_in? && current_user.id == @article.user.id
      redirect_back(fallback_location: meal_path(@meal.id))
    end  
  end

  def update
    if @article.update(article_params)
      redirect_to article_path
    else  
      render :edit
    end    
  end

  def destroy
    @article.destroy
    redirect_to articles_path
  end

  def search
    @article = Article.search(params[:menu])
  end

  private

  def article_find
    @article = Article.find(params[:id])
  end

  def article_params
    params.require(:article).permit(:title, :menu, :hapning, :free_text, :category_id, :image ).merge(user_id: current_user.id)
  end

  def not_article_user
    unless user_signed_in? && current_user.id == @article.user.id
      redirect_back(fallback_location: article_path(@article.id))
    end  
  end
  
end
