class FilmsController < ApplicationController
  def show
    @film = Film.find(params[:id])
    @stars = @film.user_avg.round if @film.user_avg != nil
    @reviews = Review.where( film_id: @film.id )
  end

  def live
    film = Film.find_by( id: params[ :display_winner ][ :film_id ] )
    film.update_attributes( live_params)
    redirect_to film_path( film )
  end

  private
  def live_params
    params.require( :display_winner ).permit( :live )
  end
end
