class CartsController < ApplicationController
  def create
  	@cart = Cart.new(cart_params)
  	@cart.enduser_id = current_end_user.id
  	@cart.save
    redirect_to end_user_carts_path(@cart.enduser_id)
  end

  def update

  end

  def destroy
  	@cart.product.destroy
  end

  def show
  	# if文使って、ユーザー規制する
  	# @cart = Cart.find(params[:id])
  	# カートの中身を全て出すため
  	@carts = Cart.all
  	# @cart = Cart.find(params[:id])
  end

  private
   def cart_params
   	params.require(:cart).permit(:quantity,:product_id)
   end

end
