class Auths::CreateSerializer < ApplicationSerializer
  attribute(:user) do
    Users::AttributesSerializer.new(object).as_json
  end
end
