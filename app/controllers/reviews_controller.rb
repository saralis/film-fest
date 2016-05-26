class ReviewsController < ApplicationController

  def new
    @film = Film.find(params[:id])
    @review = Review.new
  end

  def create
  end

  def show
    @review = Review.find(params[:id])
    @comments = Comment.where( comment_id: @comment.id )
  end

end
