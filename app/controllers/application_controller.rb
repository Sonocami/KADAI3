class ApplicationController < ActionController::Base
  #ディバイス利用の前にconfigure_permitted_parametersメソッドを実行
before_action :configure_permitted_parameters, if: :devise_controller?

  def after_sign_in_path_for(resource)
    user_path(current_user)#現在ログインしているユーザーを参照している。別のやり方では、リソースのやり方もある。
  end

  def after_sign_out_path_for(resource)
    root_path
  end

  protected

  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: [:name])
  end


#ディバイスのストロングパラメーター的なの
  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: [:email])
  end
end