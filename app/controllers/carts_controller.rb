class CartsController < ApplicationController
  def create
  	@cart = Cart.new(product.id)
  	@cart.save

  end

  def update

  end

  def destroy
  end

  def show
  	binding.pry
  	# if文使って、ユーザー規制する
  	# @cart = Cart.find(params[:id])
  	# カートの中身を全て出すため
  	@carts = Cart.all



  end


end
