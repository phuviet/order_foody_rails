class CategoryOperations::Index < ApplicationOperation
  def call
    Category.common_order
  end
end
