module Users::Finder
  extend ActiveSupport::Concern

  def load_user!(id)
    User.find(id)
  end
end
