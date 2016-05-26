class FilmsController < ApplicationController
  def show
    # @films = Film.all
  #   if params[:search]
  #     @films = Film.search(params[:search]).order("created_at DESC")
  #   else
  #     @films= Film.all.order('created_at DESC')
  #   end
  #   @film = Film.find(params[:id])
  # end
    # @category = Category.find(params[:id])
    @film = Film.find(params[:id])
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
