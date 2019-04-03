class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

def after_sign_in_path_for(resource)
  @user = current_user ? current_user : User.find_by(email: params[:user][:email])
  church_path(@user.church)
end

end
