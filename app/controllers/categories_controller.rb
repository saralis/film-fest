class CategoriesController < ApplicationController
  def index
    @categories = Category.all
  end

  def show
    @category = Category.find(params[:id])
    @films = Film.where( category_id: @category.id )
    @rated_films = @films.select { |film| film if film.user_avg }
    @rated_films.sort!{ |a,b| a.user_avg <=> b.user_avg}.reverse!
    @non_rated_films = @films - @rated_films

    # @rated_films = @films.where( ratings.length >= 1)
  end

end
