class ArticlesController < ApplicationController
  include ApplicationHelper
  before_action :set_article, only: %i[show edit update destroy]
  def show; end

  def index
    @articles = Article.all
  end

  def new
    @article = Article.new
  end

  def edit; end

  def create
    @article = Article.new(article_params)
    @article.user = current_user
    if @article.save
      flash[:notice] = 'Article was created succesfully'
      redirect_to article_path(@article)
    else
      render 'new'
    end
  end

  def update
    if @article.update(article_params)
      flash[:notice] = 'Article was updated succesfully'
      redirect_to article_path(@article)
    else
      render 'edit'
    end
  end

  def destroy
    if @article.destroy
      flash[:notice] = 'Article was deleted succesfully'
      redirect_to articles_path
    end
  end

  private

  def set_article
    @article = Article.find(params[:id])
  end

  def article_params
    params.require(:article).permit(:title, :description)
  end
end
