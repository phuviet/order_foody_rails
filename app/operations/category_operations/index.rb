class CategoryOperations::Index < ApplicationOperation
  def call
    Category.all
  end
end
