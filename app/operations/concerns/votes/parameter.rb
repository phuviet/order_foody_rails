module Votes::Parameter
  extend ActiveSupport::Concern

  def vote_params
    params.permit(:product_id, :star, :description)
  end
end
