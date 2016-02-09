class CommentsController < ApplicationController
  def index
    comments = article.comments
    render json: comments, status: :ok
  end

  def create
    comment = article.comments.create(comment_params)
    if comment.save
      render json: comment, status: :created
    else
      render comment.errors.full_messages, status: :unprocessable_entity
    end
  end

  def update
    if comment.update(comment_params)
      render json: comment, status: :ok
    else
      render json: comment.errors.full_messages, status: :unprocessable_entity
    end
  end

  def destroy
    article.comments.find(params[:id]).delete
    head :ok
  end

  private

  def article
    Article.find(params[:article_id])
  end

  def comment
    Comment.find(params[:id])
  end

  def comment_params
    params.require(:comment).permit(:author, :body)
  end
end
