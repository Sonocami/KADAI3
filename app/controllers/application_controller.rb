class ApplicationController < ActionController::Base
  #ディバイス利用の前にconfigure_permitted_parametersメソッドを実行
before_action :configure_permitted_parameters, if: :devise_controller?

  protected

#ディバイスのストロングパラメーター的なの
  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: [:name])
  end
end