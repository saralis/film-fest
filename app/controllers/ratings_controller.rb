class RatingsController < ApplicationController

  def create

    @film = Film.find_by(id: params[:film][:film_id])
    @film.ratings.create(params[:film])
    redirect_to film_path(@film)
  end

  private
  def ratings_params
    params.require(:film).permit(:value, :user_id, :film_id)
  end
end
