class ApplicationController < ActionController::Base
  before_action :authenticate_user!

  def after_sign_in_path_for(resource)
    users_show_path # ログイン後に遷移するpathを設定
  end
end
