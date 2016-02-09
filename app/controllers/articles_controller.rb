class ArticlesController < ApplicationController
  def index
    @articles = Article.all
    render json: @articles, status: :ok
  end

  def show
    render json: article, status: :ok
  end

  def create
    @article = Article.new(article_params)
    if @article.save
      render json: @article, status: :created
    else
      render json: @article.errors.full_messages, status: :unprocessable_entity
    end
  end

  def update
    if article.update(article_params)
      render json: article, status: :ok
    else
      render json: article.errors.full_messages, status: :unprocessable_entity
    end
  end

  def destroy
    article.delete
    head :ok
  end

  private

  def article
    Article.find(params[:id])
  end

  def article_params
    params.require(:article).permit(:title, :body)
  end
end
