class RatingsController < ApplicationController

  def create
    custom_params = ratings_params
    custom_params[ :value ] = ratings_params[ :ratings ]
    custom_params.delete( :ratings )

    @film = Film.find_by(id: params[:film][:film_id])
    Rating.create(custom_params)
    redirect_to film_path(@film)
    @judge_ratings = @film.ratings.select{ |rating| rating.user.judge}


  end

  private
  def ratings_params
    params.require(:film).permit(:ratings, :user_id, :film_id)
  end
end
