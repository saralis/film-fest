class UsersController < ApplicationController
  include UsersHelper
  def new
  end

  def create
    @user = User.new(user_params)
    if user_params[ :password ] == user_params[ :password_confirmation ]
      if @user.save
        session[:user_id] = @user.id
        redirect_to categories_path
      else
        @errors = @user.errors.full_messages
        render template: '/users/new'
      end
    else
      @user.save
      @errors = @user.errors.full_messages
      render template: '/users/new'
    end
  end


  def show
    @user = User.find(params[:id])
  end

  def secret
  end

  def new_judge
    if check_tokens( params[:secret][:secret_key] )
      @token = params[:secret][:secret_key]
      render template: '/users/new_judge'
    else
      @error = 'Your token is either no longer valid or incorrect!'
      render template: '/users/secret'
    end
  end

  def create_judge
    token = params[ :user ][ :judge_token ]
    if check_tokens( token )
      @user = User.new( user_params )
      if @user.save
        @user.update_attributes( judge: true )
        update_token = Token.find_by( token: token )
        update_token.update_attributes( active: false )
        session[ :user_id ] = @user.id
        redirect_to root_path
      end
    else
    end
  end

  private
  def user_params
    params.require(:user).permit(:first_name, :last_name, :email, :password, :password_confirmation, :judge, :judge_token, :organizer)
  end
end
