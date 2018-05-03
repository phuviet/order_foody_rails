module Users::Finder
  extend ActiveSupport::Concern

  def load_user!(id)
    User.incudes_order.find(id)
  end
end
