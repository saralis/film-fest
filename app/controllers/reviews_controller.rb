class ReviewsController < ApplicationController

  def new
    @film = Film.find(params[:id])
    @review = Review.new
  end

  def create
    @film = Film.find(params[:id])

    @review = Review.create(reviews_params)
    redirect_to film_path(@film)
  end

  def show
    @review = Review.find(params[:id])
    @comments = Comment.where( comment_id: @comment.id )
  end


private
  def reviews_params
    params.require(:review).permit(:title, :body, :user_id, :film_id)
  end
end
