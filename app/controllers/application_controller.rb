class ApplicationController < ActionController::Base
  protect_from_forgery
  before_action :authenticate_user!, except: [:top, :about, :logout]
  before_action :configure_permitted_parameters, if: :devise_controller?


  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: [:email])
  end



  def after_sign_in_path_for(resource)
    user_path(resource) # ログイン後に遷移するpathを設定
  end

  def after_sign_out_path_for(resource)
    root_path # ログアウト後に遷移するpathを設定
  end



end
