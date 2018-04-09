class ProductWatched < ApplicationRecord
  has_paper_trail
  acts_as_paranoid

  # ================Association=====================
  has_one :order
  has_one :product
end
