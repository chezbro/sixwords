class Users::OmniauthCallbacksController < Devise::OmniauthCallbacksController
  include ApplicationHelper
  def twitter
    auth = request.env["omniauth.auth"]
    user = User.find_by_uid(auth["uid"]) || User.create_with_omniauth(auth)
    session[:user_id] = user.id
    session[:friends] = user.get_friends
    redirect_to new_word_path
  end

  def destroy
    session[:user_id] = nil
    redirect_to root_url
  end



end
