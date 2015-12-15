class UsersController < ApplicationController
  def toggle_otp
    cu = current_user
    cu.otp_required_for_login = !cu.otp_required_for_login
    if cu.otp_required_for_login
      current_user.otp_secret = User.generate_otp_secret
    end
    current_user.save!
    redirect_to root_path
  end
end
