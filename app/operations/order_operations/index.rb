class OrderOperations::Index < ApplicationOperation
  def call
    actor.orders
  end
end
