# == Schema Information
#
# Table name: shop_details
#
#  id         :integer          not null, primary key
#  key        :string
#  value      :text
#  deleted_at :datetime
#  created_at :datetime
#  updated_at :datetime
#

class ShopDetail < ApplicationRecord
  has_paper_trail
  acts_as_paranoid

  # ================Validates=====================
  validates :key, presence: true
  validates :value, uniqueness: { scope: :deleted_at }
end
