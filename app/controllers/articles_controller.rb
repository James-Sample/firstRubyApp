class ArticlesController < ApplicationController
  def index
    @articles = Article.all
  end

  def show
    @article = Article.find(params[:id])
  end

  def new
    @article = Article.new
  end

  def create
    @article = Article.new(article_params)

    if @article.save
      redirect_to @article
      # If the article is saved successfully, the action redirects the browser to the article's page at "http://localhost:3000/articles/#{@article.id}
    else
      render :new, status: :unprocessable_entity  
      # the action redisplays the form by rendering app/views/articles/new.html.erb with status code 422 Unprocessable Entity.
    end
  end

  private
    def article_params
      params.require(:article).permit(:title, :body)
    end
end
