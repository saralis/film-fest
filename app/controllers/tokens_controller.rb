class TokensController < ApplicationController
  include TokensHelper
  def new
    redirect_to root_path if !logged_in? || !current_user.organizer
  end

  def create
    if current_user.organizer == true
      new_token = generate_token
      Token.create( token: new_token )
      @token = new_token
      render template: '/tokens/available'
    else
      @error = 'Sorry, you are unauthorized to generate a token! Please contact the festival organizer or admin. Thank You!'
      render template: '/tokens/new'
    end
  end

  def show
    redirect_to root_path if !logged_in? || !current_user.organizer
    @tokens = Token.where( active: true )
  end
end
