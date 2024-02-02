class ArticlesController < ApplicationController
  before_action :authenticate_user!, except: [:index, :show]
  load_and_authorize_resource
  before_action :set_article, only: [:show, :edit, :update, :destroy]
  
  def index
    @articles = Article.all
  end

  def show
  end

  def new
    @article = Article.new
  end

  def create
    @article = current_user.articles.create(article_params)

    if @article.save
      current_user.add_role :author, @article
      redirect_to @article
    else
      render :new, status: :unprocessable_entity
    end
  end

  def edit
  end

  def update
    if @article.update(article_params)
      redirect_to @article
    else
      render :edit, status: :unprocessable_entity
    end
  end

  def destroy
    @article.destroy
    redirect_to root_path, status: :see_other, notice: 'Article deleted Successfully'
  end


  private
  def article_params
    params.require(:article).permit(:title, :body)
  end

  def set_article
    @article = Article.friendly.find(params[:id])
  end
end
