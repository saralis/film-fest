class CommentsController < ApplicationController

  def new
    @review = Review.find_by(id: params[:id])
    @comment = Comment.new(params[:comment])
  end

  def create
    @comment = Comment.create!(comments_params)
    @review = Review.find_by(id: params[:id])
    @film = @review.film
    redirect_to film_path(@film)
  end

  def update
    @comment = Comment.find_by(id: params[:comment][:comment_id])
    @film = @comment.review.film
    @comment.update_attributes(flag: true)
    redirect_to film_path(@film)
  end

  def edit

    @comment = Comment.find_by(id: params[:id])

    @review = @comment.review
  end


 private
  def comments_params
    params.require(:comment).permit(:body, :user_id, :review_id)
  end
end
