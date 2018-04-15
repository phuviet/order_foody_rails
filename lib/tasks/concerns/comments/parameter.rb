module Comments::Parameter
  extend ActiveSupport::Concern

  def comment_params
    params.permit(:product_id, :parent_id, :context)
  end
end
