class Auths::AccessTokenSerializer < ApplicationSerializer
  attributes :access_token

  def access_token
    object[:access_token]
  end
end
