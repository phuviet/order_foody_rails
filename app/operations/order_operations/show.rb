class OrderOperations::Show < ApplicationOperation
  def call
    Order.find_by!(user_id: actor.id, id: params[:id])
  end
end
