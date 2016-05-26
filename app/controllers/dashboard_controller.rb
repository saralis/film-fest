class DashboardController < ApplicationController
  include TokensHelper
  def users
    @users = User.order( last_name: :ASC )
  end

  def make_judge
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
  end

  def destroy_judge
    user = User.find_by( id: params[ :dashboard_judge ][ :user_id ] )
    user.update_attributes( judge: false, judge_token: nil )
    redirect_to '/dashboard/users'
  end
end
