class CommentsController < ApplicationController

  def new
    @comment = Comment.new(params[:comment])
    @review_id = params[:review_id]
  end

  def create
    @film = Film.find(params[:id])
    @comment = Comment.new(params[:body])

    if @comment.save
      redirect_to film_path
    else
      render template: '/comments/new'
    end
  end
end
