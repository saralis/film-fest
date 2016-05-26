class DashboardController < ApplicationController
  include TokensHelper
  include CategoriesHelper

  def index
    if !logged_in? || ( logged_in? && !current_user.organizer )
      redirect_to root_path
    end
  end

  def users
    if logged_in? && current_user.organizer
      @users = User.order( last_name: :ASC )
    else
      redirect_to root_path
    end
  end

  def make_judge
    if logged_in? && current_user.organizer
      user = User.find_by( id: params[ :dashboard_judge ][ :user_id ] )
      if user
        if !Token.where( active: true ).empty?
          token = Token.where( active: true ).sample
          user.update_attributes( judge: true, judge_token: token.token )
          token.update_attributes( active: false )
          redirect_to '/dashboard/users'
        else
          Token.create( token: generate_token, active: false )
          user.update_attributes( judge: true, judge_token: Token.first.token )
          redirect_to '/dashboard/users'
        end
      end
    else
      redirect_to root_path
    end
  end

  def destroy_judge
    if logged_in? && current_user.organizer
      user = User.find_by( id: params[ :dashboard_judge ][ :user_id ] )
      user.update_attributes( judge: false, judge_token: nil )
      redirect_to '/dashboard/users'
    else
      redirect_to root_path
    end
  end

  def categories
    if logged_in? && current_user.organizer
      @categories = Category.all
    else
      redirect_to root_path
    end
  end

  def category_films
    if logged_in? && current_user.organizer
      @films = Film.where( category_id: params[ :id ] )
    else
      redirect_to root_path
    end
  end

  def category_winner
    if logged_in? && current_user.organizer
      @category = Category.find_by( id: params[ :winner ][ :category_id ] )
      @winner = determine_winner( @category )
      Film.find_by( name: @winner ).update_attributes( winner: true )
    else
      redirect_to root_path
    end
  end
end
