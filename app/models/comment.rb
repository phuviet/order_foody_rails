# == Schema Information
#
# Table name: comments
#
#  id         :integer          not null, primary key
#  context    :text
#  user_id    :integer          not null
#  product_id :integer          not null
#  parent_id  :integer
#  deleted_at :datetime
#  created_at :datetime
#  updated_at :datetime
#

class Comment < ApplicationRecord
  has_paper_trail
  acts_as_paranoid

  # ================Association=====================
  belongs_to :user
  belongs_to :product
  has_many :child_comments, class_name: Comment.name,
                            foreign_key: :parent_id, dependent: :destroy
  belongs_to :parent_comment, class_name: Comment.name, foreign_key: :parent_id, optional: true

  # ================Validates=====================
  validates :product_id, :context, presence: true
  validates :product_id, existence: true
  validates :parent_id, existence: Comment.name, if: -> { parent_id.present? }

  scope :common_order, -> { order(created_at: :desc) }
end
