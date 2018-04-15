class VoteOperations::Create < ApplicationOperation
  include Votes::Parameter

  attr_accessor :product_id

  def initialize(params, actor)
    super
    @product_id = params[:product_id]
  end

  def call
    vote = Vote.new(vote_params.merge(user_id: actor.id))
    vote.valid!
    # comment.tap(&:save)
    vote.save!
    Vote.includes(:user).where(product_id: product_id).common_order
  end
end
