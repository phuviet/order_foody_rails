class ShopDetailOperations::Index < ApplicationOperation
  def call
    ShopDetail.all
  end
end
