class CommentOperations::Create < ApplicationOperation
  include Comments::Parameter
  include Comments::Finder
  include Users::Finder
  include Products::Finder

  attr_accessor :product, :parent_comment

  def initialize(params, actor)
    super
  end

  def call
    comment = Comment.new(comment_params.merge(user_id: actor.id))
    comment.valid!
    # comment.tap(&:save)
    comment.save!
    Comment.includes(:user, child_comments: :user).where(parent_id: nil).common_order
  end
end
