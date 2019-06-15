class CartsController < ApplicationController
  def create
	@cart = current_cart
	product = Product.find(params[:product_id])
  end

  def update
  end

  def destroy
  	@cart.product.destroy
  end

  def show
  end

end
