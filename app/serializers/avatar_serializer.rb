class AvatarSerializer < ApplicationSerializer
  attributes :id, :url

  def url
    path = object.image.url.split('/')
    path.shift(2)
    path.join('/')
  end
end
