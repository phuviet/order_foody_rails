module Users::Parameter
  extend ActiveSupport::Concern

  def user_update_params
    params.permit(:email, :first_name, :last_name, :middle_name, :phone, :address, :gender,
                  :birthday, :avatar)
  end

  def user_register_params
    params.permit(:email, :password, :password_confirmation)
  end

  def user_confirm_params
    params.permit(:first_name, :last_name, :middle_name, :phone, :address, :gender)
  end
end
