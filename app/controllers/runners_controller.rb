class RunnersController < ApplicationController

  def index
    @articles = Article.all
  end
    
end
