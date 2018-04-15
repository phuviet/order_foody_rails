module Auths::Finder
  extend ActiveSupport::Concern

  def generate_access_token(actor)
    payload = Auths::CreateSerializer.new(actor).as_json
    JsonWebToken.encode(payload)
  end

  def save_access_token!(user, access_token)
    api_key = ApiKey.find_or_initialize_by(user_id: user.id)
    api_key.access_token = access_token
    api_key.save!
    api_key
  end
end
