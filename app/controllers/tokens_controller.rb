class TokensController < ApplicationController
  include TokensHelper
  def new
  end

  def create
    if current_user.organizer == true
      new_token = generate_token
      Token.create( token: new_token )
      @token = new_token
      render template: '/tokens/available'
    else
      @error = 'Sorry, you are unauthorized to generate a token! Please contact the festival organiser or admin. Thank You!'
      render template: '/tokens/new'
    end
  end

  def show
    @tokens = Token.where( active: true )
  end
end
