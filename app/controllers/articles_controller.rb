class ArticlesController < ApplicationController
  # we want the user to be authenticated on every action except index and show, so we write that:
  http_basic_authenticate_with name: "dhh", password: "secret", except: [:index, :show]

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
  
  def edit 
    @article = Article.find(params[:id])
  end

  def update 
    @article = Article.find(params[:id])    

    if @article.update(article_params)
      redirect_to @article
    else 
      render :edit, status: :unprocessable_entity
    end
  end

  def destroy 
    @article = Article.find(params[:id])
    @article.destroy

    redirect_to root_path, status: :see_other
  end
  
  private
    def article_params
      params.require(:article).permit(:title, :body, :status)
    end
end
