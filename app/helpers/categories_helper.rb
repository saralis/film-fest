module CategoriesHelper
  def determine_winner( category )
    averages = {}

    category.films.each do | film |
      if ( film.user_avg != nil && !film.user_avg.nan? ) && ( film.judge_avg != nil && !film.judge_avg.nan? )
        judge_average = ( film.judge_avg * 1.25 ).round( 2 )
        averages[ film.name ] = ( film.user_avg + judge_average ).round( 2 )
      end
    end
    winner = averages.max_by { | film, avg | avg }[ 0 ]
  end
end
