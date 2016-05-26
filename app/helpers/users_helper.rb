module UsersHelper
  def check_tokens( token )
    token = Token.find_by( token: token )

    if token && token.active == true
      return true
    else
      return false
    end
  end
end
