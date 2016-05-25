class UsersController < ApplicationController

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

  private
  def user_params
    params.require(:user).permit(:first_name, :last_name, :email, :password, :password_confirmation, :judge, :organizer)
  end
end
