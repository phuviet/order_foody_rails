# == Schema Information
#
# Table name: products_images
#
#  id         :integer          not null, primary key
#  image      :text
#  product_id :integer          not null
#  deleted_at :datetime
#  created_at :datetime
#  updated_at :datetime
#

class ProductsImage < ApplicationRecord
  has_paper_trail
  acts_as_paranoid

  mount_uploader :image, ImageUploader

  # ================Association=====================
  has_many :products

  # ================Validates=====================
  validates :product_id, presence: true
end
