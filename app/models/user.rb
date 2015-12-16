class User < ActiveRecord::Base
  devise :two_factor_authenticatable,
         # :otp_secret_encryption_key => ENV['ENCRYPTION_KEY']
         :otp_secret_encryption_key => "encryption_key"

  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  def disable_two_factor!
    update_attributes(
      otp_required_for_login:    false,
      encrypted_otp_secret:      nil,
      encrypted_otp_secret_iv:   nil,
      encrypted_otp_secret_salt: nil,
    )
  end
end
