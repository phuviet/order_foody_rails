module Products::Finder
  extend ActiveSupport::Concern

  def load_product!(id)
    Product.find(id)
  end
end
