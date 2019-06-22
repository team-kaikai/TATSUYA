class OrderAppendsController < ApplicationController
  # showに対してbefore_action等でアクセス制限を掛けておく必要があります。

  def show
  	@order_append = OrderAppend.find(params[:id])
    @address_nemus = current_end_user.address_menus
    @end_users =  current_end_user
  end

  def create
  	@order_append = OrderAppend.new(order_append_sub_params)

    @order_append.enduser_id = current_end_user.id
    @order_append.save
    redirect_to order_append_path(@order_append)
  end

  def update
    @carts = Cart.where(enduser_id: current_end_user.id)
    @order_append = OrderAppend.find(params[:id])
    if params[:address].to_i > 0#0以上
    #address_menuで処理
      @order_append.name = AddressMenu.find(params[:address]).name
      @order_append.postal_code = AddressMenu.find(params[:address]).postal_code
      @order_append.address = AddressMenu.find(params[:address]).address
      @order_append.enduser_id = AddressMenu.find(params[:address]).enduser_id
    else
    #userの住所で処理
      @order_append.name = current_end_user.first_name + current_end_user.last_name
      @order_append.postal_code = current_end_user.postal_code
      @order_append.address = current_end_user.address
      @order_append.enduser_id = current_end_user.id
    end
      @carts.each do |cart|
        @order_detail = @order_append.order_details.build
        @order_detail.product_id = cart.product.id
        @order_detail.price = cart.product.price
        @order_detail.quantity = cart.quantity
        @order_detail.save!
        cart.destroy
      end

    @order_append.pay =  params[:order_append][:pay].to_i
    @order_append.save
    redirect_to home_success_path
  end

   def order_append_params
    params.require(:order_append).permit(:pay)

  end

  def order_append_sub_params
    params.require(:order_append).permit(:subtotal)
  end

  # def order_detail_params
  #   params.require(:order_detail).permit(:product_id,:price,:quantitye)
  # end




end
