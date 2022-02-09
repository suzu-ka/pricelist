class ApplicationController < ActionController::Base

  before_action :configure_permitted_parameters, if: :devise_controller?

  protected
  def configure_permitted_parameters
    # サインアップ時にnameのストロングパラメータを追加
    devise_parameter_sanitizer.permit(:sign_up, keys: [:user_name, :image])
    # アカウント編集の時にnameとprofileのストロングパラメータを追加
    devise_parameter_sanitizer.permit(:account_update, keys: [:user_name, :profile, :image])
  end

end

class ApplicationController < ActionController::Base
  before_action :set_request_variant

  private
    def set_request_variant
      case request.user_agent
      when /iPad/
        request.variant = :ipad
      when /iPhone/
        request.variant = :phone
      when /Android/
        request.variant = :phone
      end
  end
end