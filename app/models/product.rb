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
  belongs_to :category
  has_many :order_items
  has_many :orders, through: :order_items, dependent: :destroy
  has_many :comments, dependent: :destroy
  has_many :parent_comments, -> { where(parent_id: nil) }, class_name: Comment.name
  has_many :votes, dependent: :destroy
  has_many :products_images, dependent: :destroy

  # ================Validates=====================
  validates :category_id, presence: true
  validates :name, presence: true
  validates :name, uniqueness: { scope: :deleted_at }

  scope :common_order, -> { order(:name) }
  scope :top_newest, -> { order(created_at: :desc).limit(SystemConfig.top_newest.value) }
  scope :top_seller, -> {
    joins(:order_items).group('products.id').order('SUM(order_items.quantity) DESC')
                       .limit(SystemConfig.top_newest.value)
  }
  scope :includes_details, -> {
    includes(:category, :products_images, :votes, parent_comments: [:user, child_comments: :user])
  }
end
