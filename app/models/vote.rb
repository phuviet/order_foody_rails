# == Schema Information
#
# Table name: votes
#
#  id         :integer          not null, primary key
#  product_id :integer          not null
#  user_id    :integer          not null
#  star       :integer
#  deleted_at :datetime
#  created_at :datetime
#  updated_at :datetime
#

class Vote < ApplicationRecord
  has_paper_trail
  acts_as_paranoid

  # ================Association=====================
  belongs_to :user
  belongs_to :product

  # ================Validates=====================
  validates :product_id, :star, presence: true
  validates :product_id, existence: true
  validates :star, uniqueness: { scope: %i[deleted_at product_id user_id] }

  scope :common_order, -> { order(created_at: :desc) }
end
