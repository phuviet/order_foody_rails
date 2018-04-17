class OrderOperations::Create < ApplicationOperation
  include Orders::Parameter
  include Products::Finder

  attr_reader :order

  def call
    ActiveRecord::Base.transaction do
      create_order!
      create_order_items!
    end
    order
  end

  private

    def create_order!
      @order = Order.new(order_params.merge(user_id: actor.id, status: 0))
      @order.valid!
      @order.tap(&:save)
    end

    def create_order_items!
      params[:cart].each do |cart|
        product  = load_product!(cart[:product_id])
        quantity = cart[:quantity]
        total    = product.price * quantity
        order.order_items.create!(product_id: product.id, quantity: quantity, total_price: total)
      end
    end
end
