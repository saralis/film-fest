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

    @film = Film.find(params[:id])
    @reviews = Review.where( film_id: @film.id )
  end
end
