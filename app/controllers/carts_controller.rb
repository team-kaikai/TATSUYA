class CartsController < ApplicationController
  def create
    # if @cart
    #   @cart = current_cart.cart.build(product_id: params[:product_id])
    # end

    #　この下　application/controllerに current_cartのメソッド記述あり
    @hoge = Product.find(params[:product_id])
    @cart = current_cart(@hoge)
    @cart.enduser_id = current_end_user.id
    # この下の一文で、足したquantityが反映されている
    @cart.quantity += params[:cart][:quantity].to_i
    if @cart.quantity >= @hoge.stock
       @cart.quantity = @hoge.stock
       flash[:notice] = "購入個数が在庫数を超えたので、限界の数とさせて頂きます"
    end

  	@cart.save
    redirect_to end_user_carts_path(@cart.enduser_id)
  end

  def update
    @cart = Cart.find(params[:id])
    @cart.update(cart_params)
    redirect_to end_user_carts_path

  end

  def destroy
  	cart = Cart.find_by(id: params[:id])
    cart.destroy
    redirect_to end_user_carts_path(current_end_user.id)
  end

  def show

  	# if文使って、ユーザー規制する
  	# @cart = Cart.find(params[:id])
  	# カートの中身を全て出すため
  	@carts = Cart.all
    @cart_less = current_end_user.carts
    # 配送料
    @fee = 500
    # 消費税
    @tax = 1.08
    @order_append = OrderAppend.new



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
