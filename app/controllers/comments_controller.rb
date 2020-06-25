class CommentsController < ApplicationController
  include CommentsHelper

  before_action :require_login, except: [:create]

  def create
    @comment = Comment.new(comment_params)
    @comment.article_id = params[:article_id]

    @comment.save

    redirect_to article_path(@comment.article)
  end

  def destroy
    @comment = Comment.find(params[:id])
    @article = Article.find("#{@comment.article_id}")
    flash.notice = "Comment Deleted!"
    @comment.destroy
    redirect_to article_path(@article)
  end

end
