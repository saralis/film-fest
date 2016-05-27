class FilmsController < ApplicationController
  def index
    @found_film = Film.find_by(name: params[:search].capitalize)

    if request.xhr?
      if @found_film != nil
        render template: '/films/_redirect', layout: false, locals: { film: @found_film }
      else
        render template: '/films/_not_found', layout: false
      end
    end
  end

  def show

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
