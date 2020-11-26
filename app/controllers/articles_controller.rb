class ArticlesController < ApplicationController
  before_action :authenticate_user!, only: [:new, :edit]
  before_action :article_find, only: [:show, :edit, :update, :destroy]
  
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

  def show
    @comment = Comment.new
    @comments = @article.comments.includes(:user)
  end

  def edit
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

  def checked
    @article = Article.find(params[:id])
    if @article.checked 
      @article.update(checked: false)
    else
      @article.update(checked: true)
    end

    item = Article.find(params[:id])
    render json: { article: item }
  end


  private

  def article_find
    @article = Article.find(params[:id])
  end

  def article_params
    params.require(:article).permit(:title, :menu, :hapning, :free_text, :category_id, :image ).merge(user_id: current_user.id)
  end
end
