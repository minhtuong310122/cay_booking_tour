module Admin
  class AdminController < ActionController::Base
    layout "layouts/admin"
    before_action :check_admin

    def check_admin
      return if current_user.present? && current_user.admin?

      redirect_to root_path
    end
  end
end
