class Users::RegistrationsController < Devise::RegistrationsController
  before_action :configure_account_update_params, only: [:update]

  protected

  def configure_account_update_params
    devise_parameter_sanitizer.permit(:account_update, keys: [:distance])
  end

  def update_resource(resource, params)
    resource.update_without_password(params)
  end

  # 必須ではないがupdate後にtop画面にリダイレクトするメソッド
  def after_update_path_for(_resource)
    blogs_path
  end

  def configure_account_update_params
    devise_parameter_sanitizer.permit(:account_update, keys: [:distance])
  end
end