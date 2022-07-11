module Users
  class RegistrationsController < Devise::RegistrationsController
    def sign_up_params
      params.require(:user).permit(:email, :name, :password, :password_confirmation)
    end
  end
end
