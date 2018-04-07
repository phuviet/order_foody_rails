class AvatarSerializer < ApplicationSerializer
  attributes :id, :url

  def url
    object.image.url
  end
end
