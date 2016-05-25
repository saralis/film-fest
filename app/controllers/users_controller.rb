class UsersController < ApplicationController

  def new
  end

  def create
    binding.pry
    user = User.new(user_params)
    if user_params[ :password ] == user_params[ :password_confirmation ]
      if user.save
        session[:user_id] = user.id
        redirect_to categories_path
      end
    else
      redirect_to '/signup'
    end
  end


  def show
    @user = User.find(params[:id])
  end


  private
  def user_params
    params.require(:user).permit(:first_name, :last_name, :email, :password, :password_confirmation, :judge, :judge_token, :organizer, :organizer_token)
  end
end
