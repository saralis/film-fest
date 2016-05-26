class CategoriesController < ApplicationController
  def index
    @categories = Category.all
  end

  def show
    @category = Category.find(params[:id])
    @films = Film.where( category_id: @category.id )
    @reviews = []
    @films.each { | film | @reviews << film.reviews if !film.reviews.empty? }
    @reviews = @reviews.sort_by{ |review| review[0].created_at }[0..2]

    @rated_films = @films.select { |film| film if film.user_avg }
    @rated_films.sort!{ |a,b| a.user_avg <=> b.user_avg}.reverse!
    @non_rated_films = @films - @rated_films
  end

end
