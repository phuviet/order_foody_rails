module Users::Parameter
  extend ActiveSupport::Concern

  def user_update_params
    params.permit(:email, :first_name, :last_name, :middle_name, :phone, :address, :gender,
                  :birthday, :avatar)
  end
end
