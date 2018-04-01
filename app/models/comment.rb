# == Schema Information
#
# Table name: comments
#
#  id         :integer          not null, primary key
#  context    :text
#  user_id    :integer          not null
#  product_id :integer          not null
#  parent_id  :integer          not null
#  deleted_at :datetime
#  created_at :datetime
#  updated_at :datetime
#

class Comment < ApplicationRecord
  has_paper_trail
  acts_as_paranoid

  # ================Association=====================
  has_one :user
  has_one :product
  has_many :child_comments, class_name: Comment.name,
                            foreign_key: :parent_id, dependent: :destroy
  belongs_to :parent_comment, class_name: Comment.name, foreign_key: :parent_id

  # ================Validates=====================
  validates :user_id, :product_id, :context, presence: true
end
