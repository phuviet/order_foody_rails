# == Schema Information
#
# Table name: categories
#
#  id          :integer          not null, primary key
#  name        :string
#  description :text
#  deleted_at  :datetime
#  created_at  :datetime
#  updated_at  :datetime
#

class Category < ApplicationRecord
  has_paper_trail
  acts_as_paranoid

  # ================Association=====================
  has_many :products

  # ================Validates=====================
  validates :name, presence: true
  validates :name, uniqueness: { scope: :deleted_at }

  scope :common_order, -> { order(:name) }
end
