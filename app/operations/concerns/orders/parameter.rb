module Orders::Parameter
  extend ActiveSupport::Concern

  def order_params
    params.permit(:receiver, :address, :phone)
  end
end
