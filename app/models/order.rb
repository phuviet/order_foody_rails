# == Schema Information
#
# Table name: orders
#
#  id         :integer          not null, primary key
#  receiver   :string
#  address    :text
#  phone      :string
#  status     :integer
#  user_id    :integer          not null
#  deleted_at :datetime
#  created_at :datetime
#  updated_at :datetime
#

class Order < ApplicationRecord
  has_paper_trail
  acts_as_paranoid

  # ================Association=====================
  has_one :user
  has_many :order_items, dependent: :destroy

  # ================ENUMS=====================
  enum status: %w[saved ordered paid shipped completed declined]

  # ================Validates=====================
  validates :user_id, :receiver, :address, :phone, presence: true
  validates :phone, format: { with: /(09+([0-9]{8})|01+([0-9]{9}))/ }
end
