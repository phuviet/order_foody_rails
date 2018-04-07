class ProductOperations::Show < ApplicationOperation
  def call
    Product.includes_details.find(params[:id])
  end
end
