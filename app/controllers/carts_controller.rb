class CartsController < ApplicationController
  def create
  	@cart = Cart.new(cart_params)
  	@cart.enduser_id = current_end_user.id
    if @cart.blank?
      @cart = current_cart.cart.build(product_id: params[:product_id])
    end
    @cart.quantity += params[:quantity].to_i
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
    @cart_less = current_end_user.carts
    @fee = 500
    # @cart_my = Cart.where(user_id: current_end_user.id)
    


     # if @cart.stock != 0
    #  @cart_less.each do |cart|
    #   (1..cart.product.stock).each do |s|
    #     add_limit = [s,s]
    #     @limit.push(add_limit)
    #   end
    # end

  end

  private
   def cart_params
   	params.require(:cart).permit(:quantity,:product_id)
   end

end
