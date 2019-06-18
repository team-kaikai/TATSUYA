class OrderAppendsController < ApplicationController

  def new
  	@order_append = OrderAppend.new
    @address_nemus = current_end_user.address_menus
  end

  def create
  	@order_append = OrderAppend.new(order_append_params)
  	@order_append.save
  	redirect_to home_success_path
  end

   def order_append_params
    params.permit(:name, :address, :postal_code, :subtotal)
  end


end
