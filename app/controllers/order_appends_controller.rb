class OrderAppendsController < ApplicationController

  def new
  	@order_append = OrderAppend.new
    @address_nemus = current_end_user.address_menus
  end

  def create
  	@order_append = OrderAppend.new(order_append_sub_params)

    @order_append.enduser_id = current_end_user.id
    @order_append.save
    redirect_to order_appends_new_path
  end

  def update
    @order_append = OrderAppend.new(order_append_params)

    #情報を受注一覧に持っていくために必要
     @order_append.name = AddressMenu.find(params[:address]).name
     @order_append.postal_code = AddressMenu.find(params[:address]).postal_code
     @order_append.address = AddressMenu.find(params[:address]).address
     @order_append.enduser_id = AddressMenu.find(params[:address]).enduser_id

    @order_append.update(order_append_params)
    redirect_to home_success_path
  end

   def order_append_params
    params.require(:order_append).permit(:pay)

  end

  def order_append_sub_params
    params.require(:order_append).permit(:subtotal)
  end




end
