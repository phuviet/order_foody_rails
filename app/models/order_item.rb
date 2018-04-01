# == Schema Information
#
# Table name: order_items
#
#  id          :integer          not null, primary key
#  total_price :float
#  quantity    :integer
#  order_id    :integer          not null
#  product_id  :integer          not null
#  deleted_at  :datetime
#  created_at  :datetime
#  updated_at  :datetime
#

class OrderItem < ApplicationRecord
  has_paper_trail
  acts_as_paranoid

  # ================Association=====================
  has_one :order
  has_one :product

  # ================Validates=====================
  validates :order_id, :product_id, :quantity, :total_price, presence: true
end
