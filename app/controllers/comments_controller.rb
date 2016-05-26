class CommentsController < ApplicationController

  def flagged
    if current_user.organizer
      @comments = Comment.where(flag:true)
    else
      redirect_to root_path
    end
  end

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
    @review = Review.find_by(id: params[:comment][:review_id])
    @comment = Comment.find_by(id: params[:id]) || Comment.find_by( id: params[ :comment ][ :comment_id ] )
    @film = @comment.review.film
    @comment.update_attributes(comments_params)
    redirect_to film_path(@film)
  end

  def destroy
    @comment = Comment.find_by(id: params[:comment][:comment_id])
    @comment.destroy
    redirect_to comments_flagged_path
  end



 private
  def comments_params
    params.require(:comment).permit(:body, :user_id, :review_id, :flag)
  end
end
