module Auths::Parameter
  extend ActiveSupport::Concern

  def auth_params
    params.permit(:email, :password)
  end
end
