class ProfileOperations::Index < ApplicationOperation
  def call
    user = User.find(actor.id)
    {
      user: user,
      orders: user.orders
    }
  end
end
