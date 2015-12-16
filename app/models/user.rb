class User < ActiveRecord::Base
  devise :two_factor_authenticatable,
         # :otp_secret_encryption_key => ENV['ENCRYPTION_KEY']
         :otp_secret_encryption_key => "encryption_key"

  devise :two_factor_backupable, otp_number_of_backup_codes: 10
  serialize :otp_backup_codes, JSON

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
      otp_backup_codes:          nil
    )
  end
end
