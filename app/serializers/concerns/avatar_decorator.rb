module AvatarDecorator
  def avatar
    path = object.avatar.url.split('/')
    path.shift(2)
    path.join('/')
  end
end
