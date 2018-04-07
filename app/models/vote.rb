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
  validates :user_id, :product_id, :star, presence: true
end
