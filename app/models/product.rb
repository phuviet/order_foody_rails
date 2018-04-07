# == Schema Information
#
# Table name: products
#
#  id          :integer          not null, primary key
#  name        :string
#  price       :float
#  avatar      :text
#  description :text
#  star        :integer
#  category_id :integer          not null
#  deleted_at  :datetime
#  created_at  :datetime
#  updated_at  :datetime
#

class Product < ApplicationRecord
  has_paper_trail
  acts_as_paranoid

  mount_uploader :avatar, ImageUploader

  # ================Association=====================
  has_one :category
  has_many :order_items
  has_many :orders, through: :order_items, dependent: :destroy
  has_many :comments, dependent: :destroy
  has_many :votes, dependent: :destroy
  has_many :products_images, dependent: :destroy

  # ================Validates=====================
  validates :category_id, presence: true
  validates :name, presence: true
  validates :name, uniqueness: { scope: :deleted_at }

  scope :common_order, -> { order(:name) }
end
