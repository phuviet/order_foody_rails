# == Schema Information
#
# Table name: roles
#
#  id          :integer          not null, primary key
#  name        :string
#  description :text
#  deleted_at  :datetime
#  created_at  :datetime
#  updated_at  :datetime
#

class Role < ApplicationRecord
  has_paper_trail
  acts_as_paranoid

  # ================Association=====================
  has_many :users

  # ================Validates=====================
  validates :name, presence: true
  validates :name, uniqueness: { scope: :deleted_at }
end
