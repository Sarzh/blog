class ArticlesController < ApplicationController

  load_and_authorize_resource

  before_filter :authenticate_user!, :only => [:new, :create]

  def show
    @article = Article.find(params[:id])
  end

  def index
  end

  def new
  end

  def create
    @article = Article.new article_params
    @article.author = current_user.username

    if @article.valid?
      @article.save
      redirect_to @article
    else
      render :new
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
      render :edit
    end
  end

  def destroy
    @article = Article.find(params[:id])
    @article.delete
    render :index
  end

  private

  def article_params
    params.require(:article).permit(:title, :text)
  end

end
